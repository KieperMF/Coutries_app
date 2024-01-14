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
          child: Column(
        children: [
          DropdownButton(
            value: DropdownContinent,
            hint: const Text("Filter by Continent"),
            onChanged: (String? newContinent) {
              countriesRequest.requestContinents(newContinent!);
              setState(() {
                DropdownContinent = newContinent;
              });
            },
            items: continents.map<DropdownMenuItem<String>>((String conti) {
              return DropdownMenuItem<String>(
                value: conti,
                child: Text(conti),
              );
            }).toList(),
          ),
          ListenableBuilder(
              listenable: countriesRequest,
              builder: (context, _) {
                if (countries != null && DropdownContinent == null || DropdownContinent == "Back") {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: countries!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            SizedBox(
                              width: 250,
                              child: Image(
                                  image: NetworkImage(countries![index].flag)),
                            ),
                            TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black)),
                                onPressed: () {
                                  countrySelected = countries![index];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              const CountryPage())));
                                },
                                child: Text(
                                  countries![index].name,
                                  style: const TextStyle(color: Colors.white),
                                )),
                            if (countriesPerConti != null) ...[]
                          ],
                        );
                      });
                } else if (countriesPerConti != null) {
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: countriesPerConti!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(10)),
                            SizedBox(
                              width: 250,
                              child: Image(
                                  image: NetworkImage(
                                      countriesPerConti![index].flag)),
                            ),
                            Text(countriesPerConti![index].countryName),
                          ],
                        );
                      });
                } else {
                  return const Text("Carregando");
                }
              }),
        ],
      )),
    );
  }
}
