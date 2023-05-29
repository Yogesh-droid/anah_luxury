import 'dart:convert';
import 'package:anah_luxury/core/constants/spaces.dart';
import 'package:anah_luxury/features/product_booking/ui/controllers/country_code_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/country_code_model.dart';

class CountryCodePicker extends StatefulWidget {
  const CountryCodePicker({super.key});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  final List<CountryCodeModel> _countryList = [];
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(appPadding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.2,
        child: Column(
          children: [
            TextField(
                controller: searchController,
                onChanged: (value) => loadCountry(),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: "Search by country name or code")),
            FutureBuilder<List<CountryCodeModel>>(
                future: loadCountry(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  context
                                      .read<CountryCodeController>()
                                      .changeCountryCode(snapshot.data![index]);
                                  Navigator.pop(context);
                                },
                                title: Text(snapshot.data![index].name!),
                                trailing: Text(snapshot.data![index].dialCode!),
                              );
                            }),
                      );

                      /*  return DropdownButtonFormField(
                          // items: snapshot.data!
                          //     .map((e) => DropdownMenuItem(
                          //           value: e.dialCode,
                          //           child: Text(e.dialCode!),
                          //         ))
                          //     .toList(),
                          items: [
                            ...snapshot.data!
                                .where((element) => element.dialCode!.contains(''))
                                .map((e) => DropdownMenuItem(
                                      value: e.dialCode,
                                      child: Text(e.dialCode!),
                                    ))
                                .toList(),
                          ],
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: black),
                                gapPadding: 8),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: black),
                                gapPadding: 8),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: black),
                                gapPadding: 8),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: black),
                                gapPadding: 8),
                            labelText: kCountry,
                            labelStyle: TextStyle(color: black),
                          )); */
                    } else {
                      // print("No data inside");
                      return Container();
                    }
                  } else {
                    // print("No data outside");
                    return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }

  Future<List<CountryCodeModel>> loadCountry() async {
    if (_countryList.isEmpty) {
      String json = await rootBundle.loadString('assets/country.json');
      List map = jsonDecode(json);
      for (var element in map) {
        _countryList.add(CountryCodeModel.fromJson(element));
      }
    }

    List<CountryCodeModel> list1 = _countryList
        .where((element) =>
            element.dialCode!.contains(searchController.text) ||
            element.name!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
        .toList();

    setState(() {});
    return list1;
  }
}
