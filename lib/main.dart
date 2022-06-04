import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/bloc/game_bloc.dart';
import 'package:sportwin_predictor/presentation/resources/route_manager.dart';

import 'data/repositories/local/pref_repository.dart';
import 'presentation/resources/theme_manager.dart';

Future<void> main() async {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await PreferenceRepository.initializePreference();

      runApp(const MyApp());
    },
    // blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameBloc()..add(const InitialEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sport Win',
        theme: getApplicationTheme(context),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.playRoute,
      ),
    );
  }
}
