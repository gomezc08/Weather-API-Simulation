// weather objects.
Snowflake[] s;
Rain[] r;
Cloud[] c;
Fog[] f;
Sun sun;

// weather global boolean run flags.
boolean runCloud = false;
boolean runSnow = false;
boolean runRain = false;
boolean runFog = false;
boolean runSun = false;

/*
Displays weather data about a certain API location.
Return: None.
*/
void weather_data() {
  fill(255);
  textSize(20);
  text("Temperature in " + location + ": " + temperatureFahrenheit + "°F", 850, 290);
  text("Wind Speed: " + windSpeed + " m/s", 850, 320);
  text("Wind Direction: " + windDirection + " (" + windDegree + "°)", 850, 350);
  text("Humidity: " + humidity + "%", 850, 380);
  text("Weather conditions...", 850, 410);
  int j = 440;
  if(weatherDescriptions != null) {
    for(int i = 0; i < weather_con.length; i++) {
      text(weather_con[i], 1000, (j + (30 * i)));
    }
  }
}

/*
Performs a rain weather simulation.
Return: None.
*/
void rain_animation(boolean run) {
  if(run) {
    for (Rain i : r) {
      i.update();
      i.display();
    }
  }
}

/*
Performs a snow weather simulation.
Return: None.
*/
void snow_animation(boolean run) {
  if(run) {
    for (Snowflake flake : s) {
      flake.update();
      flake.display();
    }
  }
}

/*
Performs a cloud weather simulation.
Return: None.
*/
void cloud_animation(boolean run) {
  if(run) {
    for (Cloud cloud : c) {
      cloud.update();
      cloud.display();
    }
  }
}

/*
Performs a sunny weather simulation.
Return: None.
*/
void sun_animation(boolean run) {
  if(run) {
    sun.display();
  }
}

/*
Performs a fog weather simulation.
Return: None.
*/
void fog_animation(boolean run) {
  if(run) {
    for(Fog fog : f) {
      fog.update();
      fog.display(); 
    }
  }
}

/*
Performs a weather simulations based on run flags.
Return: None.
*/
void simulate_animations() {
  cloud_animation(runCloud);
  snow_animation(runSnow);
  rain_animation(runRain);
  fog_animation(runFog);
  sun_animation(runSun);
}
