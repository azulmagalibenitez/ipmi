PImage miImagen; // Imagen del tablero (No sabia como hacerlo yo, por que era en perspectiva)
int pantalla = 1;
int segundos;
PFont fuente; // Times
int texto = 0;
int tiempo = 0; //Para el reincio
PFont Explicación; //Source
float xRectangulo = -450; //Rect 3ra pantalla
float xRect = 614; //Rect 3ra pantalla
float yLienzo = -450; //Rect 4ta pantalla
int textoPrimero = 1;
float opacidad = 255;
int tiempoTexto = 0; 
int tiempoEspera = 4000;
float xrectangulo = -450; //Rect 5ta rectangulo
float xrect = 614; //Rect 5ta rectangulo
float RectxTexo = 614; // Texto abajo
float RectxText = -450; // Texto arriba


void setup () {
  size (640, 480);
  background (237, 202, 155);
  miImagen = loadImage ("tablero.png.png");
  textAlign( CENTER, CENTER );
  textSize( 20 );
  fuente =loadFont( "TimesNewRomanPS-BoldMT-20.vlw"); 
  textFont( fuente );
  Explicación =loadFont( "SourceCodePro-Regular-20.vlw"); 
  textFont( Explicación );
}

void draw () {
  // Ahora calculamos los segundos restando el tiempo que acumulamos al reiniciar
  segundos = (millis() / 1000) - tiempo; 
  
  println(segundos);
  colorMode(RGB, 255, 255, 255);
  background (237, 202, 155);
    
  println (" x: ");
  println (mouseX);
  println (" Y:");
  println (mouseY);
  
  // Tiempo por pantalla
  if (segundos < 10) {
    pantalla = 1; 
  } else if (segundos < 40) {
    pantalla = 2; 
  } else if (segundos < 55) {
    pantalla = 3; 
  } else if (segundos < 70) {
    pantalla = 4; 
  } else if (segundos < 85) {
    pantalla = 5; 
  } else {
    pantalla = 6; 
  }
  
  //Pantallas - Info
  if (pantalla == 1) {
    Pantalla1();
  } else if (pantalla == 2) {
    Pantalla2();
  } else if (pantalla == 3) {
    Pantalla3();
  } else if (pantalla == 4) {
    Pantalla4();
  } else if (pantalla == 5) {
    Pantalla5();
  } else if (pantalla == 6) {
    Pantalla6();
  }
}

// Botón Reinicio

void mousePressed() { 
  
  if (pantalla == 6) { 
    if (mouseX >= 191 && mouseX <= 191 + 250 && mouseY >= 346 && mouseY <= 346 + 60) {
      
      tiempo = millis() / 1000; 
      
      pantalla = 1; //Pantalla de inicio
      
      // Reinciio
      xRectangulo = -450;    
      xRect = 614;
      yLienzo = -450;
      
      xrectangulo = -450;
      xrect = 614;
      RectxText = 614;
      RectxTexo = 614;
      
      opacidad = 255;        
      textoPrimero = 1;      
      tiempoTexto = millis(); 
    }
  }
}
