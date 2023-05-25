import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/cars/domain/entity/category_entity.dart';
import 'package:anah_luxury/features/cars/ui/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/category_bloc/category_bloc.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarsAndPropCategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CarsCategoryInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryCarsSuccessState) {
          return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.15),
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              itemCount: state.categoryList.length,
              itemBuilder: (context, index) {
                List<CategoryEntity> list = state.categoryList;
                return CategoryWidget(
                  id: list[index].sId,
                  image: list[index].imgPath,
                  onTap: () {
                    context.pushNamed(productListPageName, queryParams: {
                      "query":
                          "country=60c9a6428729de2bf7ad0ebe&category=cars|${list[index].slug}",
                      "name": list[index].name,
                      "category": kCars
                    });
                  },
                  title: list[index].name,
                  slug: list[index].slug,
                );
              });
        } else if (state is CategoryCarsErrorState) {
          return Text(state.exception.toString());
        }
        return const Text('Some Err');
      },
    );
  }
}
