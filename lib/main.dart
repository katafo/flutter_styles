import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styles/app/app_cubit.dart';
import 'package:flutter_styles/app/app_state.dart';
import 'package:flutter_styles/common/utils/styles.dart';

import 'app/example/example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AppCubit(), child: MyHomePage(title: 'Flutter Styles'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppCubit _appBloc;

  @override
  void initState() {
    super.initState();
    _appBloc = context.read<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return MaterialApp(
            theme: _appBloc.styles.getThemeData(),
            home: HomePage());
      },
    );
  }
}
