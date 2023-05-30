import 'package:anah_luxury/core/constants/api_constants.dart';
import 'package:anah_luxury/core/constants/hive/local_storage.dart';
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/resource/request_params/request_params.dart';
import 'package:anah_luxury/features/product_booking/domain/entities/product_book_res_entity.dart';
import 'package:anah_luxury/features/product_booking/domain/usecases/product_book_res_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
part 'book_product_state.dart';

class BookProductCubit extends Cubit<BookProductState> {
  final ProductBookResUsecase productBookResUsecase;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNo;
  String preferredDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  int? preferredTime = 10;
  String? productId;
  String? categoryId;
  BookProductCubit(this.productBookResUsecase) : super(BookProductInitial());

  Future<void> bookProduct() async {
    emit(ProductBookingInProgress());
    DataState<ProductBookResEntity> dataState =
        await productBookResUsecase.call(RequestParams(
            url: "${baseUrl}v1/client/bookTestDriveTour",
            apiMethods: ApiMethods.post,
            body: {
          "firstName": firstName,
          "lastName": lastName ?? '',
          "email": email,
          "mobileNo": mobileNo,
          "preferredDate": "${preferredDate}T$preferredTime:00:00Z",
          "product": productId,
          "category": categoryId
        },
            header: {
          "Authorization": "Bearer ${LocalStorage.instance.token}",
          "Content-Type": "application/json",
        }));
    if (dataState.data != null) {
      emit(ProductBookedSuccessState(message: dataState.data!.message ?? ''));
      Future.delayed(const Duration(seconds: 1), () {
        emit(BookProductInitial());
      });
    } else {
      emit(ProductBookedFailedState(
          exception: Exception("Something went wrong")));
    }
  }
}
