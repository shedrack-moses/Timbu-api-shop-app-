import 'package:flutter/material.dart';

class ProdutDetailPage extends StatefulWidget {
  final String imageUrl;
  const ProdutDetailPage({super.key, required this.imageUrl});

  @override
  State<ProdutDetailPage> createState() => _ProdutDetailPageState();
}

class _ProdutDetailPageState extends State<ProdutDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              //image
              Image.network(widget.imageUrl),
            ],
          ),
          Positioned(
              left: 10,
              top: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.3),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ))
        ],
      ),
    );
  }
}
