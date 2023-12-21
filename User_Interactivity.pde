// chatgpt sent me to a webpage to handle input/user requests since processing didn't really have a way to do so: https://docs.oracle.com/javase/8/docs/api/javax/swing/JOptionPane.html
import javax.swing.JOptionPane;

// global prompt variables.
String city;
String state;

/*
After clicking the screen, a pane requests info on an API location.
Return: String, which represents the location (city, state).
*/
String prompt() {
  city = JOptionPane.showInputDialog("Enter the city/state:");
  state = JOptionPane.showInputDialog("Enter the state/country:");
  
  // Check if the user clicked cancel or closed the dialog
  if ((city == null || city.isEmpty()) || (state == null || state.isEmpty())) {
    exit(); // Exit the program
  }
  return city + ", " + state; 
}
