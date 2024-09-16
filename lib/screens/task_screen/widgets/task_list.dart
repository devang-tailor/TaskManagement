import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/res/exports/common_exports.dart';

class TaskListWidget extends ConsumerWidget {
  final List<Task> tasks;

  const TaskListWidget({super.key, required this.tasks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TaskProvider taskProviderWatch = ref.watch(taskProvider);
    final FilterProvider filterProviderWatch = ref.watch(filterProvider);

    if (filterProviderWatch.filter == 'all' &&
        filterProviderWatch.getFilteredTasks(tasks).isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.task,
              color: ColorConstants.primaryColor,
              size: MediaQuery.of(context).size.height * 0.15,
            ),
            20.0.spaceY,
             TitleText(
              title: LocaleKeys.addYourTask.tr(),
              maxLine: 4,
              titleTextAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (filterProviderWatch.filter == 'completed' &&
        filterProviderWatch
            .getFilteredTasks(tasks)
            .where((task) => task.isCompleted)
            .toList()
            .isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done_all,
              color: ColorConstants.successColor,
              size: MediaQuery.of(context).size.height * 0.15,
            ),
            20.0.spaceY,
            TitleText(
              title: LocaleKeys.youDontHaveAnyCompletedTask.tr(),
              maxLine: 4,
              titleTextAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (filterProviderWatch.filter == 'pending' &&
        filterProviderWatch
            .getFilteredTasks(tasks)
            .where((task) => !task.isCompleted)
            .toList()
            .isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pending_actions,
              color: ColorConstants.warningColor,
              size: MediaQuery.of(context).size.height * 0.15,
            ),
            20.0.spaceY,
            TitleText(
              title: LocaleKeys.youDontHaveAnyPendingTask.tr(),
              maxLine: 4,
              titleTextAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filterProviderWatch.getFilteredTasks(tasks).length,
      itemBuilder: (context, index) {
        Task task = filterProviderWatch.getFilteredTasks(tasks)[index];
        return Card(
          elevation: 5, // Add a modern elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Add a modern shape
          ),
          child: ListTile(
            title: HeadlineText(
              title: task.title,
              titleColor: ColorConstants.primaryColor,
            ),
            subtitle: Subtitle(title: task.description ?? ''),
            trailing: SizedBox(
              width: MediaQuery.of(context).size.width * 0.23,
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      if (!task.isCompleted) {
                        await _showUpdateCompletedDialog(
                          context,
                          task,
                          taskProviderWatch,
                          !task.isCompleted,
                        );
                      }
                    },
                    child: task.isCompleted
                        ? Icon(Icons.check_circle,
                            color: ColorConstants
                                .successColor) // Add a modern icon color
                        : const Icon(
                            Icons.check_circle_outline,
                          ),
                  ),
                  10.0.spaceX,
                  InkWell(
                    onTap: () async {
                      await _showUpdateDialog(context, task, taskProviderWatch);
                    },
                    child: Icon(Icons.edit_outlined,
                        color: ColorConstants
                            .primaryColor), // Add a modern icon color
                  ),
                  10.0.spaceX,
                  InkWell(
                    onTap: () async {
                      await _showDeleteDialog(context, task, taskProviderWatch);
                    },
                    child: Icon(Icons.cancel_outlined,
                        color: ColorConstants
                            .warningColor), // Add a modern icon color
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showUpdateDialog(
      BuildContext context, Task task, TaskProvider taskProviderWatch) async {
    final formKey = GlobalKey<FormState>();
    String title = task.title;
    String description = task.description ?? '';
    bool isCompleted = task.isCompleted;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow the bottom sheet to scroll
      builder: (context) {
        return Padding(
          padding:
              MediaQuery.of(context).viewInsets, // Add padding for keyboard
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  10.0.spaceY,
                  TextFormField(
                    initialValue: title,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.taskTitle.tr(),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.enterTaskTitle.tr();
                      }
                      return null;
                    },
                    onSaved: (value) => title = value!,
                  ),
                  20.0.spaceY,
                  TextFormField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: LocaleKeys.taskDescription.tr(),
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor),
                      ),
                    ),
                    initialValue: description,
                    onSaved: (value) => description = value!,
                  ),
                  10.0.spaceY,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomElevatedButtonExpanded(
                        text: LocaleKeys.cancel.tr(),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      10.0.spaceX,
                      CustomElevatedButtonExpanded(
                        text: LocaleKeys.update.tr(),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            Task updatedTask = Task(
                              id: task.id,
                              title: title,
                              description: description,
                              isCompleted: isCompleted,
                            );
                            await taskProviderWatch.updateTask(updatedTask);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDeleteDialog(
      BuildContext context, Task task, TaskProvider taskProviderWatch) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: HeadlineText(
            title: LocaleKeys.deleteTask.tr(),
            titleColor: ColorConstants.primaryColor,
          ),
          content: TitleText(
            title: LocaleKeys.deleteConformation.tr(),
            maxLine: 2,
          ),
          actions: [
            CustomElevatedButton(
              text: LocaleKeys.cancel.tr(),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CustomElevatedButton(
              text: LocaleKeys.delete.tr(),
              onPressed: () async {
                await taskProviderWatch.deleteTask(task);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showUpdateCompletedDialog(
    BuildContext context,
    Task task,
    TaskProvider taskProviderWatch,
    bool isCompleted,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: HeadlineText(
            title: LocaleKeys.updateTaskStatus.tr(),
            titleColor: ColorConstants.primaryColor,
          ),
          content: TitleText(
            maxLine: 2,
            title: LocaleKeys.areYouSureYouWantToCompleteThisTask.tr(),
          ),
          actions: [
            CustomElevatedButton(
              text: LocaleKeys.cancel.tr(),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CustomElevatedButton(
              text: LocaleKeys.update.tr(),
              onPressed: () async {
                await taskProviderWatch.updateTask(Task(
                  id: task.id,
                  title: task.title,
                  description: task.description,
                  isCompleted: isCompleted,
                ));
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
