import 'package:anah_luxury/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/routes/routes.dart';
import '../../../cars/domain/entity/category_entity.dart';
import '../../../cars/ui/widgets/category_widget.dart';
import '../controllers/properties_bloc/properties_category_bloc.dart';

class PropertiesCategoryList extends StatelessWidget {
  const PropertiesCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertiesCategoryBloc, PropertiesCategoryState>(
      builder: (context, state) {
        if (state is GetPropertiesCategoryEvent) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PropertiesCategorySuccess) {
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
                          "country=60c9a6428729de2bf7ad0ebe&category=real-estate|${list[index].slug}",
                      "name": list[index].name,
                      "category": kResidence
                    });
                  },
                  title: list[index].name,
                  slug: list[index].slug,
                );
              });
        } else if (state is PropertyErrorState) {
          return Text(state.exception.toString());
        }
        return const Text('Some Err');
      },
    );
  }
}
