import '../models/college.dart';
import '../models/course.dart';

class MockDataService {
  static List<College> getColleges() {
    return [
      College(
        id: '1',
        name: 'IIT Bombay',
        location: 'Mumbai, Maharashtra',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.8,
        courses: ['B.Tech', 'M.Tech', 'PhD'],
        description: 'Indian Institute of Technology Bombay is a public technical and research university located in Powai, Mumbai, Maharashtra, India.',
      ),
      College(
        id: '2',
        name: 'IIT Delhi',
        location: 'New Delhi, Delhi',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.7,
        courses: ['B.Tech', 'M.Tech', 'MBA'],
        description: 'Indian Institute of Technology Delhi is a public technical and research university located in Hauz Khas, Delhi, India.',
      ),
      College(
        id: '3',
        name: 'BITS Pilani',
        location: 'Pilani, Rajasthan',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.6,
        courses: ['B.E.', 'M.E.', 'M.Sc'],
        description: 'Birla Institute of Technology and Science, Pilani is a private deemed university in Pilani, India.',
      ),
      College(
        id: '4',
        name: 'Anna University',
        location: 'Chennai, Tamil Nadu',
        imageUrl: 'https://via.placeholder.com/150',
        rating: 4.5,
        courses: ['B.E.', 'M.E.', 'MBA', 'MCA'],
        description: 'Anna University is a public state university located in Tamil Nadu, India.',
      ),
    ];
  }

  static List<Course> getCourses() {
    return [
      Course(id: '1', name: 'Computer Science', duration: '4 Years', fees: '₹ 2,00,000 / Year'),
      Course(id: '2', name: 'Mechanical Engineering', duration: '4 Years', fees: '₹ 1,80,000 / Year'),
      Course(id: '3', name: 'Civil Engineering', duration: '4 Years', fees: '₹ 1,80,000 / Year'),
      Course(id: '4', name: 'Electrical Engineering', duration: '4 Years', fees: '₹ 1,90,000 / Year'),
    ];
  }
}
