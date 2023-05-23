part of 'property_detail_bloc.dart';

@immutable
abstract class PropertyDetailState {}

class PropertyDetailInitial extends PropertyDetailState {}

class PropertyDetailFetchedState extends PropertyDetailState {
  final PropertyDetailEntity propertyDetailEntity;

  PropertyDetailFetchedState({required this.propertyDetailEntity});
}

class PropertyDetailError extends PropertyDetailState {
  final Exception exception;

  PropertyDetailError({required this.exception});
}
