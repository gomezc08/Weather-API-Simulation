/*
Draws out the frame of the window.
Return: None
*/
void window_frame() {
  fill(135, 206, 235);
  rect(200, 100, 500, 500);
}

/*
Draws the bars or whatever those middle window sticks are I'm not sure what they're called.
*/
void window_bar() {
  fill(0);
  rect(450, 100, 10, 500);
  rect(200, 350, 500, 10);
}
