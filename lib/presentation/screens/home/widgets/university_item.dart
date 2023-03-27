import 'package:flutter/material.dart';
import '../../../../domain/models/university.dart';

class UniversityItem extends StatelessWidget {
  final UniversityData universityItem;
  const UniversityItem({
    Key? key,
    required this.universityItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.location_city_outlined,
        color: Colors.white,
      ),
      trailing: Text(
        universityItem.alphaTwoCode,
        style: const TextStyle(
          color: Colors.red,
          //fontSize: 15,
        ),
      ),
      title: Text(universityItem.name),
    );
  }
}
