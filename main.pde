/*
PROJECT OVERVIEW - Weather API simulation that simulates the weather of whatever location around the world.
CREDIT: https://openprocessing.org/sketch/1176056
Joseph C makes a random snow animation. I liked the idea of a window and creating each weather as a class and can make 50 objects for example of each.  
*/

void setup() {
  size(1400, 700);
  background(0);
  
  // defining our objects.
  s = new Snowflake[100];
  for (int i = 0; i < s.length; i++) {
    s[i] = new Snowflake();
  }
  r = new Rain[100];
  
  for(int i = 0; i < r.length; i++) {
    r[i] = new Rain();
  }
  
  c = new Cloud[5];
  for(int i = 0; i < c.length; i++) {
    c[i] = new Cloud();
  }
  f = new Fog[2000];
  for (int i = 0; i < f.length; i++){
    float x = random(150,700);
    float y = random(150,600);
    float r = random(20,80);
    f[i] = new Fog(x,y,r);
  }
  
  sun = new Sun();
}

void draw() {
  background(0);
  window_frame();
  if(weatherDescriptions != null) {
    // preprocessing: getting all the data from json array and converting it to a normal array and sperating all our weather conditions into seperate strings/indices: https://processing.org/reference/JSONArray_getString_.html + chatgpt help.
    String weather_json = weatherDescriptions.getString(0);
    weather_con = weather_json.split(", ");
    
   // go through our array and turn on animation flag depending on weather condition.
    for(int i = 0; i < weather_con.length; i++) {
      String weather = weather_con[i];
      if (weather.equals("Mist") || weather.equals("Partly cloudy") || weather.equals("Cloudy") || weather.equals("Overcast")) {
        runCloud = true;
      }
      else if(weather.equals("Rain") || weather.equals("Light rain") || weather.equals("Heavy Rain") || weather.equals("Patchy freezing drizzle possible") || weather.equals("Patchy light drizzle") || weather.equals("Light drizzle") || weather.equals("Freezing drizzle") || weather.equals("Heavy freezing drizzle") || weather.equals("Patchy light rain") || weather.equals("Light Drizzle And Rain") || weather.equals("Freezing drizzle") || weather.equals("Heavy freezing drizzle") || weather.equals("Light Rain") || weather.equals("Light Rain Shower") || weather.equals("Moderate rain at times") || weather.equals("Heavy rain at times") || weather.equals("Light freezing rain")) {
        runRain = true;
      }
      else if(weather.equals("Blowing snow") || weather.equals("Blizzard") || weather.equals("Snow")) {
        runSnow = true;
      }
      else if(weather.equals("Fog")) {
        runFog = true;
      }
      else if(weather.equals("Sunny")) {
        runSun = true;
      }
      // else we dont play an animation for clear haha
    }
  }
  // animations.
  simulate_animations();
  
  //cloud_animation(true);
  window_bar(); 
  
  // display our weather data.
  weather_data();
}

void mouseClicked() {
  location = prompt();
  System.out.println(location);
  // reset weather boolean variables.
  runCloud = false;
  runSnow = false;
  runRain = false;
  runFog = false;
  runSun = false;
  if(location.equals("chris, gomez")) {
    runCloud = true;
    runSnow = true;
    runRain = true;
    runFog = true;
    runSun = true;
  }
  else {
    // go ahead and make an API call for each location.  IMPT: DON'T MISPLACE API FUNCTION!
    API();
  }
}
