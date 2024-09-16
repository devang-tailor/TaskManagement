import 'package:taskmanagement/res/exports/common_exports.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskProvider).loadTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvideWatch = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: HeadlineText(
          title: LocaleKeys.addTask.tr(),
          titleColor: ColorConstants.whiteColor,
        ),
        backgroundColor: ColorConstants.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: ColorConstants.whiteColor),
      ),
      body: Padding(
        padding: PaddingConstant.scaffoldPaddingWithTop,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: LocaleKeys.taskTitle.tr(),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.primaryColor),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.enterTaskTitle.tr();
                  }
                  return null;
                },
              ),
              20.0.spaceY,
              TextFormField(
                maxLines: 10,
                controller: _descriptionController,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  labelText: LocaleKeys.taskDescription.tr(),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConstants.primaryColor),
                  ),
                ),
              ),
              20.0.spaceY,
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Task task = Task(
                      id: DateTime.now().millisecondsSinceEpoch,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      isCompleted: false,
                    );
                    taskProvideWatch.addTask(task);
                    Navigator.pop(context);
                  }
                },
                text: LocaleKeys.addTask.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
