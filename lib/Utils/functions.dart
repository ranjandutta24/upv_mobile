getBaseUrl() {
  // return "http://64.227.151.183:4051/api";
  // return "http://128.199.24.60:4051/api";
  // return "http://10.150.50.23:4050/api";
}

// var token = 'Bearer c2lzeFJNR0F1dGg6UzE5TCRJc1g=';
// Map<String, dynamic> userDetails = {};
Map<String, dynamic> infoDetails = {};

// void saveUserDetails(Map<String, dynamic> data) {
//   userDetails = data;
// }

// Map<String, dynamic> getUserDetails() {
//   return userDetails;
// }
void saveInfoDetails(Map<String, dynamic> data) {
  infoDetails = data;
}

Map<String, dynamic> getInfoDetails() {
  return infoDetails;
}

// getValidToken() {
//   return token;
// }
