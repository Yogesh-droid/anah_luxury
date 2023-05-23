import 'package:anah_luxury/features/dashboard/ui/widgets/anah_app_bar.dart';
import 'package:anah_luxury/features/product_details/ui/controllers/property_detail_bloc/property_detail_bloc.dart';
import 'package:anah_luxury/features/product_details/ui/widgets/property_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyDetailPage extends StatefulWidget {
  const PropertyDetailPage({super.key, this.slug});
  final String? slug;
  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  @override
  void initState() {
    getPropertyDetail(widget.slug);
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
      body: BlocBuilder<PropertyDetailBloc, PropertyDetailState>(
          builder: (context, state) {
        if (state is PropertyDetailInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PropertyDetailError) {
          return Center(child: Text(state.exception.toString()));
        } else if (state is PropertyDetailFetchedState) {
          return PropertyDetailWidget(
              propertyDetailEntity: state.propertyDetailEntity);
        }
        return const Center(child: Text("Some error occured"));
      }),
    );
  }

  void getPropertyDetail(String? slug) {
    context
        .read<PropertyDetailBloc>()
        .add(GetPropertyDetailEvent(slug: slug ?? ''));
  }
}
