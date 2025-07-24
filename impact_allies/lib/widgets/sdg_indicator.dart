import 'package:flutter/material.dart';
import '../models/user_model.dart';

class SDGIndicator extends StatelessWidget {
  final SDGGoal sdg;

  const SDGIndicator({
    super.key,
    required this.sdg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: _getSDGColor(sdg),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SDG',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${sdg.index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSDGColor(SDGGoal sdg) {
    const colors = [
      Color(0xFFE5243B), // 1. No Poverty
      Color(0xFFDDA63A), // 2. Zero Hunger
      Color(0xFF4C9F38), // 3. Good Health
      Color(0xFFC5192D), // 4. Quality Education
      Color(0xFFFF3A21), // 5. Gender Equality
      Color(0xFF26BDE2), // 6. Clean Water
      Color(0xFFFCC30B), // 7. Affordable Energy
      Color(0xFFA21942), // 8. Decent Work
      Color(0xFFFF6900), // 9. Industry Innovation
      Color(0xFFDD1367), // 10. Reduced Inequalities
      Color(0xFFFF9300), // 11. Sustainable Cities
      Color(0xFFBF8B2E), // 12. Responsible Consumption
      Color(0xFF3F7E44), // 13. Climate Action
      Color(0xFF0A97D9), // 14. Life Below Water
      Color(0xFF56C02B), // 15. Life on Land
      Color(0xFF00689D), // 16. Peace Justice
      Color(0xFF19486A), // 17. Partnerships
    ];
    
    return colors[sdg.index];
  }
}