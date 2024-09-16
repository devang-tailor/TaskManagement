import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/res/exports/common_exports.dart';


final languageProvider = StateProvider((ref) => 'en');


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(taskProvider).loadTasks();
      ref.read(themeModeProvider).loadThemeMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvideWatch = ref.watch(taskProvider);
    final FilterProvider filterProviderWatch = ref.watch(filterProvider);

    var language = ref.watch(languageProvider);

    return Scaffold(
      appBar: AppBar(
        title: HeadlineText(
          title: LocaleKeys.task.tr(),
          titleColor: ColorConstants.whiteColor,
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: ColorConstants.whiteColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Row(
            children: [
              DropdownButton<String>(
                value: filterProviderWatch.filter,
                onChanged: (value) {
                  filterProviderWatch.setFilter(value!);
                },
                items:  [
                  DropdownMenuItem<String>(
                    value: 'all',
                    child: TitleText(
                      title: LocaleKeys.all.tr(),
                      titleColor: ColorConstants.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'completed',
                    child: TitleText(
                      title: LocaleKeys.completed.tr(),
                      titleColor: ColorConstants.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'pending',
                    child: TitleText(
                      title: LocaleKeys.pending.tr(),
                      titleColor: ColorConstants.whiteColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                icon: const Icon(
                  Icons.filter_list,
                  color: ColorConstants.whiteColor,
                ),
                iconSize: 24,
                elevation: 8,
                dropdownColor: ColorConstants.blackColor,
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: TitleText(title: LocaleKeys.darkMode.tr()),
              onTap: () {
                ref.read(themeModeProvider.notifier).toggleTheme();
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(LocaleKeys.changeLanguage.tr()),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(LocaleKeys.changeLanguage.tr()),
                      content:DropdownButton<String>(
                        value: language,
                        onChanged: (language) async {
                          if (language == 'en') {
                            context.setLocale(const Locale('en', ''));
                          } else if (language == 'hi') {
                            context.setLocale(const Locale('hi', ''));
                          }else if (language == 'gu') {
                            context.setLocale(const Locale('gu', ''));
                          }
                          Navigator.of(context).pop();
                        },
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'en',
                            child: TitleText(title: 'English'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'hi',
                            child: TitleText(title: 'हिन्दी'),
                          ), DropdownMenuItem<String>(
                            value: 'gu',
                            child: TitleText(title: 'ગુજરાતી'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: PaddingConstant.bottomNavPadding,
        child: CustomButton(
          text: LocaleKeys.addTask.tr(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: PaddingConstant.scaffoldPaddingWithTop,
        child: TaskListWidget(tasks: taskProvideWatch.tasks),
      ),
    );
  }
}
