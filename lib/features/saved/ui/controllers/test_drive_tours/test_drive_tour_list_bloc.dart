import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/saved/domain/entities/testdrives_list_entity.dart';
import 'package:anah_luxury/features/saved/domain/usecases/testdrives_list_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_drive_tour_list_event.dart';
part 'test_drive_tour_list_state.dart';

class TestDriveTourListBloc
    extends Bloc<TestDriveTourListEvent, TestDriveTourListState> {
  final TestDrivesListUsecase testDrivesListUsecase;
  List<TestdriveListEntity> testDriveList = [];
  List<TestdriveListEntity> toursList = [];
  TestDriveTourListBloc(this.testDrivesListUsecase)
      : super(TestDriveTourListInitial()) {
    on<TestDriveTourListEvent>((event, emit) async {
      if (event is GetTestDriveAndToursList) {
        switch (event.categorySlug) {
          case 'cars':
            try {
              DataState<List<TestdriveListEntity>> dataState =
                  await testDrivesListUsecase.call(RequestParams(
                      url:
                          "${baseUrl}v1/client/getBookedTestDriveTour?category=${event.categorySlug}",
                      apiMethods: ApiMethods.get,
                      header: header));
              if (dataState.data != null) {
                testDriveList = dataState.data!;
                emit(TestDrivesFetchedState(testDriveList: dataState.data!));
              } else {
                emit(TestDrivesFailedState(Exception("Data is Null")));
              }
            } on Exception catch (e) {
              emit(TestDrivesFailedState(e));
            }
            break;
          case 'real-estate':
            try {
              DataState<List<TestdriveListEntity>> dataState =
                  await testDrivesListUsecase.call(RequestParams(
                      url:
                          "${baseUrl}v1/client/getBookedTestDriveTour?category=${event.categorySlug}",
                      apiMethods: ApiMethods.get,
                      header: header));
              if (dataState.data != null) {
                toursList = dataState.data!;
                emit(ToursFetchedState(toursList: dataState.data!));
              } else {
                emit(ToursFailedState(Exception("Data is Null")));
              }
            } on Exception catch (e) {
              emit(ToursFailedState(e));
            }
            break;
          default:
            emit(TestDriveTourListInitial());
        }
      }
    });
  }
}
