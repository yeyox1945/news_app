import 'package:flutter/material.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue.shade100,
          height: 250,
          padding: const EdgeInsets.all(8),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title'),
            ],
          ),
        );
      },
    );
  }
}
