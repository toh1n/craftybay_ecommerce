import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String cusName;
  final String reviewDescription;
  final String createdAt;
  final String star;
  const ReviewCard({super.key, required this.cusName, required this.reviewDescription, required this.createdAt, required this.star});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(cusName),
            subtitle: Text("${DateTime.parse(createdAt)}"),
            trailing: Text('$star ⭐'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0,left: 16,right: 16,bottom: 16),
            child: Text(
              reviewDescription,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
