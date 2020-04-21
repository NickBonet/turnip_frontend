import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:turnip_frontend/TurnipRouter.dart';
import 'package:turnip_frontend/stores/UserStateStore.dart';

Future main() async {
  TurnipRouter.setupRouter();
  await DotEnv().load('.env');
  runApp(
    Provider(
      create: (context) => UserStateStore(),
      child: TurnipApp()
    )
  );
}

class TurnipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Turnip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      onGenerateRoute: TurnipRouter.router.generator,
    );
  }
}




