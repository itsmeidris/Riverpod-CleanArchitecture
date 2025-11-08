import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserSkeletonCard extends StatelessWidget {
  const UserSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.ac_unit),
              title: Text('Item number $index as title'),
              subtitle: const Text('Subtitle here'),
            ),
          );
        },
      ),
    );
  }
}
