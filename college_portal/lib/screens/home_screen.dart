import 'package:flutter/material.dart';
import '../services/mock_data_service.dart';
import '../widgets/college_card.dart';
import '../widgets/section_header.dart';
import '../models/college.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<College> featuredColleges = MockDataService.getColleges();

    return Scaffold(
      appBar: AppBar(
        title: const Text('College Portal'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for colleges, exams, courses...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),

            // Categories
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryItem(Icons.school, 'Colleges'),
                  _buildCategoryItem(Icons.book, 'Exams'),
                  _buildCategoryItem(Icons.menu_book, 'Courses'),
                  _buildCategoryItem(Icons.public, 'Abroad'),
                ],
              ),
            ),

            // Featured Colleges
            SectionHeader(
              title: 'Top Colleges',
              onViewAll: () {
                Navigator.pushNamed(context, '/college_list');
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: featuredColleges.length > 3 ? 3 : featuredColleges.length,
              itemBuilder: (context, index) {
                return CollegeCard(
                  college: featuredColleges[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/college_detail',
                      arguments: featuredColleges[index],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent.withOpacity(0.1),
            child: Icon(icon, color: Colors.blueAccent, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
