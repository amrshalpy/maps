import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hms/constants/api_key.dart';
import 'package:hms/constants/constants.dart';
import 'package:hms/screens/branches.dart';
import 'package:hms/screens/home.dart';
import 'package:hms/screens/intro_slider.dart';
import 'package:hms/screens/login_screen.dart';
import 'package:hms/screens/patient/cubit/cubit.dart';
import 'package:hms/screens/patient/cubit/employee_cubit.dart';
import 'package:hms/screens/profile_screen.dart';
import 'package:hms/screens/splash_screen.dart';
import 'package:hms/share/network/dio_helper.dart';
import 'package:hms/share/remote/cache_helper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  uid = CacheHelper.getData(key: ktokenApi);
  // print(uid);
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PatientCubit>(
          create: (context) => PatientCubit(),
        ),
        BlocProvider<EmployeeCubit>(
          create: (context) => EmployeeCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'HMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Cairo',
        ),
        home: SplashScreen(),
      ),
    );
  }
}
