class Blob {
   PVector pos;
   float r; 
   PImage cir;
  
  Blob () {
    
  }
  
  
  
  void show(float x, float y) {
    pos = new PVector(x,y);
    //r = 80;
     //PGraphics pg = createGraphics(300,300);
     // pg.beginDraw();
     // pg.background(255,180,255,0);
     // pg.fill(255,180,255);
     // pg.noStroke();
     // pg.ellipse(150,150,200,200);
     // pg.filter(BLUR,10);
     // pg.endDraw();
     // cir = pg.get();
     // imageMode(CENTER);
   
  }
  
  void display(){
    
     noFill();
    noStroke();
    
    ellipse(pos.x, pos.y, r*2, r*2);
    //image( cir, pos.x, pos.y);
  }
  
  
}
