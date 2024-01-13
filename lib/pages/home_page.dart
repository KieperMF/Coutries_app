import 'package:countries_app/pages/country_page.dart';
import 'package:countries_app/requests/country_request.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  CountriesRequest countriesRequest = CountriesRequest();

  Future<void> loadCountries() async {
    await countriesRequest.requestCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: SingleChildScrollView(
        child: ListenableBuilder(
            listenable: countriesRequest,
            builder: (context, _) {
              if (countries != null) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: countries!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            width: 250,
                            child: Image(
                                image: NetworkImage(countries![index].flag)),
                          ),
                          TextButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                              onPressed: () {
                                countrySelected = countries![index];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            const CountryPage())));
                              },
                              child: Text(countries![index].name, style:const TextStyle(color: Colors.white),))
                        ],
                      );
                    });
              } else {
                return const Text("Carregando");
              }
            }),
      ),
    );
  }
}
