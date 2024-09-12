// import 'package:lottie/lottie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skeletonizer/skeletonizer.dart';
//
// import 'widgets/widgets.dart';
// import '../../../../core/core.dart';
// import '../../../../injector_container.dart';
// import '../bloc/weather/weather_forecast_bloc.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider.value(
//       value: getIt<WeatherForecastBloc>(),
//       child: Scaffold(
//         backgroundColor: Colors.blue,
//         endDrawer: const HomeDrawer(),
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(AppAssets.images.tashkent.path),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: SafeArea(
//             child: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
//               builder: (BuildContext context, WeatherForecastState state) {
//                 return switch (state.weatherForecastStatus){
//                   WeatherForecastStatus.initial => const FlutterLogo(),
//                   WeatherForecastStatus.error=> const FlutterLogo(),
//                   WeatherForecastStatus.loading ||WeatherForecastStatus.loaded => const FlutterLogo(),
//                 }
//                 return state.weatherForecastStatus.isError
//                     ? Center(
//                   child: Text(
//                     'Error: ${state.errorMessage}',
//                     style: TextStyle(
//                       color: AppColors.white,
//                     ),
//                   ),
//                 )
//                     : RefreshIndicator(
//                   color: AppColors.white,
//                   backgroundColor: AppColors.grey.withOpacity(0.5),
//                   onRefresh: () async =>
//                       getIt
//                           .get<WeatherForecastBloc>()
//                           .add(GetWeatherByNameEvent(
//                         cityName: state.weatherForecastResponse?.location
//                             ?.name ??
//                             'tashkent',
//                       )),
//                   child: Skeletonizer(
//                     enableSwitchAnimation: true,
//                     ignorePointers: false,
//                     justifyMultiLineText: true,
//                     enabled: state.weatherForecastStatus.isLoading,
//                     child: Column(
//                       children: [
//
//                         /// app bar
//                         CustomAppBar(
//                           locationName: state
//                               .weatherForecastResponse?.location?.name,
//                         ),
//
//                         Expanded(
//                           child: ListView(
//                             padding: AppUtils.kPaddingHor16,
//                             shrinkWrap: true,
//                             children: [
//
//                               /// current date
//                               Skeleton.keep(
//                                 child: Text(
//                                   DateTime
//                                       .now()
//                                       .formatDate,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                     fontSize: 26,
//                                     fontWeight: FontWeight.w600,
//                                     color: AppColors.white,
//                                   ),
//                                 ),
//                               ),
//
//                               /// last updated at
//                               Text(
//                                 "Updated ${state.weatherForecastResponse
//                                     ?.lastUpdatedAt?.formatDateUpdated}",
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                   color: AppColors.white,
//                                 ),
//                               ),
//                               AppUtils.kGap16,
//
//                               /// lottie by weather info
//                               Lottie.asset(
//                                 state.weatherForecastResponse?.current
//                                     ?.condition?.text.lottiePath ??
//                                     AppAssets.lottie.cloud.path,
//                                 height: DeviceScreen.h(context) / 10,
//                               ),
//                               AppUtils.kGap16,
//
//                               /// weather condition
//                               Text(
//                                 "${state.weatherForecastResponse?.current
//                                     ?.condition?.text}",
//                                 style: const TextStyle(
//                                   color: AppColors.white,
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//
//                               /// weather temperature
//                               Row(
//                                 crossAxisAlignment:
//                                 CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "${state.weatherForecastResponse?.current
//                                         ?.tempC?.round().toString()}",
//                                     style: const TextStyle(
//                                       color: AppColors.white,
//                                       fontSize: 80,
//                                       fontWeight: FontWeight.w800,
//                                     ),
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   const Text(
//                                     '°C',
//                                     style: TextStyle(
//                                       color: AppColors.white,
//                                       fontSize: 30,
//                                       height: 2.5,
//                                       fontWeight: FontWeight.w800,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//
//                         /// weather info's
//                         WeatherData(
//                           weatherForecastResponse:
//                           state.weatherForecastResponse,
//                         ),
//
//                         /// weather forecast for three days
//                         ThreeDayForecast(
//                           weatherForecastResponse:
//                           state.weatherForecastResponse,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
