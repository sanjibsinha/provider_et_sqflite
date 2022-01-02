import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/blog.dart';

/// these shades of colors will appear on
/// the display screen and it will appear
/// based on the index of the list
final shadeOfColors = [
  Colors.pink.shade100,
  Colors.purple.shade100,
  Colors.teal.shade200,
  Colors.orange.shade200,
  Colors.white10,
];

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key? key,
    required this.blog,
    required this.index,
  }) : super(key: key);

  final Blog blog;
  final int index;

  @override
  Widget build(BuildContext context) {
    final color = shadeOfColors[index % shadeOfColors.length];
    final time = DateFormat.yMMMd().format(blog.createdTime);
    final minHeight = getMinHeight(index);

    return Card(
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 4),
            Text(
              blog.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              blog.description,
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
