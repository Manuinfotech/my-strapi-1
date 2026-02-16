import 'package:flutter/material.dart';
import '../models/college.dart';
import '../services/mock_data_service.dart';
import '../widgets/college_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<College> _allColleges = [];
  List<College> _filteredColleges = [];

  @override
  void initState() {
    super.initState();
    _allColleges = MockDataService.getColleges();
    _filteredColleges = _allColleges;
  }

  void _filterColleges(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredColleges = _allColleges;
      } else {
        _filteredColleges = _allColleges
            .where((college) =>
                college.name.toLowerCase().contains(query.toLowerCase()) ||
                college.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search colleges...',
            border: InputBorder.none,
          ),
          onChanged: _filterColleges,
        ),
      ),
      body: _filteredColleges.isEmpty
          ? const Center(child: Text('No colleges found'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredColleges.length,
              itemBuilder: (context, index) {
                return CollegeCard(
                  college: _filteredColleges[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/college_detail',
                      arguments: _filteredColleges[index],
                    );
                  },
                );
              },
            ),
    );
  }
}
