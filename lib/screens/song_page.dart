import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:spotify/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: NeuBox(child: Icon(Icons.arrow_back)),
                  ),
                  Text(
                    'PLAYLIST',
                    style: TextStyle(fontSize: 20, letterSpacing: 15),
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: NeuBox(child: Icon(Icons.menu)),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              NeuBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/cover.jpg',
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kota The Friend',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Birdie',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey.shade700),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 32,
                        )
                      ],
                    ),
                  )
                ],
              )),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('0:00'),
                  Icon(Icons.shuffle),
                  Icon(Icons.repeat),
                  Text('4:22')
                ],
              ),
              const SizedBox(height: 25),
              NeuBox(
                child: LinearPercentIndicator(
                  lineHeight: 5,
                  percent: 0.8,
                  progressColor: Colors.green,
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 60,
                child: Row(
                  children: const [
                    Expanded(child: NeuBox(child: Icon(Icons.skip_previous, size: 32))),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: NeuBox(child: Icon(Icons.pause, size: 32)),
                        )),
                    Expanded(child: NeuBox(child: Icon(Icons.skip_next, size: 32)))
                  ],
                ),
              ),
              const SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }
}
