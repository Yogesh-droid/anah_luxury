import 'package:flutter_bloc/flutter_bloc.dart';

class BookingTimesliderControllerCubit extends Cubit<int> {
  BookingTimesliderControllerCubit() : super(10);
  void updateTime(int time) {
    emit(time);
  }
}
