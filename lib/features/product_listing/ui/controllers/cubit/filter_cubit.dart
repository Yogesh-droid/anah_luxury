import 'package:anah_luxury/core/constants/strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<String> {
  FilterCubit() : super(kPrice);

  void addFilter(String selectedFilter) {
    emit(selectedFilter);
  }
}
