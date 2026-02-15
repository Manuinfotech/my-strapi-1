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
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'Search for colleges, exams, courses...',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
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
            backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
            child: Icon(icon, color: Colors.blueAccent, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
