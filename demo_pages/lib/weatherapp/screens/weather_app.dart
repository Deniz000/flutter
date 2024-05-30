import 'package:demo_pages/weatherapp/services/weather_service.dart';
import 'package:demo_pages/weatherapp/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class WaetherApp0 extends StatefulWidget {
  const WaetherApp0({super.key});

  @override
  State<WaetherApp0> createState() => _WaetherApp0State();
}

class _WaetherApp0State extends State<WaetherApp0> {
  final TextEditingController _controller = TextEditingController();
  final _weatherService = WeatherService('c811d2f5edf03674fd1e71af69fb727d');
  Weather? _weather;

  Future<void> fetchWaether(String cityName) async {
    final weather = await _weatherService.getWeatherByCity(cityName);
    setState(() {
      _weather = weather;
      print(_weather?.description);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        // Center widget ekleyerek içeriği ortalıyoruz
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Dikey eksende ortalama
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: 'Enter a city name',
                    suffixIcon: IconButton(
                      onPressed: () {
                        fetchWaether(_controller.text);
                      },
                      icon: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(left: 20, top: 10)),
              ),
            ),
            SizedBox(height: 20), // İki Column arasında boşluk bırakmak için
            Column(
              children: [
                Text(_controller.text),
                _weather?.description != null
                    ? Lottie.asset(
                        iconPath(_weather?.description.toLowerCase()),
                        width: 300,
                        height: 300)
                    : Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Lottie.asset(
                          iconPath('waiting'),
                          width: 200,
                          height: 200),
                    ),
                Text(_weather?.description != null
                    ? '${_weather?.description}'
                    : ''),
                Text(_weather?.temperature != null
                    ? '${((_weather?.temperature ?? 0) - 273.15).toInt()} °C'
                    : ''),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String iconPath(String? name) =>
      '/Users/guldenizozdemir/flutter_learn_process/start_week/demo_pages/lib/weatherapp/assets/$name.json';
}
