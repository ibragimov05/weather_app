sealed class Constants {
  const Constants._();

  // https://api.open-meteo.com/v1/forecast
  static const String baseUrl = 'https://api.weatherapi.com/v1/forecast.json';
  static const String queryParameter =
      '&daily=temperature_2m_max,temperature_2m_min,apparent_temperature_max,apparent_temperature_min,relative_humidity_2m_max,relative_humidity_2m_min,windspeed_10m_max&timezone=auto';

  // static const
}
