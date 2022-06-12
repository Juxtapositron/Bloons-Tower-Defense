public class StartMenu{
  boolean started;
  
  public StartMenu(String s){
    
    started = false;
  }
  
  
  public void start(){
     started = true;
  }
 
 public boolean started(){
   return started;
}
public void display(){
  image(thumb,0,0);
  fill(255, 255, 255);
  text("Press s to start!!!", 300, 300);
 }

}
