import 'package:countries_app/requests/country_request.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key});

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (countrySelected != null) ...[
              SizedBox(
                width: 250,
                child: Image(image: NetworkImage(countrySelected!.flag)),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text('Name: ${countrySelected!.name}', style:const TextStyle(fontSize: 18),),
              const Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                width: 300,
                child: Text('Official Name: ${countrySelected!.official_name}', style:const TextStyle(fontSize: 18),),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              Text('Abbreviation: ${countrySelected!.alpha3Code}', style:const TextStyle(fontSize: 18),),
              const Padding(padding: EdgeInsets.all(5)),
              Text('Capital: ${countrySelected!.capital}', style:const TextStyle(fontSize: 18),),
              const Padding(padding: EdgeInsets.all(5)),
              Text('Continent: ${countrySelected!.continent}', style:const TextStyle(fontSize: 18),),
              const Padding(padding: EdgeInsets.all(5)),
              Text('Population: ${countrySelected!.population}', style:const TextStyle(fontSize: 18),),

            ]
          ],
        ),
      ),
    );
  }
}
