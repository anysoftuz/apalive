import 'dart:io';

import 'package:apalive/app/auth/auth_bloc.dart';
import 'package:apalive/app/bloc/app_bloc.dart';
import 'package:apalive/app/controller.dart';
import 'package:apalive/assets/colors/colors.dart';
import 'package:apalive/infrastructure/core/service_locator.dart';
import 'package:apalive/infrastructure/repo/storage_repository.dart';
import 'package:apalive/presentation/routes/app_routes.dart';
import 'package:apalive/presentation/routes/route_name.dart';
import 'package:apalive/utils/bloc_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await StorageRepository.getInstance();
  setupLocator();
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => serviceLocator<AuthBloc>()..add(CheckUserEvent()),
        ),
        BlocProvider(create: (context) => serviceLocator<AppBloc>()),
        ChangeNotifierProvider(create: (_) => JitsiProvider()),
      ],
      child: MaterialApp.router(
        title: 'APA LIVE',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: white,
          bottomAppBarTheme: BottomAppBarTheme(color: white),
          dividerTheme: DividerThemeData(color: Color(0xFFE9EAEB)),
          appBarTheme: AppBarTheme(
            foregroundColor: white,
            backgroundColor: white,
            surfaceTintColor: white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: textPrimary900,
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        routerConfig: AppRouts.router,
        builder:
            (context, child) => BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                debugPrint('STATE LISTENER ============> //${state.status}');
                switch (state.status) {
                  case AuthenticationStatus.unauthenticated:
                    AppRouts.router.pushReplacement(AppRouteName.auth);
                    break;
                  case AuthenticationStatus.authenticated:
                    AppRouts.router.go(AppRouteName.home);
                    break;
                  case AuthenticationStatus.loading:
                  case AuthenticationStatus.cancelLoading:
                    break;
                }
              },
              child: KeyboardDismisser(child: child),
            ),
      ),
    );
  }
}
