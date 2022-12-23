import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(
          150,
          (i) =>
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyApp();
  final List<String> items;

  const MyApp({super.key, required this.items});
}

class _MyApp extends State<MyApp> {
  bool _isFav = false;
  int _favCount = 0;

  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title + (_favCount != 0 ? "($_favCount)" : "")),
        ),
        body: ListView.builder(
          itemCount: widget.items.length ~/
              3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                    child: Stack(
                  // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(widget.items[index * 3]),
                    FavWidget(
                      onChanged: _handleFavChange,
                    ),
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(widget.items[index * 3 + 1]),
                    FavWidget(
                      onChanged: _handleFavChange,
                    )
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(widget.items[index * 3 + 2]),
                    FavWidget(
                      onChanged: _handleFavChange,
                    )
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }

  void _handleFavChange(bool newValue) {
    setState(() {
      if (newValue) {
        _favCount += 1;
      } else {
        _favCount -= 1;
      }
    });
  }
}

class FavWidget extends StatefulWidget {
  FavWidget({super.key, this.favCount = 0, required this.onChanged});
  final int favCount;
  final ValueChanged<bool> onChanged;

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _tap,
      icon: isFav
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
      color: Colors.red,
      iconSize: 50,
    );
  }

  void _tap() {
    widget.onChanged(!isFav);
    isFav = !isFav;
  }
}
