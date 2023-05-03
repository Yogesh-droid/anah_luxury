import 'package:anah_luxury/features/dashboard/ui/widgets/anah_app_bar.dart';
import 'package:anah_luxury/features/home/ui/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/product_list/product_list_bloc.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key, required this.query, required this.name});
  final String query;
  final String name;

  
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    context
        .read<ProductListBloc>()
        .add(GetProductListEvent(query: widget.query));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AnahSecondaryAppBar(
        title: widget.name,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      body: BlocBuilder<ProductListBloc, ProductListState>(
        builder: (context, state) {
          if (state is ProductListInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductListFinal) {
            return GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2),
                itemCount: state.productList.length,
                itemBuilder: (context, index) {
                  var product = state.productList[index];
                  return ProductContainer(
                    productName: product.brand!.name ?? '',
                    onProductTapped: (id) {},
                    onWishListTapped: (id) {},
                    backgroundImage: product.uploadedFiles![0].fileUrl,
                    netPrice: product.price.toString(),
                    currency: product.prodCurrency!.currencyName ?? '',
                    height: MediaQuery.of(context).size.height * 0.185,
                      width: MediaQuery.of(context).size.width / 2,
                  );
                });
          } else if (state is ProductListError) {
            return Center(
              child: Text(state.exception.toString()),
            );
          }
          return const Center(child: Text("Something went wrong"));
        },
      ),
    );
  }
}
