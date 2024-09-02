# Weather App

Weather App adalah aplikasi ramalan cuaca. Aplikasi ini menggunakan data dari BMKG (Badan Meteorologi, Klimatologi, dan Geofisika).

## Installation

1. Siapkan IDE (Integrated Development Environment), seperti VS Code atau Android Studio.
2. Install Flutter.
3. Clone projek ini dari Github atau unduh file Zip-nya. Cloning projek dapat dilakukan dengan menggunakan command prompt berikut:
   ```
   git clone https://github.com/otakmager/weather_app.git
   ```
4. Unduh dependency yang diperlukan menggunakan command prompt berikut:
   ```
   flutter pub get
   ```
5. Jalankan aplikasi menggunakan browser, windows, smartphone, emulator, atau device yang mendukung Flutter.

## Preview Mobile App

Preview yang disediakan adalah screenshot pada platform Android yang diambil pada tanggal 2 September2024. Berikut ini adalah beberapa tampilan yang disediakan:

1. Screenshot 1\
   <img src="https://github.com/otakmager/weather_app/blob/main/assets/readme/4.screenshot_1.jpg" width="240">
2. Screenshot 2\
   <img src="https://github.com/otakmager/weather_app/blob/main/assets/readme/5.screenshot_2.jpg" width="240">

## Problem

API resmi BMKG tidak dapat diakses. Hal tersebut terjadi karena pembaruan sistem. Selain itu, laman https://data.bmkg.go.id/prakiraan-cuaca hanya menyediakan data yang tidak mutakhir dalam bentuk xml. Oleh karena itu, aplikasi ini dibuat dengan melakukan penyesuain dengan menggunakan Unofficial Weather API Wrapper from XML to JSON.

1. Bukti pembaruan sistem BMKG\
   <img src="https://github.com/otakmager/weather_app/blob/main/assets/readme/1.upgrade_sistem_bmkg.JPG" height="320">
2. Dokumentasi API resmi BMKG\
   <img src="https://github.com/otakmager/weather_app/blob/main/assets/readme/2.dokumentasi_API_resmi.JPG" height="320">
3. Mencoba API resmi di Postman tapi Not Found\
   <img src="https://github.com/otakmager/weather_app/blob/main/assets/readme/3.coba_API_resmi_not_found.JPG" height="320">
4. Terdapat masalah CORS dari Unofficial Weather API. Hal ini hanya berdampak pada device web, seperti Edge dan Chrome. Jika ingin mencoba pada device ini bisa menggunakan command berikut:
   ```
   flutter run -d chrome --web-browser-flag "--disable-web-security"
   ```

## Credit

1. Repository pemilik Unofficial Weather API Wrapper from XML to JSON data BMKG
   ```
   https://github.com/pace11/weather-api
   ```
   Link Swagger
   ```
   https://weather-api-tau-six.vercel.app/api-docs/
   ```
2. Aset dari Figma
   ```
   https://www.figma.com/community/file/1283826005232351466
   ```
