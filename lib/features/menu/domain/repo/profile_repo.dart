import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/menu/domain/entities/profile_entity.dart';

abstract class ProfileRepo {
  Future<DataState<ProfileEntity>> getProfile(RequestParams params);
}
