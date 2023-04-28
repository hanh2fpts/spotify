import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:spotify/bloc/overview/over_view_bloc.dart';
import 'package:spotify/screens/play_audio_page.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Gradient gradient = LinearGradient(colors: [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
    ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
          child: const Text(
            'SPOTIFY',
            style: TextStyle(
              letterSpacing: 10,
            ),
          ),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child:
                  const CircleAvatar(backgroundImage: ExactAssetImage('assets/images/cover.jpg')))
        ],
      ),
      body: BlocProvider(
        create: (context) => OverViewBloc()..add(InitDataEvent()),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: const [
              // header text + textfield
              HeaderWidget(),
              SizedBox(height: 10),
              //trending music
              TrendingWidget(),
              SizedBox(height: 10),
              ListMusic()
              //playlist
            ],
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: const [Icon(Icons.shuffle_sharp), Text('Shuffle All')],
          )),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome',
          style: TextStyle(fontSize: 16),
        ),
        const Text('Enjoy Your Favorite Music',
            style: TextStyle(fontSize: 22, fontFamily: 'RobotoBold')),
        const SizedBox(height: 20),
        Container(
          height: 50,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(color: Colors.grey.shade500, blurRadius: 15, offset: const Offset(5, 5)),
                const BoxShadow(color: Colors.white, blurRadius: 15, offset: Offset(-5, -5))
              ]),
          child: const TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search')),
        )
      ],
    );
  }
}

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text('Trending Music', style: TextStyle(fontFamily: 'RobotoBold')),
            Text('View More')
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: ItemCoverImage(urlImage: 'assets/images/cover$index.jpg'),
            ),
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}

class ItemCoverImage extends StatelessWidget {
  const ItemCoverImage({super.key, required this.urlImage});
  final String urlImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.asset(urlImage))),
    );
  }
}

class ListMusic extends StatelessWidget {
  const ListMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverViewBloc, OverViewState>(
      builder: (context, state) {
        if (state is InitDataSuccess) {
          var listSong = state.listSong;
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listSong.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              blurRadius: 15,
                              offset: const Offset(5, 5)),
                          const BoxShadow(
                              color: Colors.white, blurRadius: 15, offset: Offset(-5, -5))
                        ]),
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => const PlayAudioPage(),
                          settings: RouteSettings(arguments: listSong[index]))),
                      leading: QueryArtworkWidget(id: listSong[index].id, type: ArtworkType.AUDIO),
                      title: Text(listSong[index].title),
                      subtitle: Text(listSong[index].artist!),
                    ),
                  ));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
