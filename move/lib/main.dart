import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move/feature/home/presentation/manger/cubit/movies_cubit.dart';
import 'package:move/feature/home/presentation/view/tabs_view_home/movie.dart';
import 'package:move/feature/home/presentation/view/tabs_view_home/tv_series.dart';
import 'package:move/feature/home/presentation/view/tabs_view_home/up_coming.dart';

import 'core/routes/app_routes.dart';
import 'feature/home/presentation/manger/home_cubit/home_cubit.dart';
import 'feature/home/presentation/view/home_view.dart';

void main() {
  runApp(const MoveApp());
}

class MoveApp extends StatelessWidget {
  const MoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => MoviesCubit()..getAllMovies()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                background: Colors.black, seedColor: Colors.purpleAccent),
            useMaterial3: true),
        onGenerateRoute: AppRoute.generateRoute,
        initialRoute: AppRoute.splashView,
      ),
    );
  }
}
