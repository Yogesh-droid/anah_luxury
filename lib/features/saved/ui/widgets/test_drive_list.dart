import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/strings.dart';
import '../../../home/ui/widgets/app_title_list_widget.dart';
import '../../../home/ui/widgets/product_container.dart';
import '../controllers/test_drive_tours/test_drive_tour_list_bloc.dart';

class TestDriveList extends StatelessWidget {
  const TestDriveList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestDriveTourListBloc, TestDriveTourListState>(
      builder: (context, state) {
        if (state is TestDriveTourListInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (context
            .read<TestDriveTourListBloc>()
            .testDriveList
            .isNotEmpty) {
          return AppTitleAndListWidget(
            title: kTestDrive,
            onViewAllTapped: () {},
            categoryBody: SizedBox(
              height: 300,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: context
                      .read<TestDriveTourListBloc>()
                      .testDriveList
                      .map((e) => ProductContainer(
                            height: 200,
                            productName: e.title ?? '',
                            onProductTapped: (category, slug) {},
                            backgroundImage: e.uploadedFiles![0].fileUrl,
                            specifications: [
                              "${e.cars!.mileage} k Miles         ",
                              e.location!
                            ],
                          ))
                      .toList()),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
