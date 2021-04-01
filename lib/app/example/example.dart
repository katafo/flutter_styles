import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styles/common/utils/styles.dart';
import 'package:provider/provider.dart';

import '../app_cubit.dart';
import '../app_state.dart';
import 'custom_toggle.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  AppCubit _appBloc;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
    _appBloc = context.read<AppCubit>();
  }

  // function to toggle circle animation
  changeThemeMode(bool isDarkMode) {
    if (!isDarkMode) {
      _animationController.forward(from: 0.0);
    } else {
      _animationController.reverse(from: 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // Now we have access to the theme properties
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: height * 0.1),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: width * 0.35,
                      height: width * 0.35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: _appBloc.styles.getLinearGradientColor(),
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(40, 0),
                      child: ScaleTransition(
                        scale: _animationController.drive(
                          Tween<double>(begin: 0.0, end: 1.0).chain(
                            CurveTween(curve: Curves.decelerate),
                          ),
                        ),
                        alignment: Alignment.topRight,
                        child: Container(
                          width: width * .26,
                          height: width * .26,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _appBloc.styles.getSunColor(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.1),
                Text(
                  'Choose a style',
                  style: TextStyle(
                      fontSize: width * .06, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.03),
                Container(
                  width: width * .6,
                  child: Text(
                    'Pop or subtle. Day or night. Customize your interface',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height * 0.1),
                ZAnimatedToggle(
                  values: ['Light', 'Dark'],
                  onToggleCallback: (v) async {
                    if(_appBloc.styles is DefaultStyles)
                      _appBloc.changeStyle(DarkStyles());
                    else
                      _appBloc.changeStyle(DefaultStyles());
                    changeThemeMode(_appBloc.styles is DarkStyles);

                  },
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildDot(
                      width: width * 0.022,
                      height: width * 0.022,
                      color: const Color(0xFFd9d9d9),
                    ),
                    buildDot(
                        width: width * 0.055,
                        height: width * 0.022,
                        color: _appBloc.styles.getDotStyle()),
                    buildDot(
                      width: width * 0.022,
                      height: width * 0.022,
                      color: const Color(0xFFd9d9d9),
                    ),
                  ],
                ),
                // skip & next
              ],
            ),
          ),
        ),
      );
    });
  }

// for drawing the dots
  Container buildDot({double width, double height, Color color}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
      ),
    );
  }
}
