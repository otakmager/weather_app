import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/parameter_weather.dart';
import '../../data/model/ui_state.dart';
import '../../data/model/weather.dart';
import '../../utils/get_specific_parameter.dart';
import '../../widgets/components/dialog_error.dart';
import '../../widgets/components/dialog_loading.dart';
import '../../widgets/components/info_main.dart';
import '../../widgets/components/info_source.dart';
import '../../widgets/components/list_weather.dart';
import '../../widgets/screen/error_screen.dart';
import '../../widgets/screen/loading_screen.dart';
import '../viewmodel/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.getLocations();
  }

  @override
  Widget build(BuildContext context) {
    bool isDialogLoadingShown = false;

    return Scaffold(body: Consumer<HomeViewModel>(
      builder: (context, HomeViewModel viewModel, child) {
        // WidgetsBinding.instance.addPostFrameCallback((_) {
        //   if (viewModel.uiStateWeather == UiState.loading &&
        //       !isDialogLoadingShown) {
        //     isDialogLoadingShown = true;
        //     dialogLoading(context);
        //   } else if (viewModel.uiStateWeather == UiState.error &&
        //       isDialogLoadingShown) {
        //     isDialogLoadingShown = false;
        //     Navigator.of(context, rootNavigator: true).pop();
        //     dialogError(
        //       context,
        //       viewModel.errorInfo?.statusCode,
        //       viewModel.errorInfo?.message,
        //       () {
        //         viewModel.setUiStateWeather(null);
        //       },
        //     );
        //   }
        // });

        return Builder(builder: (context) {
          if (viewModel.uiStateProvinces == UiState.loading) {
            return const LoadingScreen();
          } else if (viewModel.uiStateProvinces == UiState.error) {
            return ErrorScreen(
              statusCode: viewModel.errorInfo?.statusCode,
              message: viewModel.errorInfo?.message,
              refresh: viewModel.getLocations,
            );
          } else if (viewModel.uiStateProvinces == UiState.success) {
            return Builder(builder: (context) {
              if (viewModel.weather != null &&
                  viewModel.parameterWeather != null &&
                  viewModel.isReady) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InfoMain(
                        date: viewModel.weather!.getDate(),
                        locations: viewModel.listLocations!,
                        cities: viewModel.listCity!,
                        parameterWeather: viewModel.parameterWeather!,
                        indexSelectedProv: viewModel.idxSelectedProv,
                        setIndexSelectedProv: viewModel.setIdxSelectedProv,
                        setIndexSelectedCity: viewModel.setIdxSelectedCity,
                        getNewCity: viewModel.getWeather,
                      ),
                      const SizedBox(height: 24),
                      ListWeather(
                        area:
                            viewModel.weather!.area[viewModel.idxSelectedCity],
                      ),
                      const SizedBox(height: 8),
                      const InfoSource()
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Memuat data...'));
              }
            });
          } else {
            return const Center(child: Text('Uknown Error'));
          }
        });
      },
    ));
  }
}
