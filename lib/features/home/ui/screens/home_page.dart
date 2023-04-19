import 'package:anah_luxury/core/constants/strings.dart';
import 'package:anah_luxury/features/home/ui/screens/home_carousel.dart';
import 'package:anah_luxury/features/home/ui/widgets/anah_search_bar.dart';
import 'package:anah_luxury/features/home/ui/widgets/category_container.dart';
import 'package:anah_luxury/features/home/ui/widgets/product_container.dart';
import 'package:anah_luxury/features/home/ui/widgets/product_horizontal_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      maintainBottomViewPadding: true,
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: AnahSearchBar(onChange: (value) {}),
          ),
          const SizedBox(
            height: 20,
          ),
          const HomeCarousel(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ProductHorizontalList(
              title: kBrowseBy,
              onViewAllTapped: () {},
              categoryBody: getCategoryList(context),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kFeaturedResidence,
                onViewAllTapped: () {},
                categoryBody: getFeaturedResidenceList(context),
              )),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kFeaturedCars,
                onViewAllTapped: () {},
                categoryBody: getFeaturedCarsList(context),
              )),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kFeaturedCars,
                onViewAllTapped: () {},
                categoryBody: getNewResidenceList(context),
              )),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(18),
              child: ProductHorizontalList(
                title: kFeaturedCars,
                onViewAllTapped: () {},
                categoryBody: getPopularCarsList(context),
              ))
        ],
      )),
    );
  }

  Widget getCategoryList(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: [
          Expanded(
            child: CategoryContainer(
              title: kCars.toUpperCase(),
              onCategoryTapped: () {},
              shadeColor: Colors.black,
              backgroundImage:
                  'https://images.pexels.com/photos/3786092/pexels-photo-3786092.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: CategoryContainer(
              title: kResidence.toUpperCase(),
              onCategoryTapped: () {},
              shadeColor: Colors.black,
              backgroundImage:
                  'https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            ),
          ),
        ],
      ),
    );
  }

  Widget getFeaturedResidenceList(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/323705/pexels-photo-323705.jpeg',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/276724/pexels-photo-276724.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
      ],
    );
  }

  Widget getFeaturedCarsList(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/3647693/pexels-photo-3647693.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/3729464/pexels-photo-3729464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
      ],
    );
  }

  Widget getPopularCarsList(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/3541743/pexels-photo-3541743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/217326/pexels-photo-217326.jpeg?auto=compress&cs=tinysrgb&w=600',
          ),
        ),
      ],
    );
  }

  Widget getNewResidenceList(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/7045712/pexels-photo-7045712.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: ProductContainer(
            onProductTapped: () {},
            productName: "TownHouse",
            currency: "AED",
            discount: "50",
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width / 2,
            netPrice: "\$500",
            specifications: const [
              "Chiller free |",
              "Burj Khalifa facing|",
              "Marina"
            ],
            backgroundImage:
                'https://images.pexels.com/photos/7045703/pexels-photo-7045703.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ),
      ],
    );
  }
}
