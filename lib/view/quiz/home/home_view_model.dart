import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:interview_app/view/quiz/job/job_detail_view.dart';

class HomeViewModel extends ChangeNotifier {
  // Sample job listings data
  List<Map<String, dynamic>> jobListings = [
    {
      'title': 'Mobil Geliştirici',
      'description': 'Mobil uygulamalar geliştirmek için tecrübeli geliştirici aranıyor.',
      'icon': Icons.phone_android,
      'date': '01.07.2024',
      'openPositions': 3,
    },
    {
      'title': 'Veri Analisti',
      'description': 'Veri analizi ve yönetimi konusunda uzman.',
      'icon': Icons.data_usage,
      'date': '01.07.2024',
      'openPositions': 2,
    },
    {
      'title': 'İnsan Kaynakları Uzmanı',
      'description': 'İşe alım ve çalışan ilişkileri yönetimi.',
      'icon': Icons.group,
      'date': '01.07.2024',
      'openPositions': 1,
    },
    {
      'title': 'Pazarlama Uzmanı',
      'description': 'Pazar araştırması ve reklamcılık.',
      'icon': Icons.campaign,
      'date': '01.07.2024',
      'openPositions': 4,
    },
    {
      'title': 'Finans Uzmanı',
      'description': 'Finansal planlama ve yönetim.',
      'icon': Icons.attach_money,
      'date': '01.07.2024',
      'openPositions': 1,
    },
  ];

  void navigateToJobDetails(BuildContext context, String departmentName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JobDetailsView(departmentName: departmentName),
      ),
    );
  }


  // AppBar properties
  String get appBarTitle => 'Anasayfa';

  void onBackPressed(BuildContext context) {
    Navigator.of(context).pop();
  }

  void onLogoutPressed(BuildContext context) {
    // Implement logout logic here
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void onSearchPressed() {
    // Implement search functionality here if needed
  }
}
