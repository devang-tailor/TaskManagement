import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskmanagement/res/exports/common_exports.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeModeProvider().loadThemeMode();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('hi'), Locale('gu')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const ProviderScope(child: MyApp())),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider).themeMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Management App',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: Themes.themeData,
      darkTheme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      ),
      themeMode: themeMode,
      home: const HomeScreen(),
    );
  }
}