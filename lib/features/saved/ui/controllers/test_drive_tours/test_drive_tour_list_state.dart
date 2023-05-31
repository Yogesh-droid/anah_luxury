part of 'test_drive_tour_list_bloc.dart';

@immutable
abstract class TestDriveTourListState {}

class TestDriveTourListInitial extends TestDriveTourListState {}

class TestDrivesFetchedState extends TestDriveTourListState {
  final List<TestdriveListEntity> testDriveList;

  TestDrivesFetchedState({required this.testDriveList});
}

class ToursFetchedState extends TestDriveTourListState {
  final List<TestdriveListEntity> toursList;

  ToursFetchedState({required this.toursList});
}

class TestDrivesFailedState extends TestDriveTourListState {
  final Exception exception;

  TestDrivesFailedState(this.exception);
}

class ToursFailedState extends TestDriveTourListState {
  final Exception exception;

  ToursFailedState(this.exception);
}
