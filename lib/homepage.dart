import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> countries = [
    {"id": 1, "label": "India"},
    {"id": 2, "label": "CI"}
  ];
  String? countryId;

  void initState(){
    super.initState();

    // this.countries.add({"id": 1, "label": "India"});
    // this.countries.add({"id": 2, "label": "CI"});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title : Text("Flutter - Dropdown indépendant"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            FormHelper.dropDownWidgetWithLabel(
              context,
              "Pays",
              "Selectionner un pays",
              this.countryId,
              this.countries,
              (onChangedVal){
                this.countryId = onChangedVal;
                print("country: $onChangedVal");
              },
              (onValidatedVal){
               if(onValidatedVal == null){
                  return "Veuille selectionner un pays";
               }
               return null;
              },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "label"
            )
          ],
        ),
      ),
    );
  }
}