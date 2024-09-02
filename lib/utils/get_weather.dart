String getWeather(String id) {
  if (id == "0") {
    return "Cerah";
  } else if (id == "1" || id == "2") {
    return "Cerah Berawan";
  } else if (id == "3") {
    return "Berawan";
  } else if (id == "4") {
    return "Berawan Tebal";
  } else if (id == "5") {
    return "Udara Kabur";
  } else if (id == "10") {
    return "Asap";
  } else if (id == "45") {
    return "Kabut";
  } else if (id == "60") {
    return "Hujan Ringan";
  } else if (id == "61") {
    return "Hujan Sedang";
  } else if (id == "63") {
    return "Hujan Lebat";
  } else if (id == "80") {
    return "Hujan Lokal";
  } else if (id == "95" || id == "97") {
    return "Hujan Petir";
  } else {
    return "Tidak Diketahui";
  }
}

String getWeatherAssets(String id, {bool isNight = false}) {
  if (id == "0") {
    if (isNight) {
      return 'assets/weathers/1_cerah_night.png';
    } else {
      return 'assets/weathers/1_cerah_day.png';
    }
  } else if (id == "1" || id == "2") {
    if (isNight) {
      return 'assets/weathers/2_cerah_awan_night.png';
    } else {
      return 'assets/weathers/2_cerah_awan_day.png';
    }
  } else if (id == "3") {
    if (isNight) {
      return 'assets/weathers/3_berawan_night.png';
    } else {
      return 'assets/weathers/3_berawan_day.png';
    }
  } else if (id == "4") {
    return 'assets/weathers/4_berawan_tebal.png';
  } else if (id == "5" || id == "10" || id == "45") {
    return 'assets/weathers/5_udara_kabur.png';
  } else if (id == "60") {
    return 'assets/weathers/6_hujan_ringan.png';
  } else if (id == "61") {
    return 'assets/weathers/7_hujan_sedang.png';
  } else if (id == "63" || id == "80") {
    return 'assets/weathers/8_hujan_lebat.png';
  } else if (id == "95" || id == "97") {
    return 'assets/weathers/9_hujan_petir.png';
  } else {
    return 'assets/weathers/1_cerah_day.png';
  }
}
