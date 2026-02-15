import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';
import '../widgets/college_card.dart';
import '../models/college.dart';

class CollegeListScreen extends StatefulWidget {
  const CollegeListScreen({super.key});

  @override
  State<CollegeListScreen> createState() => _CollegeListScreenState();
}

class _CollegeListScreenState extends State<CollegeListScreen> {
  List<College> _colleges = [];

  @override
  void initState() {
    super.initState();
    _colleges = MockDataService.getColleges();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Colleges'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8),
        itemCount: _colleges.length,
        itemBuilder: (context, index) {
          return CollegeCard(
            college: _colleges[index],
            onTap: () {
               Navigator.pushNamed(
                context,
                '/college_detail',
                arguments: _colleges[index],
              );
            },
          );
        },
      ),
    );
  }
}
