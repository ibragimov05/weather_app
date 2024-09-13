import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'widgets.dart';
import '../../../../../core/core.dart';
import '../../../../../injector_container.dart';
import '../../bloc/saved_location/saved_location_bloc.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<SavedLocationBloc>(),
      child: Container(
        width: DeviceScreen.w(context) * 0.95,
        padding: AppUtils.kPaddingAll16,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2E1A47),
              Color(0xFF1E0F2E),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saved locations',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<SavedLocationBloc, SavedLocationState>(
                  builder: (context, state) {
                    return RefreshIndicator(
                      onRefresh: () async => getIt
                          .get<SavedLocationBloc>()
                          .add(RefreshSavedLocationsWeatherEvent(
                            weatherForecasts: state.savedLocationsWeathers,
                          )),
                      child: switch (state.status) {
                        SavedLocationStatus.initial => const WeatherEmpty(),
                        SavedLocationStatus.error => Center(
                            child: Text('Error: ${state.error}'),
                          ),
                        SavedLocationStatus.loaded ||
                        SavedLocationStatus.loading =>
                          Skeletonizer(
                            enabled: state.status.isLoading,
                            child: state.savedLocationsWeathers.isEmpty
                                ? const WeatherEmpty()
                                : ListView.builder(
                                    itemCount:
                                        state.savedLocationsWeathers.length,
                                    padding: AppUtils.kPaddingAll16,
                                    itemBuilder: (context, index) =>
                                        SavedLocationItem(
                                      response:
                                          state.savedLocationsWeathers[index],
                                    ),
                                  ),
                          ),
                      },
                    );
                  },
                ),
              ),
              FilledButton(
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const AddNewPlaceModal(),
                ),
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(AppUtils.kPaddingAll16),
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.grey.withOpacity(0.3)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline_rounded),
                    AppUtils.kGap8,
                    Text(
                      'Add new',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
