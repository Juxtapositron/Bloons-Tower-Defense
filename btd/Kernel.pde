Kernel blur = new Kernel( new float[][] {
    {.111, .111, .111},
    {.111, .111, .111},
    {.111, .111, .111}    });

public class Kernel {
      float[][]kernel;

      /**Constructor takes the kernel that will be applied to the image
      *This implementation only allows 3x3 kernels
      */
      public Kernel(float[][]init) {
        kernel = new float[init.length][init[0].length];
        kernel = init;
      }

      /**If part of the kernel is off of the image, return black, Otherwise
      *Calculate the convolution of r/g/b separately, and return that color
       */
      color calcNewColor(PImage img, int x, int y) {
        //Hint: start by always returning black.
        //This will let you test your apply method right away!
        if(x == 0 || y == 0)
        return color(0);
        float red = 0;
        float green = 0;
        float blue = 0;
        for(int r = 0; r<kernel.length; r++){
          for(int c = 0; c<kernel[r].length; c++){
            float z = kernel[r][c];
            color orig = img.get(x+r-1, y+c -1);
            red += red(orig) * z;
            green += green(orig) * z;
            blue += blue(orig) * z;
          }}
          if (red < 0)
          red = 0; 
          else if (red > 255)
          red = 255;
          if (green < 0)
          green = 0; 
          else if(green > 255)
          green = 255;
          if (blue < 0)
          blue = 0; 
          else if(blue > 255)
          blue = 255;
          
          return color((int)red, (int)green, (int)blue);
      }

      /**You must write this method that applies the kernel to the source,
        *and saves the data to the destination.*/
      void apply(PImage source, PImage destination) {
        for(int r = 0; r<source.width; r++){
          for(int c = 0; c<source.height; c++){
            destination.set(r, c, (int)calcNewColor(source, r, c));
          }
        }
      }

    }
