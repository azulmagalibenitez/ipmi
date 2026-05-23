
void Pantalla1 () {
  miImagen = loadImage ("tablero.png.png");
  image(miImagen, 0, 85, 640, 400);
  
  //Piezas
  Piezas();
  
  //Botón Start 
  fill (139, 69, 19);
  rect (191, 346, 250, 60);
  fill(255); 
  textFont(fuente);
  textAlign(CENTER,CENTER);
  textSize(35);
  text("START", 314, 375);
  
  //Título 
  fill (0);
  textSize(60);
  text("AJEDREZ", 315, 81);
    
  //Subtítulo
  textSize(40);
  textFont (Explicación);
  text ("Trabajo práctico número 2. Comisión 2", 315, 150);
}

void Pantalla2 () {
  miImagen = loadImage ("tablero.png.png");
  image(miImagen, 0, 85, 640, 400);
        
  //Piezas
  Piezas();

  //Reglas del ajedrez, base rectangular
  colorMode(HSB, 360, 100, 100, 60);
  fill(25, 86, 55, 50);
  rect (82, 59, 500, 300);
  colorMode(RGB, 255, 255, 255);
  
  //Reglas, desvanecimiento
  int tiempoPasado = millis() - tiempoTexto;
 
  if (tiempoPasado > tiempoEspera) {
    opacidad -= 5; 
  }

  if (opacidad <= 0) {
    textoPrimero++;
    opacidad = 255; 
    tiempoTexto = millis();
    
    if (textoPrimero > 3) {
      textoPrimero = 1; 
    }
  }

  //Reglas, Palabras
  fill(255, opacidad);
  textFont(fuente);
  textSize(18);
  textAlign(LEFT, TOP);

  if (textoPrimero == 1) {
    text("El ajedrez es un juego de estrategia por \nturnos entre dos ejércitos (blanco y \nnegro), donde las blancas \nsiempre mueven primero.\n\nEl objetivo principal es lograr el Jaque \nMate, que significa acorralar al Rey \nrival hasta dejarlo bajo amenaza directa \ny sin ninguna escapatoria legal para \nganar la partida.", 186, 107);
  } 
  else if (textoPrimero == 2) {
    text("Durante el juego, cada bando realiza un \nmovimiento obligatorio por turno. Si \nuna pieza avanza hacia una \ncasilla ocupada por el oponente, \nla captura y la elimina del \ntablero. \nCuando un Rey es atacado pero \naún puede salvarse, se considera \nJaque, y el jugador está obligado a \ndefenderlo inmediatamente.", 186, 107);
  } 
  else if (textoPrimero == 3) {
    text("La partida también puede terminar en \nempate o Tablas. La situación más \ncomún es el Ahogado, que ocurre cuando a \nun jugador le toca mover y su Rey no \nestá amenazado, pero se encuentra tan \nbloqueado que no puede realizar \nninguna jugada legal con ninguna \nde sus piezas.", 186, 107);
  }
}

void Pantalla3 () {
  miImagen = loadImage ("tablero.png.png");
  image(miImagen, 0, 85, 640, 400);
        
  //Piezas
  Piezas();
  
  //Fichas Rey y Reina - Rectángulos 
  //Izquierda
  if (xRectangulo < 82) {
    xRectangulo = xRectangulo + 20; 
  } else {
    xRectangulo = 82;
  }

  colorMode(HSB, 360, 100, 100, 100);
  fill(25, 86, 55, 50);
  rect(xRectangulo, 59, 450, 150); 
  
  if (xRect > 82) {
    xRect = xRect - 20;
  } else {
    xRect = 82;
  }

  colorMode(HSB, 360, 100, 100, 40); 
  fill(25, 86, 55, 50);
  rect(xRect, 270, 450, 150);
  
  //Piezas, Rey y Reina - Palabras
  fill(255);
  textFont(fuente);
  textSize(18);
  textAlign(LEFT, TOP);
  
  if (xRectangulo < 82) {
    opacidad = 0; 
  } 
  else {
    if (opacidad < 255) {
      opacidad += 10;
    }
  }
  // Texto
  fill(0, opacidad); 
  textFont(fuente);
  textSize(16);
  textAlign(LEFT, TOP);

  text("La reina. Podríamos decir que es la pieza más fuerte. Puede \nmoverse en diagonal, recto y horizontalmente. Tanto \npara atrás como para adelante. \nPuede avanzar las casillas que se requiera\nSiempre se la representa con una corona", 92, 79);

  if (xRect < 82) {
    opacidad = 0; 
  } 
  else {
    if (opacidad < 255) {
      opacidad += 10;
    }
  }
  fill(255, opacidad); 
  text("El rey, es la pieza más importante. Si muere, pierden la partida.\nSolo puede moverse de un casillero, aunque puede \nhacerlo en todas las direcciones que quiera.\nUualmente, se lo representa o con una cruz, o con una\ncorona redonda, para distinguirlo\nde la reina", 92, 280);
}

void Pantalla4 () {
  miImagen = loadImage ("tablero.png.png");
  image(miImagen, 0, 85, 640, 400);
        
  //Piezas
  Piezas();
  
  //Fichas: Alfil y Caballo - Rectángulos 
   //Rect 1
  if (yLienzo < 81) {
    yLienzo = yLienzo + 20; 
  } else {
    yLienzo = 81;
  }

  colorMode(HSB, 360, 100, 100, 100);
  fill(25, 86, 55, 50);
  rect(30, yLienzo, 250, 300); 
  
  colorMode(RGB, 255, 255, 255);
  
  //Rect 2
  
  if (yLienzo < 81) {
    yLienzo = yLienzo + 20; 
  } else {
    yLienzo = 81;
  }
  
  colorMode(HSB, 360, 100, 100, 100);
  fill(25, 86, 55, 50);  
  rect(300, yLienzo, 250, 300); 
  colorMode(RGB, 255, 255, 255);
  
  // Texto
  fill(255); 
  textFont(fuente);
  textSize(16);
  textAlign(LEFT, TOP);
  text ("                      \nEl alfil se pone al lado de los reyes. \nCada jugador, tiene dos.\nPuede moverse tanto para \nadelante como para atrás, \npero solo diagonalmente.\nUSelo representa con una capeza \nlarga y cuerpo fino.\nMuchos suelen darle \nimportancia al alfil, \npor que suele ser una pieza \nque se infliltra fácil", 36, yLienzo);
  text ("                      \nEl caballo, se pone al \nlado de los alfiles, dos por\njugador, Es una pieza \nespecial, debido a su forma\nde moverse en el tablero.\nSu movement, es una L en\nen todos sus perfiles.\nY, como la palabra lo\nindica, su figura es\nun caballo. \nLa única figura animal del\nAjedrez", 310, yLienzo);
}

void Pantalla5 () {
  miImagen = loadImage ("tablero.png.png");
  image(miImagen, 0, 85, 640, 400);
        
  //Piezas
Piezas();
  
  // Rect 1
  if (xrectangulo < 82) {
    xrectangulo = xrectangulo + 20; 
  } else {
    xrectangulo = 82;
  }

  colorMode(HSB, 360, 100, 100, 100);
  fill(25, 86, 55, 50);
  rect(xrectangulo, 59, 450, 150); 
  
  // Rect 2
  if (xrect > 82) {
    xrect = xrect - 20;
  } else {
    xrect = 82;
  }

  colorMode(HSB, 360, 100, 100, 40); 
  fill(25, 86, 55, 50);
  rect(xrect, 270, 450, 200);
  
  // Texto
  textFont(fuente);
  textSize(16);
  textAlign(LEFT, TOP);
  fill(255); 

  text("La torre, es la última pieza de la primer fila del\n tablero.Es literalmente una torre, similar a \nla de os castillos y su movimiento es \nunicamente en formato vertical u horizontal. \nSiempre recto. Puede ir para atrás y para \nadelante. Mata, al igal que el resto \nde piezas, en el lugar donde cae. ", xrectangulo + 15, 69);

  text("El peón. El peón quizá es la pieza menos útil del tablero, \naunque yo difiero. Hay ocho peones en total, a \ndiferencia de las otras piezas que solo hay dos o \nuna. Se mueve una casilla a la vez y unicamente \nde manera vertical, sin poder ir para atras. Mata, sin \nemabargo, en diagonal. Su particularidad es que, si el \npeón llega al otro extremo del tablero, s decir al extremo \nde su oponente El peón se transforma en cualquier ficha que \nel participante elija, pudiendo recuperar fichas matadas. ", xrect + 15, 280);
}

void Pantalla6 () {
  miImagen = loadImage ("tablero.png.png");
  image(miImagen, 0, 85, 640, 400);
        
  //Piezas
  Piezas();
 
  //Botón Reiniciar
  fill (139, 69, 19);
  rect (191, 346, 250, 60);
  fill(255); 
  textFont(fuente);
  textAlign(CENTER,CENTER);
  textSize(35);
  text("REINICIAR", 314, 375);
  
  //Título 
  fill (0);
  textSize(60);
  text("AJEDREZ", 315, 81);
    
  //Subtítulo
  textSize(40);
  textFont (Explicación);
  text ("Gracias por haber leido. Si te perdiste de algo \no solo queres refrescar, dale \na reinciar", 315, 150);
}


void Piezas() {
  // Color de las piezas
  fill(50);
  
  // Reina 
  ellipse(290, 369, 40, 5); // Base 1
  rect(274, 357, 30, 10); // Base 2
  rect(275, 320, 28, 40); // Cuerpo de abajo
  rect(282, 296, 15, 20); // Cuerpo de arriba
  ellipse(290, 319, 35, 7); // Base para cuerpo de arriba
  ellipse(290, 316, 27, 7); // Base para cuerpo de arriba
  ellipse(289, 289, 30, 20); // Cabeza
  triangle(274, 284, 279, 269, 284, 284); // Pico izquierdo de la corona
  triangle(284, 284, 289, 264, 294, 284); // Pico central (el más alto)
  triangle(294, 284, 299, 269, 304, 284); // Pico derecho de la corona
  ellipse(289, 261, 7, 7); //Esfera en la punta de la corona
  
  // Rey
  ellipse(361, 371, 40, 5); // Base 1
  rect(345, 359, 30, 10); // Base 2
  rect(346, 320, 28, 40); // Cuerpo de abajo
  rect(353, 296, 15, 20); // Cuerpo de arriba
  ellipse(361, 319, 35, 7); // Base para cuerpo de arriba
  ellipse(361, 316, 27, 7); // Base para cuerpo de arriba
  rect(357, 256, 4, 20); //Cruz vertical
  rect(349, 262, 20, 4); //Cruz Horizontal
  ellipse(360, 289, 30, 20); // Cabeza
  triangle(345, 284, 350, 269, 355, 284); // Pico izquierdo de la corona
  triangle(355, 284, 360, 264, 365, 284); // Pico central (el más alto)
  triangle(365, 284, 370, 269, 375, 284); // Pico derecho de la corona
 
  // Alfil izquierdo (Del lado de la reina)
  ellipse(219, 371, 48, 6);        // Base
  rect(214, 338, 11, 34);    // Cuerpo
  ellipse(219, 335, 28, 5);  // Base abajo de la cabeza
  ellipse(219, 314, 18, 46);     // Cabeza
  ellipse(219, 289, 7, 5);     // Punta

  // Alfil derecho (Del lado del rey)
  ellipse(430, 371, 48, 6);        // Base
  rect(423, 338, 11, 34);    // Cuerpo
  ellipse(428, 335, 28, 5);  // Base abajo de la cabeza
  ellipse(428, 314, 18, 46);     // Cabeza
  ellipse(428, 289, 7, 5);     // Punta
  
  // Caballo del lado derecho (Lado del Rey)
  ellipse(501, 371, 48, 6); // Base
  rect(487, 343, 28, 28); // Parte del cuerpo
  triangle(487, 343, 515, 343, 501, 308); // Cuello
  rect(489, 301, 29, 21); // Cabeza
  triangle(490, 301, 490, 322, 473, 322); // Hocico
  triangle(501, 301, 508, 301, 504, 290); // Oreja
  
  // Caballo lado izquierdo (Lado de la reina)
  ellipse(149, 371, 48, 6);// Base
  rect(135, 343, 28, 28); // Parte del cuerpo
  triangle(135, 343, 163, 343, 149, 308); // Cuello
  rect(137, 301, 29, 21); // Cabeza
  triangle(166, 301, 166, 322, 183, 322); // Hocico
  triangle(149, 301, 156, 301, 152.5, 290); // Oreja
  
  // Torre del lado izquierdo
  ellipse(79, 371, 48, 6); // Base 1
  rect(62, 360, 34, 10); // Base 2
  rect(66, 312, 26, 48); // Cuerpo de la torre
  rect(62, 302, 34, 10); // Corona superior
  rect(63, 294, 6, 8); // Diente izquierdo
  rect(76, 294, 6, 8); // Diente central
  rect(89, 294, 6, 8); // Diente derecho
 
  // Torre del lado derecho
  ellipse(571, 371, 48, 6); // Base 1
  rect(554, 360, 34, 10); // Base 2
  rect(558, 312, 26, 48); // Cuerpo 
  rect(554, 302, 34, 10); // Corona superior
  rect(555, 294, 6, 8); // Diente izquierdo
  rect(568, 294, 6, 8); // Diente central
  rect(581, 294, 6, 8);  // Diente derecho
    
  // Peón 1 (Frente a la Torre Izquierda)
  ellipse(52, 378, 35, 5); // Base 1
  rect(42, 370, 20, 5);  // Base 2
  rect(48, 345, 8, 25); // Cuerpo largo
  ellipse(52, 342, 15, 5); // Anillo abajo de la cabeza
  ellipse(52, 330, 18, 18); // Cabeza redonda

  // Peón 2 (Frente al Caballo Izquierdo)
  ellipse(135, 378, 35, 5); // Base 1
  rect(125, 370, 20, 5); // Base 2
  rect(131, 345, 8, 25); // Cuerpo largo
  ellipse(135, 342, 15, 5); // Anillo abajo de la cabeza
  ellipse(135, 330, 18, 18); // Cabeza redonda
  
  // Peón 3 (Frente al Alfil Izquierdo)
  ellipse(210, 378, 35, 5); // Base 1
  rect(200, 370, 20, 5); // Base 2
  rect(206, 345, 8, 25); // Cuerpo largo
  ellipse(210, 342, 15, 5); // Anillo abajo de la cabeza
  ellipse(210, 330, 18, 18); // Cabeza redonda

  // Peón 4 (Frente a la Reina)
  ellipse(290, 378, 35, 5); // Base 1
  rect(280, 370, 20, 5); // Base 2
  rect(286, 345, 8, 25); // Cuerpo largo
  ellipse(290, 342, 15, 5); // Anillo abajo de la cabeza
  ellipse(290, 330, 18, 18); // Cabeza redonda

  // Peón 5 (Frente al Rey)
  ellipse(370, 378, 35, 5); // Base 1
  rect(360, 370, 20, 5); // Base 2
  rect(366, 345, 8, 25); // Cuerpo largo
  ellipse(370, 342, 15, 5); // Anillo abajo de la cabeza
  ellipse(370, 330, 18, 18); // Cabeza redonda

  // Peón 6 (Frente al Alfil Derecho)
  ellipse(450, 378, 35, 5); // Base 1
  rect(440, 370, 20, 5); // Base 2
  rect(446, 345, 8, 25); // Cuerpo largo
  ellipse(450, 342, 15, 5); // Anillo abajo de la cabeza
  ellipse(450, 330, 18, 18); // Cabeza redonda

  // Peón 7 (Frente al Caballo Derecho)
  ellipse(523, 380, 35, 5);  // Base 1
  rect(513, 372, 20, 5); // Base 2 
  rect(519, 347, 8, 25); // Cuerpo largo
  ellipse(523, 344, 15, 5); // Anillo abajo de la cabeza
  ellipse(523, 332, 18, 18); // Cabeza redonda
  
  // Peón 8 (Frente a la Torre Derecha)
  ellipse(600, 380, 35, 5); // Base 1
  rect(590, 372, 20, 5); // Base 2 
  rect(596, 347, 8, 25); // Cuerpo largo 
  ellipse(600, 344, 15, 5); // Anillo abajo de la cabeza
  ellipse(600, 332, 18, 18); // Cabeza redonda
}
