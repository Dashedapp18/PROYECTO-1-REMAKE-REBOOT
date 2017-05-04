import ddf.minim.*;
Minim cadena;
AudioPlayer guardianes, inferno, flashlight, night;
Guardian rocket;
Guardian drax;
Guardian starlord;
Guardian gamora;
Guardian groot;
Guardian j1;
Guardian j2;
int pantalla = 0;
int jugador1;
int jugador2;
PImage inicio, instrucciones, seleccion1, seleccion2,fondo, resultado;
PImage r0, d0, s0, g0, gr0, rp, dp, sp, gp, grp;
PFont titulo;
int turno = 0;
int ganador = 0;
int contador1 = 0;
int contador2 = 0;

void setup(){
size(1200,600);
background(0);
/////imagenes-------------------------------------------------------------------
inicio = loadImage("inicio.jpg");
instrucciones = loadImage("instrucciones.jpg");
seleccion1 = loadImage("seleccion1.jpg");
seleccion2 = loadImage("seleccion2.jpg");
fondo = loadImage("fondo.jpg");
resultado = loadImage("resultado.jpg");
rp = loadImage("rp.png");
dp = loadImage("dp.png");
sp = loadImage("sp.png");
gp = loadImage("gp.png");
grp = loadImage("grp.png");
///---------------------------------------------
s0 = loadImage("s0.png");
s0 = loadImage("s0.png");
r0 = loadImage("r0.png");
d0 = loadImage ("d0.png");
g0 = loadImage("g0.png");
gr0= loadImage("gr0.png");
/////LOS GUARDIANES DE LA GALAXIA PERSONAJES---------------------------------------
rocket = new Guardian("Rocket Racoon",200,7,9,13,0,0);
drax = new Guardian("Drax el destructor",200,8,10,13,1,1);
starlord = new Guardian("Starlord",200,7,9,13,2,2);
gamora = new Guardian("Gamora",200,7,9,13,3,3);
groot = new Guardian("Groot",200,7,9,13,4,4);

//AUDIO---------------------------------------------------------------------------
cadena = new Minim(this);
guardianes=cadena.loadFile("guard1.mp3");
inferno=cadena.loadFile("inferno.mp3");
flashlight=cadena.loadFile("wham bang.mp3");
night=cadena.loadFile("night.mp3");
//TEXTO----------------------------------------------------------------------------
titulo = createFont("Guardians.ttf",200);

}

void draw(){
  
switch(pantalla){
  case 0:
  inicio();
  break;
  
  case 1:
  instrucciones();
  break;
  
  case 2:
  seleccion1();
  break;
  
  case 3:
  seleccion2();
  break;
  
  case 4:
  lucha();
  break;
  
  case 5:

  resultado();
  break;
  }
}

/////CLASES DE GUARDIANES----------------------------------------------------------
class Guardian{
  String nombre;
  int salud;
  int golpe1;
  int golpe2;
  int golpex;
  int mascara;
  int perfil;
  
  Guardian(String nombre_, int salud_, int golpe1_, int golpe2_, int golpex_, int mascara_, int perfil_)
  {
    nombre = nombre_;
    salud = salud_;
    golpe1 = golpe1_;
    golpe2 = golpe2_;
    golpex = golpex_;
    mascara = mascara_;
    perfil = perfil_;
  }
  void Dibujar(){
    switch(mascara){
    case 0:
    image(r0,0,0);
    break;
    case 1:
    image(d0,0,0);
    break;
    case 2:
    image(s0,0,0);
    break;
    case 3:
    image(g0,0,0);
    break;
    case 4:
    image(gr0,0,0);
    break;
    }
  }
  //--------------------------------
    void perfiles(){
    switch(perfil){
    case 0:
    image(rp,0,0);
    break;
    case 1:
    image(dp,0,0);
    break;
    case 2:
    image(sp,0,0);
    break;
    case 3:
    image(gp,0,0);
    break;
    case 4:
    image(grp,0,0);
    break;
    }
  }
  
}
//COMO ACTUA LA PANTALLA INICIAL_________________________________________________
void inicio(){
guardianes.play();
background(inicio);
//image(inicio,0,0);
if(mousePressed){
pantalla=1;
  }
}
///INSTRUCCIONES DEL JUEGO__________________________________________________
void instrucciones(){
background(instrucciones);
if(keyPressed){
    pantalla=2;
  }
}

/////SELECCION PERSONAJE JUGADOR 1---------------------------------------------------
void seleccion1(){
background(seleccion1);
fill(#ff0000);
textFont(titulo);
textSize(30);
text("Selecciona tu personaje",250,70);
textSize(30);
fill(0);
text("Jugador Uno",400,110);
if(keyPressed){
  if(key == '1'){
   j1 = rocket;
  jugador1 = 0;
  pantalla=3;  
  }
  else if(key == '2'){
   j1 = drax;
  jugador1 = 1;
  pantalla=3;  
  }
  else if(key == '3'){
  j1 = starlord;
  jugador1 = 2;
  pantalla=3;  
  }
  else if(key == '4'){
  j1 = gamora; 
  jugador1 = 3;
  pantalla=3;  
  }
  else if(key == '5'){
   j1 = groot;
  jugador1 = 4;
  pantalla=3;  
  }
}
}

////SELECCION PERSONAJE JUGADOR 2----------------------------------------------------
void seleccion2(){
background(seleccion2);
fill(#ff0000);
textFont(titulo);
textSize(25);
text("Selecciona tu personaje",30,60);
textSize(30);
fill(0);
text("Jugador Dos",650,70);
if(keyPressed){
  if(key == '6'){
  j2 = rocket;
  jugador2 = 0;
  pantalla=4;  
  }
  else if(key == '7'){
  j2 = drax;
  jugador2 = 1;
  pantalla=4;  
  }
  else if(key == '8'){
  j2 = starlord;
  jugador2 = 2;
  pantalla=4;  
  }
  else if(key == '9'){
  j2 = gamora;
  jugador2 = 3;
  pantalla=4;  
  }
  else if(key == '0'){
  j2 = groot;
  jugador2 = 4;
  pantalla=4;  
  }
  }
}

////QUE EMPIECE LA BATALLA INTERGALACTICA-------------------------------------------
void lucha(){
  background(fondo);
guardianes.pause();
inferno.play();
 if(jugador1 == 0){
    pushMatrix();
    rocket.Dibujar();
    rocket.perfiles();
    popMatrix();
  }
  else if(jugador1 == 1){
    pushMatrix();
    drax.Dibujar();
    drax.perfiles();
    popMatrix();
  }
  else if(jugador1 == 2){
    pushMatrix();
    starlord.Dibujar();
    starlord.perfiles();
    popMatrix();
  }
  else if(jugador1 == 3){
    pushMatrix();
    gamora.Dibujar();
    gamora.perfiles();
    popMatrix();
  }
    else if(jugador1 == 4){
    pushMatrix();
    groot.Dibujar(); 
    groot.perfiles();
    popMatrix();
  }
  ////////////////////jugador 2------------------------------------------------------
    if(jugador2 == 0){
     pushMatrix();
     translate(380,0);
     rocket.perfiles();
     popMatrix();
     
    pushMatrix();
    translate(700,8);
    rocket.Dibujar();  
    popMatrix();
    }
    else if(jugador2 == 1){
           pushMatrix();
     translate(380,0);
     drax.perfiles();
     popMatrix();
     
    pushMatrix();
    translate(700,8);
    drax.Dibujar();  
    popMatrix();  
  }
    else if(jugador2 == 2){
           pushMatrix();
     translate(380,0);
     starlord.perfiles();
     popMatrix();
     
    pushMatrix();
    translate(700,8);
    starlord.Dibujar();  
    popMatrix();  
  }
    else if(jugador2 == 3){
           pushMatrix();
     translate(380,0);
     gamora.perfiles();
     popMatrix();
     
    pushMatrix();
    translate(700,8);
    gamora.Dibujar();  
    popMatrix();   
  }
    else if(jugador2 == 4){
           pushMatrix();
     translate(380,0);
     groot.perfiles();
     popMatrix();
     
    pushMatrix();
    translate(700,8);
    groot.Dibujar();  
    popMatrix();  
  }
  /////////////TURNOS Y CONTADORES---------------------------------------------------
    if(turno == 0){
    if(keyPressed){
      if(key == 'a'){
      j2.salud = j2.salud - j1.golpe1;
      
      turno = 1;
      contador1++;
      }
      else if(key == 's'){
      j2.salud = j2.salud - j1.golpe2;
      turno = 1;
      contador1++;
      }
      if(j2.salud <= 0){
      pantalla = 5;
      }
    }
  }
  
    if(turno == 1){
    if(keyPressed){
      if(key == 'j'){
      j1.salud = j1.salud - j2.golpe1;
      turno= 0 ;
      contador2++;
      }
      else if(key == 'k'){
      j1.salud = j1.salud - j2.golpe2;
      turno = 0;
      contador2++;
      }
      if(j1.salud <= 0){
      pantalla = 5;
      }
    }
  }
    if(contador1 == 4){
    fill(#ff0000);
    text("ATACA",200,100);
    if(keyPressed){
      if(key == 'd'){
      j2.salud = j2.salud - j1.golpex;
      turno = 1;
      contador1 = 0;
      }
      if(j2.salud <= 0){
      pantalla = 5;
   }
}
}
   if(contador2 == 4){
    fill(#ff0000);
    text("ATACA",1050,100);
    if(keyPressed){
      if(key == 'l'){
      j1.salud = j1.salud - j2.golpex;
      turno = 0;
      contador2 = 0;
      }
      if(j1.salud <= 0){
      pantalla = 5;
   }
}
}
    if(turno == 0){
    fill(255);
    textSize(20);
    text("TU TURNO",10,100);
    }
    else {
    fill(255);
    textSize(20);
    text("TU TURNO",850,100);
    }
   if(turno == 0){
    fill(#4682B4);  
    }
    else{
    fill(#191970);
    }
    quad(0,0,0,70,330,70,350,0);
    
    if(turno == 1){
    fill(#98fb98);
    }
    else{
    fill(#006400);
    }
    quad(1200,0,1200,70,870,70,850,0);
    
    fill(255);
    textSize(20);
    text(j1.nombre,10,30);
    text(j2.nombre,850,30);
    if(j1.salud >= 0 && j1.salud <= 70){
    fill(#ff0000);
    }
    else if(j1.salud > 70 && j1.salud <= 130){
    fill(#ffff00);
    }
    else{
    fill(#00ff00);
    }
    noStroke();
    pushMatrix();
    scale(0.7);
    translate(0,20);
    rect(0,50,j1.salud*2.5,20);
    popMatrix();
    
    if(j2.salud >= 0 && j2.salud <= 70){
    fill(#ff0000);
    }
    else if(j2.salud > 70 && j2.salud <= 130){
    fill(#ffff00);
    }
    else{
    fill(#00ff00);
    }
    noStroke();
        pushMatrix();
    scale(0.7);
    translate(420,20);
    rect(800,50,j2.salud*2.5,20);
    popMatrix();
}
////RESULTADOS DEL COMBATE---------------------------------------------------------
void resultado(){
  inferno.pause();
  background(resultado);
  if(j1.salud > 0){
      flashlight.play();
textSize(30);
fill(0);
text(j1.nombre,150,450);
pushMatrix();
translate(600,-150);
scale(2);
j1.Dibujar();
popMatrix();
}
else {
  night.play();
  textSize(30);
  fill(0);
text(j2.nombre,200,450);
pushMatrix();
translate(600,-150);
scale(2);
j2.Dibujar();
popMatrix();
}
    fill(255);
    textSize(20);
    text("Presione Q para reintentar",200,500);
    if(keyPressed){
      if(key == 'q'){
      pantalla = 0;
      flashlight.pause();
      night.pause();
      j1.salud=200;
      j2.salud=200;
      }
    }

}