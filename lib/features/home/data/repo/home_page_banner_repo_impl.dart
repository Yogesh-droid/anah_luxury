// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/data/models/home_page_banner_response_model.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_banner_res_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/home_page_banner_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePageBannerRepoImpl implements HomePageBannerRepo {
  final NetworkManager networkManager;
  HomePageBannerRepoImpl({
    required this.networkManager,
  });
  @override
  Future<DataState<List<HomePageBannerResEntity>>> getHomePageBanners(
      RequestParams params) async {
    try {
      Response? response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.statusCode == 200) {
          final value = HomePageBannerResponseModel.fromJson(response.data);
          return DataSuccess(data: value.data!.homePageBanners);
        } else {
          return DataError(
              exception: Exception(
                  "Failed to load data : Unknown Error ${response.statusMessage}"));
        }
      } else {
        return DataError(
            exception: Exception(
                "Failed to load data : Error From server  ${response!.statusMessage}"));
      }
    } on Exception catch (e) {
      return DataError(exception: Exception(e));
    }
  }
}
