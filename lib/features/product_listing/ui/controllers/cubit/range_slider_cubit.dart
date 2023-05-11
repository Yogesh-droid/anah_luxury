import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RangeSliderCubit extends Cubit<RangeValues> {
  RangeSliderCubit() : super(const RangeValues(0.0, 0.0));

  void onChangeValue(RangeValues values) {
    emit(values);
  }
}
