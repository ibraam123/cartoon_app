import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SegmentOption extends StatelessWidget {
  final String label;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;

  const SegmentOption({
    super.key,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(height: 6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                color: isSelected ? const Color(0xFF56B9E6) : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),
            // underline indicator
            Container(
              height: 3.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF56B9E6) : Colors.transparent,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}