import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:spotify/neu_box.dart';

class PlayAudioPage extends StatelessWidget {
  const PlayAudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final songDetail = ModalRoute.of(context)!.settings.arguments as SongModel;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const HeaderWidget(),
              const SizedBox(height: 25),
              ImageMusicWidget(songDetail: songDetail),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500, blurRadius: 15, offset: const Offset(5, 5)),
                      const BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(-5, -5))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      songDetail.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      songDetail.artist.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey.shade700),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const BarWidget(),
              const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500, blurRadius: 15, offset: const Offset(5, 5)),
                      const BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(-5, -5))
                    ]),
                child: Slider(
                  onChanged: (value) {},
                  value: 0.5,
                  activeColor: Colors.green,
                ),
              ),
              const SizedBox(height: 25),
              Row(
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
              const SizedBox(height: 25)
            ],
          ),
        ),
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  const BarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('0:00'),
        NeuBox(child: Icon(Icons.shuffle)),
        NeuBox(child: Icon(Icons.repeat)),
        Text('4:22')
      ],
    );
  }
}

class ImageMusicWidget extends StatefulWidget {
  const ImageMusicWidget({super.key, required this.songDetail});

  final SongModel songDetail;

  @override
  State<ImageMusicWidget> createState() => _ImageMusicWidgetState();
}

class _ImageMusicWidgetState extends State<ImageMusicWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: NeuBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(130),
          child: QueryArtworkWidget(
            keepOldArtwork: true,
            id: widget.songDetail.id,
            type: ArtworkType.AUDIO,
            artworkQuality: FilterQuality.high,
            artworkHeight: 250,
            artworkWidth: 250,
            artworkBorder: BorderRadius.circular(130),
            artworkFit: BoxFit.fill,
            size: 250,
            artworkRepeat: ImageRepeat.repeat,
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: NeuBox(
              child: InkWell(
                  onTap: () => Navigator.of(context).pop(), child: const Icon(Icons.arrow_back))),
        ),
        const Text(
          'PLAYLIST',
          style: TextStyle(fontSize: 20, letterSpacing: 15),
        ),
        const SizedBox(
          height: 50,
          width: 50,
          child: NeuBox(child: Icon(Icons.menu)),
        ),
      ],
    );
  }
}
