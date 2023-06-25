import 'presentation/screens/auth/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cache_helper.dart';
import 'core/helper_method.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  // CacheHelper.clear();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECO',
        navigatorKey: navigatorKey,
        // You can use the library anywhere in the app even in theme
        theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.transparent),
        ),
        home: child,
      ),
      child: const SplashScreen(),
    );
  }
}
