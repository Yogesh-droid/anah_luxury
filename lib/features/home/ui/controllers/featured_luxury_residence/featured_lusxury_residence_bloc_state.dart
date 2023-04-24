part of 'featured_lusxury_residence_bloc_bloc.dart';

@immutable
abstract class FeaturedLusxuryResidenceBlocState {}

class FeaturedLusxuryResidenceBlocInitial
    extends FeaturedLusxuryResidenceBlocState {}

class FeaturedLuxuryResidenceResState
    extends FeaturedLusxuryResidenceBlocState {
  final List<FeaturedLuxuryResidenceResEntity> featuredApartments;
  final List<FeaturedLuxuryResidenceResEntity> luxuryApartment;

  FeaturedLuxuryResidenceResState(
      {required this.featuredApartments, required this.luxuryApartment});
}
