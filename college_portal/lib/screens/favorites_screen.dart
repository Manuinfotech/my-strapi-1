import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';
import '../widgets/college_card.dart';
import '../models/college.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<College> _favoriteColleges = [];

  @override
  void initState() {
    super.initState();
    // In a real app, this would fetch from a database or local storage
    // Here we just pick the first two colleges as "favorites" for demo
    _favoriteColleges = MockDataService.getColleges().take(2).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Colleges')),
      body: _favoriteColleges.isEmpty
          ? const Center(child: Text('No favorites added yet'))
          : ListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemCount: _favoriteColleges.length,
              itemBuilder: (context, index) {
                return CollegeCard(
                  college: _favoriteColleges[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/college_detail',
                      arguments: _favoriteColleges[index],
                    );
                  },
                );
              },
            ),
    );
  }
}
