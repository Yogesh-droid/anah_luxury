// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anah_luxury/core/resource/data_state/data_state.dart';
import 'package:anah_luxury/core/usecase/usecase.dart';
import 'package:anah_luxury/features/cars/domain/entity/category_entity.dart';
import 'package:anah_luxury/features/cars/domain/repo/category_repo.dart';

class CategoryUsecase extends Usecase {
  final CategoryRepo categoryRepo;
  CategoryUsecase({
    required this.categoryRepo,
  });
  @override
  Future<DataState<List<CategoryEntity>>> call(params) {
    return categoryRepo.getCategory(params);
  }
}
