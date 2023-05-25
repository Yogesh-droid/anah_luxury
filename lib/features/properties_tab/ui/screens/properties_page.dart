import 'package:anah_luxury/features/home/ui/widgets/featured_residence_list_widget.dart';
import 'package:anah_luxury/features/home/ui/widgets/new_residence_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/routes/routes.dart';
import '../../../home/ui/widgets/app_title_list_widget.dart';
import '../controllers/properties_bloc/properties_category_bloc.dart';
import '../widgets/properties_category_list.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  @override
  void initState() {
    PropertiesCategoryBloc propertiesCategoryBloc =
        context.read<PropertiesCategoryBloc>();
    if (propertiesCategoryBloc.propertiesCategoryEntity.isEmpty) {
      propertiesCategoryBloc.add(GetPropertiesCategoryEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        const AppTitleAndListWidget(
            title: kCategories, categoryBody: PropertiesCategoryList()),
        const SizedBox(height: appWidgetGap),
        // getBrandsLogo(),
        const SizedBox(height: appWidgetGap),
        AppTitleAndListWidget(
            title: kFeaturedResidence,
            onViewAllTapped: () {
              context.pushNamed(productListPageName, queryParams: {
                "query":
                    "country=60c9a6428729de2bf7ad0ebe&category=real-estate&featureType=isFeatured",
                "name": kFeaturedResidence,
                "category": kResidence
              });
            },
            categoryBody: const FeaturedResidenceListWidget()),
        const SizedBox(height: appWidgetGap),
        AppTitleAndListWidget(
          title: kNewResidence,
          categoryBody: const NewResidenceListWidget(),
          onViewAllTapped: () {
            context.pushNamed(productListPageName, queryParams: {
              "query":
                  "country=60c9a6428729de2bf7ad0ebe&category=real-estate&featureType=isNew",
              "name": kNewResidence,
              "category": kResidence
            });
          },
        ),
      ],
    ));
  }
}
