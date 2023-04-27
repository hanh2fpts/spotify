import 'package:flutter/material.dart';

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
        leading: IconButton(
            onPressed: () {},
            icon: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => gradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: const Icon(Icons.grid_view_rounded, size: 30))),
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
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: const [
            // header text + textfield
            HeaderWidget(),
            SizedBox(height: 10),
            //trending music
            TrendingWidget(),
            //playlist
          ],
        ),
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
        SizedBox(
          height: 50,
          child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  prefixIcon: const Icon(Icons.search),
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
          height: 180,
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
      height: 180,
      width: 180,
      child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset(urlImage))),
    );
  }
}
