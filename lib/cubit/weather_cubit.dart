import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  static WeatherCubit get(context) => BlocProvider.of(context);

  final WeatherService weatherService;

  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherError(error: e.toString()));
    }
  }
}
