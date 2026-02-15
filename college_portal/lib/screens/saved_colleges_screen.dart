import 'package:flutter/material.dart';
import '../models/college.dart';
import '../services/mock_data_service.dart';
import '../widgets/college_card.dart';

class SavedCollegesScreen extends StatelessWidget {
  const SavedCollegesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<College> savedColleges = MockDataService.getFavoriteColleges();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Colleges'),
        automaticallyImplyLeading: false,
      ),
      body: savedColleges.isEmpty
          ? const Center(child: Text('No saved colleges yet.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: savedColleges.length,
              itemBuilder: (context, index) {
                return CollegeCard(
                  college: savedColleges[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/college_detail',
                      arguments: savedColleges[index],
                    );
                  },
                );
              },
            ),
    );
  }
}
