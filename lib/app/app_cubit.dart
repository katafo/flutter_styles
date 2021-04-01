import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styles/app/app_state.dart';
import 'package:flutter_styles/common/utils/styles.dart';

class AppCubit extends Cubit<AppState> {

  AppStyles styles = DefaultStyles();

  AppCubit() : super(AppInitital());

  void changeStyle(AppStyles styles) {
    this.styles = styles;
    emit(AppChangeStyleSuccess());
  }

}