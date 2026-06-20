
PImage Imagen;
boolean programaReiniciado = false;

void setup () {
  size (800, 400);
  background (0);
  Imagen = loadImage("imagen_tp3.jpeg"); 
  noStroke (); 
}

 void draw () {
   background (0);
   image(Imagen, 0, 0, 400, 400); 
  
   println (" x: ");
   println (mouseX);
   println (" y: ");
   println (mouseY);
   
  // Ciclos for. Lineas
  for (int i = 45; i < 400; i += 60) {  // Lineas (Y)
   
    for (int j = 400; j < 800; j += 60) {  // Lineas (X)

      float d = dist(mouseX, mouseY, j + 10, i + 10); // Distancia de la figura con al mouse

      float dX = 0; // movimiento horizontal
      float dY = 0; // movimiento vertical
      
      // Parte interactiva
      
      if (d < 130) {
          dX = map(d, 0, 130, 50, 0); 
          dY = map(d, 0, 130, 50, 0); 
      } else {
          dX = 0; // Si está lejos, el empuje vuelve a 0
          dY = 0;
      }
      
      float distanciaAlCentro = dist(j + 10, i + 10, 600, 200); // Distancia al centro de la grilla interactiva
     
      float velocidadMouse = 0.25;  // Manejo de interactividad de la onda
      float distorsionMouse = 1.2; // Manejo de interactividad de la onda
      
      if (!programaReiniciado) {
        velocidadMouse = map(mouseX, 0, width, 0.1, 0.5);
        distorsionMouse = map(mouseY, 0, height, 0.5, 2.0);
      }
      
      
      float factorOnda = obtenerFactorOnda(distanciaAlCentro, velocidadMouse, distorsionMouse); // Factor de la onda
      
      float fuerzaSegunZona = map(distanciaAlCentro, 0, 280, 0.2, 1.0);       // Se intesifica cuando va a los extremos
      float tamañoLoco = 20 + ((factorOnda * 2 - 1) * 15 * fuerzaSegunZona);
      
      // Los diferentes colores de la grilla y los puntitos
      float r = ((millis() / 5 + int(distanciaAlCentro)) % 205) + 50;
      float g = ((millis() / 7 + int(distanciaAlCentro * 1.5)) % 205) + 50;
      float b = ((millis() / 4 + int(distanciaAlCentro * 2.0)) % 105) + 150; 
      
      // Para que vayan cambiando de colores
      float variacionRandom = random(-2, 2);
      tamañoLoco += variacionRandom;
      
      // Mezclamos el color hacia el fondo negro según la onda
      float R_final = lerp(r, r * (1 - factorOnda), fuerzaSegunZona);
      float G_final = lerp(g, g * (1 - factorOnda), fuerzaSegunZona);
      float B_final = lerp(b, b * (1 - factorOnda), fuerzaSegunZona);
      

      colorMode(RGB, 255, 255, 255);

      // Esta funcion es la que dibujo todo el bloque actual
      dibujarEstructura(j, i, dX, dY, R_final, G_final, B_final, tamañoLoco, factorOnda);
    }
  }
}


float obtenerFactorOnda(float distCentro, float velMouse, float distorMouse) {
  float tiempoOnda = (millis() * velMouse - distCentro * distorMouse) % 100;
  if (tiempoOnda < 0) {
    tiempoOnda += 100;
  }
  
  float resultadoFactor = 0;
  if (tiempoOnda < 50) {
    resultadoFactor = map(tiempoOnda, 0, 50, 0, 1);
  } else {
    resultadoFactor = map(tiempoOnda, 50, 100, 1, 0);
  }
  
  return resultadoFactor; // Retorna el número procesado
}

// Dibujo y transformaciones
void dibujarEstructura(float posX, float posY, float desplX, float desplY, float r, float g, float b, float tam, float factor) {
  
  // Líneas horizontales (Opacidad 20)
  fill(r, g, b, 20);
  rect(400, posY + desplY, 400, 20); 
  
  // Líneas verticales (Opacidad 25)
  fill(r, g, b, 25);
  rect(posX + desplX, 0, 20, 400); 
  
  // Translate y rotate
  pushMatrix(); // Guarda el estado actual de la matriz
  
  // Trasladamos el origen del dibujo al centro exacto donde va a ir la elipse
  translate(posX + 10 + desplX, posY + 10 + desplY);
  
  // Rotamos sutilmente en base al factor de la onda
  rotate(factor * TWO_PI * 0.05); 
  
  // Dibujamos la elipse psicodélica en (0,0) porque ya nos movimos con el translate
  fill(r, g, b);
  ellipse(0, 0, tam, tam);
  
  popMatrix(); // Restaura la matriz para la siguiente figura
}

// Se reinicia el programa
void keyPressed() {rv
  // Si se presiona la tecla 'R' o 'r', obligamos a volver a los valores originales
  if (key == 'r' || key == 'R') {
    programaReiniciado = true;
    background(0); // Limpia la pantalla a negro
    println("¡Programa reiniciado a su estado original!");
  }
  
  // Si tocás cualquier otra tecla, el mouse vuelve a tener control de las variables
  if (key == 'c' || key == 'C') {
    programaReiniciado = false;
  }
}
