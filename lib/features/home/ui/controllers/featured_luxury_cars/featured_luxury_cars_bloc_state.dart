// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'featured_luxury_cars_bloc_bloc.dart';

@immutable
abstract class FeaturedLuxuryCarsBlocState {}

class FeaturedLuxuryCarsBlocInitial extends FeaturedLuxuryCarsBlocState {}

class FeaturedLuxuryCarsREsState extends FeaturedLuxuryCarsBlocState {
  final List<FeaturedLuxuryCarsEntity> featuredCarsList;
  final List<FeaturedLuxuryCarsEntity> luxuryCarsList;
  FeaturedLuxuryCarsREsState({
    required this.featuredCarsList,
    required this.luxuryCarsList,
  });
}

class FeaturedluxuryCarsErrorState extends FeaturedLuxuryCarsBlocState {
  final Exception? err;
  FeaturedluxuryCarsErrorState({
    this.err,
  });
}
