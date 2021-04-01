import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styles/common/utils/styles.dart';
import 'package:provider/provider.dart';

import '../app_cubit.dart';
import '../app_cubit.dart';
import '../app_state.dart';

class ZAnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;

  ZAnimatedToggle({
    Key key,
    @required this.values,
    @required this.onToggleCallback,
  }) : super(key: key);

  @override
  _ZAnimatedToggleState createState() => _ZAnimatedToggleState();
}

class _ZAnimatedToggleState extends State<ZAnimatedToggle> {
  AppCubit appCubit;
  @override
  void initState() {
    super.initState();
    appCubit= context.read<AppCubit>();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        return Container(
          width: width * .7,
          height: width * .13,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onToggleCallback(1);
                },
                child: Container(
                  width: width * .7,
                  height: width * .13,
                  decoration: ShapeDecoration(
                      color:appCubit.styles.getToggleBackgroundColor(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * .1))),
                  child: Row(
                    children: List.generate(
                      widget.values.length,
                          (index) =>
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: width * .1),
                            child: Text(
                              widget.values[index],
                              style: TextStyle(
                                  fontSize: width * .05,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF918f95)),
                            ),
                          ),
                    ),
                  ),
                ),
              ),
              AnimatedAlign(
                alignment: appCubit.styles is  DefaultStyles
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                duration: Duration(milliseconds: 350),
                curve: Curves.ease,
                child: Container(
                  alignment: Alignment.center,
                  width: width * .35,
                  height: width * .13,
                  decoration: ShapeDecoration(
                      color: appCubit.styles.getToggleButtonColor(),
                      shadows: appCubit.styles.getToggleButtonShadow(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * .1))),
                  child: Text(
                    appCubit.styles is  DefaultStyles
                        ? widget.values[0]
                        : widget.values[1],
                    style: TextStyle(
                        fontSize: width * .045, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }
}