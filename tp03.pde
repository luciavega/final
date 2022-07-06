    int numeroZurgs = 10;
    int contador = 0;
    PImage inicio, fondo, creditos;
    int tiempo;
    int totaltiempo = 25000;
    boolean iniciar = false;
    float d = 50;
    float x = random(600);
    float y = random(height);
    PImage buzz, zurg;
 
    void setup() {
      size(800,600);
    
      inicio = loadImage("inicio.jpg");
      fondo = loadImage("fondo.jpg");
      creditos = loadImage("creditos.jpg");
      textSize(20);
      tiempo = millis();
     for (int i = 0; i <numeroZurgs; i++) {
      caida(); 
      }
    }
    
    void draw(){
 
          if (key == 'c'|| key == 'C') {
          imageMode(CENTER);
          image(creditos,width/2, height/2);      
        }
        
              
      if (iniciar == false){ 
        imageMode(CENTER);
        image(inicio,width/2, height/2);
          }
                 
        if (key == 'a'|| key == 'A') {
  
       iniciar = true;
       imageMode(CENTER);
       image(fondo,width/2, height/2);
       for (int i = 0; i < numeroZurgs; i++) {
       caida();
       colision();
       puntaje();
       tiempoFuera();
      }
        }
    
    
           
     }
     
     

    
  void caida() {
       buzz = loadImage("buzz.png");
       imageMode(CENTER);
       image(buzz, mouseX, mouseY);
       y = y + 3 ;
       zurg = loadImage("zurg.png");
       image(zurg, x, y,d ,d);
       if(y>height){
      x = random(600);
       y = random(-100);
       }
      }
      
      void colision () {
        float distancia = dist(mouseX , mouseY, x, y);
        if (mousePressed){
        if (distancia < d){
          x = -1000;
          contador++;
          }
         }
        } 
        
      void puntaje () {
        fill(#FFF000);
       text("Enemigos atrapados = " + contador, 400, 20);  
    }
    
    void tiempoFuera(){
         
int passedTime = millis() - tiempo;  
      
      if (passedTime > totaltiempo){
         background(fondo);
  
         if(contador >= 10){
           text("¡lo conseguiste! `\n presiona la 'r' para reiniciar", width/2, height/2, 50);
           if(keyPressed){
            if (key == 'r'|| key == 'R') {
             iniciar = false;
          } 
           
         } else if(contador <= 10){
           text("¡Oh no, perdiste!, `\n presiona la 'r' para reiniciar :(", width/2, height/2, 50);
           if(keyPressed){
            if (key == 'r'|| key == 'R') {
             iniciar = false;
          } 
        }
           
         }
      
      }
        
     }
     
 
    }
    
   
