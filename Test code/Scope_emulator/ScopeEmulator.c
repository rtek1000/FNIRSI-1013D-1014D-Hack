#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "xlibfunctions.h"

#include "armthread.h"
#include "armv5tl.h"

#include "resources.h"  //All the panel resources are defined in this file. Needs to be the last include file


int DrawScopePanel(tagXlibContext *xc);

#define DESIGN_WIDTH       920
#define DESIGN_HEIGHT      630

//ID's for communication between the threads and the main window
Window main_window_id = 0;
Window display_msg_id = 0;


int main(int argc,char **argv)
{
  //Since multi threads are used to control display objects initialize the xlib for it
  XInitThreads();
  
	Display *display = XOpenDisplay(NULL);
	int screen_num = DefaultScreen(display);
	Window root = RootWindow(display, screen_num);
	Window win = XCreateSimpleWindow(display, root, 0, 0, DESIGN_WIDTH + BORDER_SIZE_2, DESIGN_HEIGHT + BORDER_SIZE_2, 2, BlackPixel(display, screen_num), WhitePixel(display, screen_num));
  
	XMapWindow(display, win);
  
  //For mouse handling only button press and release are needed in combination with motion which is used for controlling the knobs
	XSelectInput(display, win, ExposureMask | KeyPressMask | ButtonPressMask | ButtonReleaseMask | PointerMotionMask );
  
	GC gc = XCreateGC(display, win, 0, NULL);
  
  unsigned int width;	           //width and height for the new window.
  unsigned int height;
  
  unsigned int x,y;
  
  Atom WM_DELETE_WINDOW = XInternAtom(display, "WM_DELETE_WINDOW", False); 
  Atom WM_PROTOCOLS = XInternAtom(display, "WM_PROTOCOLS", False);
  XSetWMProtocols(display, win, &WM_DELETE_WINDOW, 1);
  
  //Create atom for the display messages
  display_msg_id = XInternAtom(display, "SCOPE_DISPLAY_MESSAGE", False); 

  //Set the window id for message sending
  main_window_id = win;
  
	XEvent event;

  double fsize;
  
  int rflag = 1;

  tagXlibContext xc;

  int numsizes;  
  XRRScreenSize *scrsize;
  
  //Get the size of the primary monitor
  scrsize = XRRSizes(display, screen_num, &numsizes);
  
  //For calculations take of a border of 5 pixels for each side
  width  = (scrsize->width - BORDER_SIZE_2) * 0.95;
  height = scrsize->height - BORDER_SIZE_2;
   
  //Determine the scaler based on the width
  xc.scaler = (float)width / (float)DESIGN_WIDTH;

  //See if it scaled fits for the height. If not determine the scaler based on the height
  if((DESIGN_HEIGHT * xc.scaler) > height)
    xc.scaler = (float)height / (float)DESIGN_HEIGHT;
  
  //Check if screen is larger than the desired size
  if(xc.scaler > 1.0)
  {
    //If so keep the scale on 1
    xc.scaler = 1.0;
  }

  //Calculate the new width and height
  width = (DESIGN_WIDTH * xc.scaler) + BORDER_SIZE_2;
  height = (DESIGN_HEIGHT * xc.scaler) + BORDER_SIZE_2;
  
  //Calculate a nice position on the screen
  x = 1350;
  y = 50;
  
  //Set the window to the new position and dimensions
  XMoveResizeWindow(display, win, x, y, width, height);
  
  //Setup the data for the drawing functions
  xc.screen_num = screen_num;
  xc.root = root;
  xc.win = win;
  xc.display = display;
  xc.gc = gc;
  
  xc.visual = DefaultVisual(display, screen_num);
  xc.cmap  = DefaultColormap(display, screen_num);
    
  //Create all the used fonts
  fsize = 30 * xc.scaler;
  xc.font[0] = XftFontOpen(display, screen_num, XFT_FAMILY, XftTypeString, "Arial", XFT_WEIGHT, XftTypeInteger, XFT_WEIGHT_BOLD, XFT_SIZE, XftTypeDouble, fsize, XFT_ANTIALIAS, XftTypeBool, True, NULL);

  fsize = 16 * xc.scaler;
  xc.font[1] = XftFontOpen(display, screen_num, XFT_FAMILY, XftTypeString, "Arial Narrow", XFT_WEIGHT, XftTypeInteger, XFT_WEIGHT_BOLD, XFT_SIZE, XftTypeDouble, fsize, XFT_ANTIALIAS, XftTypeBool, True, NULL);
  
  //Create the used font colors
  rflag = XftColorAllocName(display, xc.visual, xc.cmap, TextColor, &xc.color[0]);

  rflag = XftColorAllocName(display, xc.visual, xc.cmap, LogoColor, &xc.color[1]);
  
  xc.draw = XftDrawCreate(display, win, xc.visual, xc.cmap);
  
  //Start the arm emulator window thread
  startarmemulator();
  
  //Start the arm processing core
  startarmcore();
  
  //Keep running until window is destroyed
	while(rflag)
	{
		XNextEvent(display, &event);
		switch(event.type)
		{
			case Expose:
        //Setup the screen
        DrawScopePanel(&xc);
				break;
        
			case KeyPress:
				if(event.xkey.keycode == XKeysymToKeycode(display,XK_Escape))
				{
					rflag = 0;
				}
        break;
        
      case ButtonPress:
        //Call mouse handling function down()
//        MouseDown(&event);
        break;
        
      case ButtonRelease:
        //Call mouse handling function up()
//        MouseUp(mouseranges, &event);
        break;
        
      case MotionNotify:
        //Call mouse handling function move()
//        MouseMove(mouseranges, &event);
        break;
        
      case ClientMessage:
        if((event.xclient.message_type == WM_PROTOCOLS) && (event.xclient.data.l[0] == WM_DELETE_WINDOW))
        {
					rflag = 0;
        }
        else if(event.xclient.message_type == display_msg_id)
        {
          //Here the scope display update needs to be done
//          LedDisplaySetBCD(&leddisplays[event.xclient.data.l[0]], event.xclient.data.l[1]);
        }
        break;
		}
	}
  
  
  //Stop the arm processing core
  stoparmcore();
  
  //Stop the arm emulator window thread from running
  stoparmemulator();
  
  //Cleanup on close  
  XftColorFree(display, xc.visual, xc.cmap, &xc.color[0]);
  XftColorFree(display, xc.visual, xc.cmap, &xc.color[1]);
  XftDrawDestroy(xc.draw);
  
  //Signal window no longer available for messages
  main_window_id = 0;
  display_msg_id = 0;
  WM_PROTOCOLS = 0;
  WM_DELETE_WINDOW = 0;
  
  //Throw away the window and close up the display
  XDestroyWindow(display, win);
	XCloseDisplay(display);
	return 0;
}

//Function for drawing the frontpanel and all the objects on it
int DrawScopePanel(tagXlibContext *xc)
{
  //Draw the scope outline
  DrawFillRoundedRect(xc, 0, 0, 20, 920, 630, ScopeBorderColor, ScopeOuterLineColor, 1);
  
  //Draw the scope glass panel 
  DrawFillRoundedRect(xc, 8, 8, 16, 904, 614, ScopeBlackColor, ScopeBlackColor, 1);

  //Draw the display  
  DrawFillRect(xc, 60, 60, 800, 480, ScopeDisplayColor, ScopeDisplayColor, 1);

  //Place the front panels text  
  PlaceText(xc, 70, 600, "TABLET", 0, 0, ALIGN_TEXT_LEFT);
  PlaceText(xc, 250, 600, "OSCILLOSCOPE", 1, 0, ALIGN_TEXT_LEFT);

  PlaceText(xc, 780, 575, "100MHZ", 1, 0, ALIGN_TEXT_LEFT);
  PlaceText(xc, 780, 600, "1 GSa/s", 1, 0, ALIGN_TEXT_LEFT);

  return 0;
}
