import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/core/core.dart';
import 'package:weather_app/features/home/data/models/weather_forecast/weather_forecast_response.dart';
import 'package:weather_app/features/home/presentation/bloc/saved_location/saved_location_bloc.dart';

import '../../../../../injector_container.dart';

class SavedLocationItem extends StatelessWidget {
  final WeatherForecastResponse response;

  const SavedLocationItem({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: AppUtils.kBorderRadius16,
          child: Dismissible(
            direction: DismissDirection.endToStart,
            behavior: HitTestBehavior.translucent,
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              alignment: Alignment.centerRight,
            ),
            key: ValueKey(
              "${response.lastUpdatedAt?.microsecondsSinceEpoch ?? DateTime.now().microsecondsSinceEpoch}",
            ),
            onDismissed: (direction) => getIt.get<SavedLocationBloc>().add(
                DeleteLocationEvent(cityName: '${response.location?.name}')),
            child: Container(
              width: double.infinity,
              padding: AppUtils.kPaddingAll16,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.3),
                borderRadius: AppUtils.kBorderRadius16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${response.location?.name}",
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${response.current?.condition?.text}",
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 12),
                      ),
                      AppUtils.kGap16,

                      /// Humidity
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: 'Humidity ',
                                style: TextStyle(fontWeight: FontWeight.w200)),
                            TextSpan(
                                text: '${response.current?.humidity}%',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),

                      /// Wind
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: 'Wind ',
                                style: TextStyle(fontWeight: FontWeight.w200)),
                            TextSpan(
                                text: '${response.current?.windKph}km/h',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Lottie.asset(
                        response.current?.condition?.text.lottiePath ??
                            AppAssets.lottie.cloud.path,
                        height: DeviceScreen.h(context) / 16,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${response.current?.tempC}",
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            '°C',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 15,
                              height: 1.5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        AppUtils.kGap16,
      ],
    );
  }
}
