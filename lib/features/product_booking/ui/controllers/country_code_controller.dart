import 'package:anah_luxury/features/product_booking/data/models/country_code_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCodeController extends Cubit<CountryCodeModel> {
  CountryCodeController(super.initialState);

  void changeCountryCode(CountryCodeModel countryCodeModel) {
    emit(countryCodeModel);
  }
}
