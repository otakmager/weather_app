String getWindDirectionInIndonesia(String direction) {
  if (direction == "N") {
    return "Utara";
  } else if (direction == "NNE") {
    return "Utara Timur Laut";
  } else if (direction == "NE") {
    return "Timur Laut";
  } else if (direction == "ENE") {
    return "Timur Timur Laut";
  } else if (direction == "E") {
    return "Timur";
  } else if (direction == "ESE") {
    return "Timur Tenggara";
  } else if (direction == "SE") {
    return "Tenggara";
  } else if (direction == "SSE") {
    return "Selatan Tenggara";
  } else if (direction == "S") {
    return "Selatan";
  } else if (direction == "SSW") {
    return "Selatan Barat Daya";
  } else if (direction == "SW") {
    return "Barat Daya";
  } else if (direction == "WSW") {
    return "Barat Barat Daya";
  } else if (direction == "W") {
    return "Barat";
  } else if (direction == "WNW") {
    return "Barat Barat Laut";
  } else if (direction == "NW") {
    return "Barat Laut";
  } else if (direction == "NNW") {
    return "Utara Barat Laut";
  } else if (direction == "VARIABLE") {
    return "Berubah-ubah";
  } else {
    return "Tidak Diketahui";
  }
}
