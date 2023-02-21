import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/domain/core/di/injectable.dart';

import 'package:netflix_clone/presentation/root_pages/root_page.dart';

//? Here we used domain driven architecture ,
//
//* -- Presentation folder is the ui ,
//
//* -- Infrastructure is the data implementation ,
//
//* -- Domain is  where we add models to parse json in the api ,
// *      in domain we use json to dart extension to make the models
//
//* -- Application is where the block models (used freezed to simplify the bloc) ,
//
//* -- Core folder is for the constant value's

//? here we make the main function as future to configure Injection
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //*here we need to wrap the main widget with block provider ,
    // * then only the widget will know we are using "bloc"
    //? we used multiProvider instead of block provider ,
    //? so we can add multiple provider in the app
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<FastLaughBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<HotAndNewBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.black),
          //* font family
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primarySwatch: Colors.blue,
          colorScheme: const ColorScheme.dark(),
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: const RootPage(),
      ),
    );
  }
}
