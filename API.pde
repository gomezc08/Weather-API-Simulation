//String apiKey = "169e37b13aa3e09913a58782b48d5f3c";   <- old key before I used all 1000 API requests by accident haha.
String location;
String apiKey = "e9c7c8527935ee2db0af901ff0245563";

float temperatureFahrenheit;
float windSpeed;
int windDegree;
String windDirection;
float precip;
int humidity;
String[] weather_con;
JSONArray weatherDescriptions;     // important: we will simulate weather conditions based on this.


/*
Performs an API call to weatherstack and retrives key parameters of interest that are used for our weather simulation.
return: None.
*/
void API() {
  // Make the API call.
  String apiUrl = "http://api.weatherstack.com/current?access_key=" + apiKey + "&query=" + location + ", United States of America";
  JSONObject weatherData = loadJSONObject(apiUrl);

  // Process the JSON response.
  if (weatherData != null) {
    JSONObject current = weatherData.getJSONObject("current");
    float temperatureCelsius = current.getFloat("temperature");

    // Convert temperature to Fahrenheit.
    temperatureFahrenheit = celsiusToFahrenheit(temperatureCelsius);

    // Extract additional information.
    windSpeed = current.getFloat("wind_speed");
    windDegree = current.getInt("wind_degree");
    windDirection = current.getString("wind_dir");
    precip = current.getFloat("precip");
    humidity = current.getInt("humidity");
    
    weatherDescriptions = current.getJSONArray("weather_descriptions");
  } 
  else {
    println("Error loading weather data from API");
  }
}

/*
Calculates the conversion of celsius to fahrenheit.
Return: float, which represents the celsius to fahernheit conversion.
*/
float celsiusToFahrenheit(float celsius) {
  return celsius * 9/5 + 32;
}
