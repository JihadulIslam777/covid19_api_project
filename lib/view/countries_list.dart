import 'package:covid19_api_project/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../services/state_services.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices stateServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search with country name',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.countriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              ListTile(
                                title: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                subtitle: Container(
                                  height: 10,
                                  width: 89,
                                  color: Colors.white,
                                ),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => DetailScreen(
                                              name: snapshot.data![index]
                                                  ['country'],
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              cases: snapshot.data![index]
                                                  ['cases'],
                                              recovered: snapshot.data![index]
                                                  ['recovered'],
                                              deaths: snapshot.data![index]
                                                  ['deaths'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              tests: snapshot.data![index]
                                                  ['tests'],
                                              todayRecovered:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                            ))),
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => DetailScreen(
                                              image: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                              name: snapshot.data![index]
                                                  ['country'],
                                              cases: snapshot.data![index]
                                                  ['cases'],
                                              recovered: snapshot.data![index]
                                                  ['recovered'],
                                              deaths: snapshot.data![index]
                                                  ['deaths'],
                                              active: snapshot.data![index]
                                                  ['active'],
                                              tests: snapshot.data![index]
                                                  ['tests'],
                                              todayRecovered:
                                                  snapshot.data![index]
                                                      ['todayRecovered'],
                                              critical: snapshot.data![index]
                                                  ['critical'],
                                            ))),
                                child: ListTile(
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]
                                        ['countryInfo']['flag']),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
