import 'dart:convert';

import 'package:countries_app/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Country>? countries;
Country? countrySelected;
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
}