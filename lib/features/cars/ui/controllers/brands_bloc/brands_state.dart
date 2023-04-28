// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brands_bloc.dart';

@immutable
abstract class BrandsState {}

class BrandsInitial extends BrandsState {}

class BrandsSuccessState extends BrandsState {
  final List<BrandsEntity> brandsList;
  BrandsSuccessState({
    required this.brandsList,
  });
}

class BrandsErrorState extends BrandsState {
  final Exception exception;
  BrandsErrorState({
    required this.exception,
  });
}
