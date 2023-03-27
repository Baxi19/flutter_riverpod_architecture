import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpood_architecture/config/providers/university_provider.dart';
import 'package:flutter_riverpood_architecture/domain/models/university.dart';
import 'package:flutter_riverpood_architecture/presentation/screens/home/widgets/university_item.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  List<UniversityData> listUniversities = [];

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      List<UniversityData> data =
          await ref.watch(universityProvider).getAllUniversities();
      setState(() {
        listUniversities = data;
      });
    });
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.star_border),
        centerTitle: true,
        title: const Text("List of universities"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                "Costa Rica",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listUniversities.length,
              itemBuilder: (BuildContext context, int index) {
                UniversityData universityItem = listUniversities[index];
                return UniversityItem(
                  universityItem: universityItem,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
