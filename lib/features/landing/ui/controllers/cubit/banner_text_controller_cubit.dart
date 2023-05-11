import 'package:flutter_bloc/flutter_bloc.dart';

class BannerTextControllerCubit extends Cubit<String> {
  BannerTextControllerCubit() : super("Luxury Homes");

  void changeText(String value) {
    emit(value);
  }
}
