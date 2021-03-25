import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styles/app/app_cubit.dart';
import 'package:flutter_styles/app/app_state.dart';
import 'package:flutter_styles/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Styles'),
      )
    );
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
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello world!',
                  style: _appBloc.styles.getTitleStyle(),
                ),
                const SizedBox(height: 20,),
                FlatButton(
                  child: Text('Default Style'),
                  onPressed: () => _appBloc.changeStyle(DefaultStyles()),
                ),
                FlatButton(
                  child: Text('Special Style'),
                  onPressed: () => _appBloc.changeStyle(SpecialStyles()),
                )
              ],
            ),
          ),
        );  
      },
    );
  }
}
