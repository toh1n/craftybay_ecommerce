import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  final String id;
  const ReviewScreen({super.key, required this.id});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (index,context){
        return ListTile(
          leading: Image.network(
              "src",
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
          ),
          title: const Text("Name"),
          subtitle: const Text("Review"),
        );
      }),
    );
  }
}
