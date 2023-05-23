import 'package:anah_luxury/features/dashboard/ui/widgets/anah_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/car_detail_bloc/product_detail_bloc.dart';
import '../widgets/car_detail_widget.dart';

class CarDetailPage extends StatefulWidget {
  const CarDetailPage({super.key, this.slug});
  final String? slug;
  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  @override
  void initState() {
    getCarDetail(widget.slug);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnahSecondaryAppBar(actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ]),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
        if (state is ProductDetailInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CarDetailError) {
          return Center(child: Text(state.exception.toString()));
        } else if (state is CarDetailFetched) {
          return CarDetailWidget(carDetailEntity: state.carDetailEntity);
        }
        return const Center(child: Text("Some error occured"));
      }),
    );
  }

  void getCarDetail(String? slug) {
    context.read<ProductDetailBloc>().add(GetCarDetailEvent(slug: slug ?? ''));
  }
}
