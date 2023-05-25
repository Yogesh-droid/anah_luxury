import 'package:flutter_bloc/flutter_bloc.dart';

class BookingPageControllerIndexCubit extends Cubit<int> {
  BookingPageControllerIndexCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}
