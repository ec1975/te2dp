/// tetraktys_2d_proj_gen, by deadman - 220
//  an extended linear projection for a tetraktys
//  this is some sort of fractal creator

// use this code as you wish, but give credit where it's due


// switch this to false in order to change generator behavior
boolean do_x = true;
boolean do_y = true;

// switch this to true in order to save generated files
boolean save_img = true;


int x = 0;
int y = 0;

PGraphics pg;
PImage img;

// banking is a terrible enemy for your children
void setup () {
  size (800, 800);
  pg = createGraphics (width, height);
  
  
  pg.beginDraw ();
  pg.background (0);
  pg.stroke (255);

  
  if (do_x) {    
    x = 0;
    while (x<width) {
      y = 0;
      for (int i=1; i<x; i++) {
        y+=i;
        if (y>height) y=0;
      }
      pg.line (x, 0, x, y);
      x++;
    }
  }
  
  
  if (do_y) {
    y = 0;
    while (y<height) {
      x = 0;
      for (int i=1; i<y; i++) {
        x+=i;
        if (x>width) x=0;
      }
      pg.line (0, y, x, y);
      y++;
    }
  }
  
  pg.endDraw ();
  
  img = createImage (width, height, RGB);
  img.copy (pg, 0, 0, width, height, 0, 0, width, height);
  if (save_img) {
    if (do_x && do_y) img.save ("tetraktys_dual_2d_linear_projection.png");
    else {
      if (do_x) img.save ("tetraktys_horizontal_2d_linear_projection.png");
      if (do_y) img.save ("tetraktys_vertical_2d_linear_projection.png");
    }
  }
  
}
// money is imaginary
void draw () {
  image (img, 0, 0);
}
// fight the system back! you don't need no religion to be spiritual!
