import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> countries = [];//1
  List<dynamic> stateMasters = [];//2
  List<dynamic> states = [];//2

  String? countryId;//1
  String? stateId;//2

  void initState(){
    super.initState();

    this.countries.add({"id": 1, "name": "India"});
    this.countries.add({"id": 2, "name": "CI"});

    this.stateMasters = [
      {"ID": 1, "Name": "Assam", "ParentId": 1},
      {"ID": 2, "Name": "Dehli", "ParentId": 1},
      {"ID": 3, "Name": "Bihar", "ParentId": 1},
      {"ID": 4, "Name": "Punjab", "ParentId": 1},
      {"ID": 1, "Name": "Abidjan", "ParentId": 2},
      {"ID": 2, "Name": "Bouaké", "ParentId": 2},
      {"ID": 3, "Name": "Yamoussoukro", "ParentId": 2},
    ];
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
                 setState(() {
                  this.countryId = onChangedVal;
                  print("country: $onChangedVal");

                  this.states = this.stateMasters
                      .where(
                        (stateItem) => stateItem["ParentId"]
                      .toString() == onChangedVal.toString(),
                  ).toList();
                  this.stateId = null;
                });
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
              optionLabel: "name"
            ),
            FormHelper.dropDownWidgetWithLabel(
              context, 
              "Ville", 
              "Selectionner la ville", 
              this.stateId, 
              this.states, 
              (onChangedVal){
                setState(() {
                  this.stateId = onChangedVal;
                  print("state: $onChangedVal");
                });
              }, 
              (onValidatedVal){
                if(onValidatedVal == null){
                  return "Veuille selectionner la ville";
               }
               return null;
              },
              borderColor: Theme.of(context).primaryColor,
              borderFocusColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              optionValue: "ID",
              optionLabel: "Name"
            )
          ],
        ),
      ),
    );
  }
}