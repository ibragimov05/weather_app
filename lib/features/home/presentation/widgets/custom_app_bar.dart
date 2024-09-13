import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/core.dart';

class CustomAppBar extends StatelessWidget {
  final String? locationName;

  const CustomAppBar({super.key, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingAll24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Skeleton.keep(
                child: Icon(
                  Icons.location_pin,
                  color: AppColors.white,
                ),
              ),
              Text(
                "$locationName",
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          Skeleton.keep(
            child: IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: const Icon(
                Icons.menu,
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
