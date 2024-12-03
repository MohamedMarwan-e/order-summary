import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({
    required this.title,
    required this.value,
    this.width,
    super.key,
  });

  final String title;
  final String value;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Container(
      height: Responsive.isMobile(context) ? media.height * 0.25 :media.height * 0.28,
      width: width ?? media.width * 0.9,
      decoration: BoxDecoration(
        color: const Color(0xFF1A73E8).withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(-4, 4),
            blurRadius: 8,
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: media.height * 0.18,width: media.width * 0.35,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(value,
                  style: Theme.of(context).textTheme.headlineMedium
              ),
            ),
          ),
          Text(title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white
              )
          ),
        ],
      ),
    );
  }
}