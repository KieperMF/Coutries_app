import 'dart:convert';

import 'package:countries_app/models/country_model.dart';
import 'package:countries_app/models/per_continent_moddel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Country>? countries;
List<ContinentModel>? countriesPerConti;
Country? countrySelected;
ContinentModel? countryperContSelected;
String? DropdownContinent;
List<String> continents = ["America","Europe","Africa","Asia","Oceania","Back"];

class CountriesRequest extends ChangeNotifier{
  Future<void> requestCountries() async{
    try{
      Uri uri = Uri.parse("https://countryapi.io/api/all?apikey=TsYxVj1gXZ5ORnblGPAfGBKwGsmqLg9vf38uLTWP");
      final response = await http.get(uri);
      final decode = jsonDecode(response.body);
      countries = Country.fromJsonList(decode);
       
      notifyListeners();
    }catch(e){
      print("Erro $e");
    }
  }

  Future<void> requestContinents(String Selected) async{
    try{
      Uri uri = Uri.parse("https://restcountries.com/v3.1/region/$Selected?apikey=TsYxVj1gXZ5ORnblGPAfGBKwGsmqLg9vf38uLTWP");
      final response = await http.get(uri);
      if(response.statusCode == 200){
        final decode = jsonDecode(response.body);
        countriesPerConti = ContinentModel.fromJsonListContinent(decode);
        notifyListeners();
      }
      
    }catch(e){
      print("erro request continente $e");
    }
  }
}