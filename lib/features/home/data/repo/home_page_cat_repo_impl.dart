// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/network/network_manager.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/home/data/models/home_page_cat_res_model.dart';
import 'package:anah_luxury/features/home/domain/entities/home_page_cat_res_entity.dart';
import 'package:anah_luxury/features/home/domain/repo/home_page_cat_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePageCatRepoImpl implements HomePageCatRepo {
  final NetworkManager networkManager;
  HomePageCatRepoImpl({
    required this.networkManager,
  });
  @override
  Future<DataState<List<HomePageCatResEntity>>> getHomePageCat(
      RequestParams params) async {
    Response? response;
    try {
      response = await networkManager.makeNetworkRequest(params);
      if (response != null) {
        if (response.statusCode == 200) {
          final value = HomePageCategoryResModel.fromJson(response.data);
          return DataSuccess(data: value.data!.categories);
        } else {
          return DataError(exception: Exception("No data available"));
        }
      } else {
        return DataError(
            exception: Exception(
                "Some Internal Error Occured ${response!.statusMessage}"));
      }
    } on Exception catch (e) {
      return DataError(exception: Exception(response!.statusMessage));
    }
  }
}
