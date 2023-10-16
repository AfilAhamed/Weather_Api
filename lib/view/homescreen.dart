import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/controller/weathercontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherController>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: provider.searchCountry,
              icon: const Icon(Icons.search)),
          centerTitle: true,
          title: TextFormField(controller: provider.nameController),
        ),
        body: FutureBuilder(
          future: provider.getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.sunny,
                      color: Colors.amber,
                      size: 64,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${provider.data!.temp}",
                      style: const TextStyle(fontSize: 46),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "${provider.data!.cityName}",
                      style: const TextStyle(fontSize: 46),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Additional information',
                        style: TextStyle(
                            fontSize: 30, color: Colors.grey.shade700)),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Wind: ${provider.data!.wind} km/h",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                "Pressure: ${provider.data!.pressure}",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w400),
                              ),
                            ]),
                        const SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            Text(
                              "Humidity: ${provider.data!.humidity}%",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              "Feels Like: ${provider.data!.feels_like}",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}
