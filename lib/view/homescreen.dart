//import 'package:anim_search_bar/anim_search_bar.dart';
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
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          // appBar: AppBar(
          //   backgroundColor: Color.fromARGB(255, 34, 65, 85),
          //   title: AnimSearchBar(
          //     // color: Colors.amber,
          //     searchIconColor: Colors.amber,
          //     width: 1000,
          //     textController: provider.nameController,
          //     onSuffixTap: () {
          //       provider.nameController.clear();
          //     },
          //     onSubmitted: (value) {
          //       provider.searchCountry(value);
          //     },
          //     helpText: 'Search...',
          //   ),
          // ),
          body: FutureBuilder(
            future: provider.getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'lib/assets/images/clouds-4215608_1920.jpg'),
                                  fit: BoxFit.cover)),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    cursorColor: Colors.white,
                                    cursorHeight: 25,
                                    decoration: InputDecoration(
                                      hintText: 'Search..',
                                      hintStyle:
                                          const TextStyle(color: Colors.white),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.white),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      prefixIcon: const Icon(
                                        Icons.search_outlined,
                                        color: Colors.amber,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            provider.nameController.clear();
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.amber,
                                          )),
                                      filled: true,
                                      fillColor: Colors.black.withOpacity(0.4),
                                    ),
                                    controller: provider.nameController,
                                    onFieldSubmitted: (value) {
                                      provider.searchCountry(value);
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              const Icon(
                                Icons.sunny,
                                color: Colors.amber,
                                size: 64,
                              ),
                              const SizedBox(
                                height: 15,
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
                                height: 50,
                              ),
                              Card(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Text('Additional information',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.grey.shade700)),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Wind: ${provider.data!.wind} km/h",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              const SizedBox(
                                                height: 18,
                                              ),
                                              Text(
                                                "Pressure: ${provider.data!.pressure}",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Text(
                                              "Feels Like: ${provider.data!.feels_like}",
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
          )),
    );
  }
}
