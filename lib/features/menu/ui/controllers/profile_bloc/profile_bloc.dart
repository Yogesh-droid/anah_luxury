import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/menu/domain/entities/profile_entity.dart';
import 'package:anah_luxury/features/menu/domain/usecases/profile_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/hive/local_storage.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUsecase profileUsecase;
  late ProfileEntity profileEntity;
  ProfileBloc({required this.profileUsecase}) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      final token = LocalStorage.instance.token;
      if (event is GetProfileEvent) {
        try {
          if (token != null) {
            final DataState<ProfileEntity> dataState =
                await profileUsecase.call(RequestParams(
                    url: "${baseUrl}auth/user",
                    apiMethods: ApiMethods.get,
                    header: {"Authorization": "Bearer $token"}));

            profileEntity = dataState.data!;
            emit(ProfileFetchedState(profileEntity: dataState.data!));
          } else {
            emit(ProfileFailedState(
                exception: Exception("Authentication Failed")));
          }
        } on Exception catch (e) {
          emit(ProfileFailedState(exception: e));
        }
      }
    });
  }
}
