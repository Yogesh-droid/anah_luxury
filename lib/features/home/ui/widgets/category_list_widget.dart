import 'package:anah_luxury/core/constants/app_colors.dart';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/core/constants/text_tyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/home_page_category_bloc/bloc/home_page_category_bloc_bloc.dart';
import 'category_container.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCategoryBlocBloc, HomePageCategoryBlocState>(
      builder: (context, state) {
        if (state is HomePageCategoryBlocInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomePageCategoryResultState) {
          return Container(
            height: 140,
            alignment: Alignment.centerLeft,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              shrinkWrap: true,
              children: state.categoryList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: appPadding),
                      child: CategoryContainer(
                        title: e.name ?? ''.toUpperCase(),
                        textStyle: secMed14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: black,
                        ),
                        slug: e.slug,
                        name: e.name,
                        onCategoryTapped: (value, name) {
                          context.pushNamed(productListPageName, queryParams: {
                            "query":
                                "country=60c9a6428729de2bf7ad0ebe&category=$value",
                            "name": name,
                            "category":
                                value == 'real-estate' ? kProperties : kCars
                          });
                        },
                        backgroundImage: e.imgPath ??
                            'https://images.pexels.com/photos/3786092/pexels-photo-3786092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        }
        return const Center(
          child: Text("Some Err"),
        );
      },
    );
  }
}
