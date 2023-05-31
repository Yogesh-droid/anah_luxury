part of 'test_drive_tour_list_bloc.dart';

@immutable
abstract class TestDriveTourListEvent {}

class GetTestDriveAndToursList extends TestDriveTourListEvent {
  final String? categorySlug;

  GetTestDriveAndToursList({required this.categorySlug});
}
