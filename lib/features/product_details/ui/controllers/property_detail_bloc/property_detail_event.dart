part of 'property_detail_bloc.dart';

@immutable
abstract class PropertyDetailEvent {}

class GetPropertyDetailEvent extends PropertyDetailEvent {
  final String slug;

  GetPropertyDetailEvent({required this.slug});
}
