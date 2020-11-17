import ddf.minim.*;
import grafica.*;
PImage img, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16, img17, img18, img19, img20, img21, img22, img23, img24, img25, img26, img27, img28, img29, img30, img31, img32, img33, img34, img35, img36, img37;
int t1, valor=1, etapa=0, una_sola_vez=0, cont, co=0, presionx=0, presionxd=0, contador=0, conteo=0, condicion=3, instrucciones_una_vez=0, grafica=0;
String caso="sistema no amortiguado", t="", amplitud="", frecuencia="", fase_inicial="", pfinal="", vfinal="", tfinal="", masa="", elasticidad="", amortiguamiento="", caso_amortiguado="", angulo_de_fase="";
boolean  continuar=false, kol=true, mm=true, aux=true, aux2=true, aux3=true, aux4=true, aux5=true, aux6=true, aux7=false, musica=false, presionar, aux_etapa31=true, aux_etapa32=true, aux_etapa33=true, posicion=false, velocidad=false, aceleracion=false, aux_posicion=true, parar=false, gra=false, gra2=false, gra3=false, screenshot=false;

float bbb, bb, f_inicial, o, f, a, n2=1, presion_final, volumen_final, temperatura_final, x1, v, a1, t2, x2, x3, m, b1, k, resultado, resultado2, o1, max=450, min=100, f_angular, c1, d1, e1, f1;
float posicionx, posiciony;
float y=300, vel=3, cambio=vel, exponente, base, y1=0;

float pos1[]=new float[1000];
float vel1[]=new float[1000];
float ace1[]=new float[1000];
float amplitud1[]=new float[1000];
GPlot plot, plot2, plot3;

GPointsArray myArray = new GPointsArray(0);
GPointsArray myArray2 = new GPointsArray(0);
GPointsArray myArray3 = new GPointsArray(0);

Table table, table2, table3;

Minim audio;
AudioPlayer reproducir;
AudioPlayer boton;  

PFont font;

int n, menos, funcion;
double x, abajo, c, b, arriba, seno, cos;

float[] panelDim = new float[] {800, 500};

PrintWriter out1, out2, out3;

void setup() {
  //cargar todas las imagenes
  size(1200, 750);
  img=loadImage("imagenes/fondo2.png");
  img2=loadImage("imagenes/fondo1.png");
  img3=loadImage("imagenes/flecha.png");
  img4=loadImage("imagenes/flecha2.png");
  img5=loadImage("imagenes/start.png");
  img6=loadImage("imagenes/resorte.png");  
  img7=loadImage("imagenes/clear.png");  
  img8=loadImage("imagenes/chulo.png");  
  img9=loadImage("imagenes/fondo3.png"); 
  img10=loadImage("imagenes/audioon.png"); 
  img11=loadImage("imagenes/audiooff.png"); 
  img12=loadImage("imagenes/aceptar.png"); 
  img13=loadImage("imagenes/cancelar.png");
  img14=loadImage("imagenes/lab.png");
  img15=loadImage("imagenes/cuadrado.png");
  img16=loadImage("imagenes/resorte.png");
  img17=loadImage("imagenes/agua.png");
  img18=loadImage("imagenes/menu.png");
  img19=loadImage("imagenes/cientifico.png");
  img20=loadImage("imagenes/atras.png");
  img21=loadImage("imagenes/adelante.png");
  img22=loadImage("imagenes/instruccion1.png");
  img23=loadImage("imagenes/instruccion2.png");
  img24=loadImage("imagenes/instruccion3.png");
  img25=loadImage("imagenes/instruccion4.png");
  img26=loadImage("imagenes/derecha.png");
  img27=loadImage("imagenes/izquierda.png");
  img28=loadImage("imagenes/descargar.png");
  img29=loadImage("imagenes/fondo_amortiguado.png");
  img30=loadImage("imagenes/exel.png");
  img31=loadImage("imagenes/amortiguador.png");
  img32=loadImage("imagenes/instruccion5.png");
  img33=loadImage("imagenes/fondo10.png");
  img34=loadImage("imagenes/fondo11.png");
  img35=loadImage("imagenes/fondo20.png");
  img36=loadImage("imagenes/pausa.png");
  img37=loadImage("imagenes/continuar.png");
  audio=new Minim(this);
  reproducir=audio.loadFile("audio/audio1.mp3");
  boton=audio.loadFile("audio/audio2.mp3");


  plot = new GPlot(this, 600, 30, 580, 200);
  plot2 = new GPlot(this, 600, 280, 580, 200);
  plot3 = new GPlot(this, 600, 530, 580, 200);

  table = new Table();
  table.addColumn("posicion");
  table.addColumn("tiempo");

  table2 = new Table();
  table2.addColumn("Velocidad");
  table2.addColumn("tiempo");

  table3 = new Table();
  table3.addColumn("Aceleracion");
  table3.addColumn("tiempo");


  for (int i=1; i<1000; i++) {
    pos1[i]=10;
    vel1[i]=10;
    ace1[i]=10;
  }

  font=loadFont("BookmanOldStyle-Italic-40.vlw");
  textFont(font);

  //Creo los archivos de cada caso
  //create("sistema no amortiguado", out1);
  //create("sistema amortiguado", out2);
  //create("oscilaciones forzadas", out3);

  out1 = createWriter("sistema no amortiguado/sistema no amortiguado.txt");
  out1.println("sistema no amortiguado");
  out1.println("");

  out2 = createWriter("sistema amortiguado/sistema amortiguado.txt");
  out2.println("sistema amortiguado");
  out2.println("");

  out3 = createWriter("oscilaciones forzadas/oscilaciones forzadas.txt");
  out3.println("oscilaciones forzadas");
  out3.println("");
}


void draw() {

  if (valor==1) {
    caso="sistema no amortiguado";
  } else if (valor==2) {
    caso="sistema amortiguado";
  } else if (valor==3) {
    caso="oscilaciones forzadas";
  }

  //-----------------------esta simplemente es la pantalla de carga--------------------------------
  if (etapa==0) {
    image(img2, 0, 0);

    if (musica==true) {
      image(img10, 50, 30, 70, 70);
      reproducir.play();
    } else if (musica==false) {
      reproducir.pause();
      image(img11, 50, 30, 70, 70);
    }
    textSize(50);
    image(img5, 250, 450, 700, 70);
    text("Continuar", 480, 500);
    image(img5, 250, 540, 700, 70);
    text("Instrucciones", 450, 590);
    image(img5, 250, 630, 700, 70);
    text("Salir", 550, 680);
    image(img18, 150, 50, 900, 300);
    text("OSCILAB", 470, 220);
  }

  //-------------------------------segunda etapa donde se pide el caso que se va a trabajr-------------------------
  else if (etapa==1) {
    etapa=1;
    image(img2, 0, 0);
    noFill();
    noStroke();
    fill(27, 38, 49);
    rect(100, 100, 1000, 600);
    noFill();
    textSize(40);
    fill(255, 255, 255);
    text("Seleccione el caso a trabajar", 330, 200);
    image(img3, 900, 300, 100, 100);
    image(img4, 220, 300, 100, 100);
    text(caso, 380, 360);
    image(img5, 350, 500, 500, 100);
    text("Aceptar", 520, 560);
  }

  //------------Primera etapa donde se piden todos los valores iniciales--------------------------
  else if (etapa==2) {
    cont=1;
    etapa=2;
    if (caso=="sistema no amortiguado") {
      background(25, 25, 25);
      image(img, 0, 0);

      //------------creacion del menu de tiempo------------------      
      menus(600, 18, "Tiempo", 830, 40, 1080, 80, 650, 80, 715, 80, 750, 110, t, 170);

      //-----------------creacion del menu de la amplitud--------------------      
      menus(600, 208, "Amplitud", 830, 230, 1080, 270, 650, 270, 715, 270, 750, 300, amplitud, 170);

      //-------------------creacion del menu de la frecuencia--------------------
      menus(600, 398, "Frecuencia", 830, 420, 1080, 460, 650, 460, 715, 460, 750, 490, frecuencia, 170);

      //------------------------------creacion del menu de la fase inicial --------------------------------
      menus(600, 588, "Fase inicial", 830, 610, 1080, 650, 650, 650, 715, 650, 750, 680, fase_inicial, 150);
    } else if (caso=="sistema amortiguado") {
      background(25, 25, 25);
      image(img33, 0, 0);

      //--------------------menu del timepo en sistema amortiguado-----------------------------        
      menus(600, 18, "Tiempo", 830, 50, 1080, 80, 650, 80, 715, 80, 750, 110, t, 170);

      //---------------------------menu de la masa -----------------------------------------------       
      menus(600, 208, "Masa", 830, 250, 1080, 270, 650, 270, 715, 270, 750, 300, masa, 170);

      //---------------------------------menu de la constante de elasticidada-------------------------      
      menus(600, 398, "Constante de elasticidad", 770, 435, 1080, 460, 650, 460, 715, 460, 750, 490, elasticidad, 170);

      //-----------------------------menu de la constante de amortiguamiento--------------------------------------------      
      menus(600, 588, "Constante de amortiguamiento", 750, 630, 1080, 650, 650, 650, 715, 650, 750, 680, amortiguamiento, 150);

      //-----------------------------menu del angulo de fase--------------------------------------------      
      menus(10, 588, "Angulo de fase", 200, 630, 480, 650, 50, 650, 120, 650, 135, 680, angulo_de_fase, 150);

      //---------------------------------menu de la amplitud-------------------------      
      menus(10, 398, "Amplitud inicial", 200, 435, 480, 460, 50, 460, 120, 460, 135, 490, amplitud, 170);
    }
    //---------------- menu de oscilaciones forzadas--------------------------- 
    else if (caso=="oscilaciones forzadas") {
      image(img34, 0, 0);

      //--------------------menu del timepo en sistema amortiguado-----------------------------        
      menus(600, 18, "Tiempo", 830, 50, 1080, 80, 650, 80, 715, 80, 750, 110, t, 170);

      //---------------------------menu de la masa -----------------------------------------------        
      menus(600, 208, "Masa", 830, 250, 1080, 270, 650, 270, 715, 270, 750, 300, masa, 170);

      //---------------------------------menu de la constante de elasticidada-------------------------      
      menus(600, 398, "Constante de elasticidad", 770, 435, 1080, 460, 650, 460, 715, 460, 750, 490, elasticidad, 170);

      //-----------------------------menu de la constante de amortiguamiento--------------------------------------------      
      menus(600, 588, "Constante de amortiguamiento", 750, 630, 1080, 650, 650, 650, 715, 650, 750, 680, amortiguamiento, 150);


      //-----------------------------menu del angulo de fuerza impulsora--------------------------------------------      
      menus(10, 588, "Fuerza impulsora", 200, 630, 480, 650, 50, 650, 120, 650, 135, 680, frecuencia, 150);
    }
  }

  //----------------------etapa 3 de este programa-----------------------
  else if (etapa==3) {

    if (caso=="sistema no amortiguado") {
      etapa=4;
    } else if (caso=="sistema amortiguado") {
      background(0, 0, 0);
      resultado=(k/m)-((b1*b1)/4*m*m);
      resultado2=2*sqrt(k*m);

      if (resultado==0 || resultado2==b1) {
        caso_amortiguado="amortiguamiento critico";
        condicion=1;
      } else if (b1>resultado2) {
        caso_amortiguado="sobreamortiguamiento";
        condicion=2;
      } else if (b1<resultado2) {
        caso_amortiguado="subamortiguamiento";
        condicion=3;
      }

      image(img, 0, 0);
      fill(27, 38, 49);
      noStroke();
      rect(80, 30, 1050, 700, 25);

      textSize(50);
      fill(255, 255, 255);
      text("La condicion de su oscilador es de:", 180, 150);
      fill(215, 219, 221);
      rect(250, 180, 700, 300, 25);   
      fill(255, 255, 255);
      textSize(40);
      text(caso_amortiguado, 370, 310);

      image(img5, 250, 500, 700, 100);
      text("Continuar", 500, 560);
    } else if (caso=="oscilaciones forzadas") {
      etapa=4;
    }
  }


  //--------------etapa 4 de la simulacion------------------
  else if (etapa==4) {
    background(133, 193, 233);
    plot.setTitleText("P vs T");
    plot2.setTitleText("V vs T");
    plot3.setTitleText("A vs T");

    if (caso=="sistema no amortiguado") {
      image(img14, 0, 0);
      image(img15, 100, 30, 150, 50);
      image(img16, 75, 80, 200, 600-y);
      image(img15, 90, 680-y, 180, 120);

      if (continuar==false) {
        image(img36, 260, 30, 50, 50);
        contador=contador+1;
      } else {
        image(img37, 260, 30, 50, 50);
      }

      if (t1==0) {
        parar=true;
      }

      //--------------hago el contador de cuanto se demora la animacion----------------------------
      if (cont==t1) {
        parar=true;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+t1, 120, 60);
        etapa=5;
      } else if (cont!=t1 && parar==false && continuar==false) {
        y=y-cambio;
        textSize(20);
        fill(255, 255, 255);
      }
      fill(255, 255, 255);
      text("tiempo: "+cont, 120, 60);

      //--------------cambios de velocidad--------------------------
      if (y>500) {
        cambio=vel;
      }
      if (y<280) {
        cambio=-vel;
      }

      //calculo el tiempo por cada draw   
      if (contador==60 && continuar==false) {
        graficas();
        cont=cont+1;
        if (cont!=t1) {
          contador=0;
        }

        t2=cont/10;

        pos1[cont]=sin(f*cont+o);
        pos1[cont]=pos1[cont]*a;

        vel1[cont]=cos(f*cont+o);
        vel1[cont]=vel1[cont]*a*f;

        ace1[cont]=sin(f*cont+o);
        ace1[cont]=ace1[cont]*f*f*-a;

        if (round(vel1[cont])==0 &&  round(vel1[cont-1])==0  &&  round(vel1[cont-2])==0 &&  round(vel1[cont-3])==0 && cont>3) {
          parar=true;
        }
      }
      textSize(20);
      fill(255, 255, 255);
      out1.println("Tiempo: "+cont);
      out1.println("Pos: " + pos1[cont]+" m");
      out1.println("Vel: " + vel1[cont]+" m/s");        
      out1.println("Ace: " + ace1[cont]+" m/s^2");
      out1.println("");        
      out2.close();
      out3.close();
      //----------------grafica de posicion vs tiempo-----------------------------------      

      fill(255, 255, 255);
      plot.setTitleText("P vs T");
      fill(215, 219, 221);
      rect(600, 30, 580, 200, 25);
      noStroke();
      fill(215, 219, 221);
      rect(30, 560, 500, 50, 25);
      textSize(20);
      fill(0, 0, 0);

      text("posicion: "+pos1[cont]+" m", 50, 590);    
      plot.setPoints(myArray);
      plot.defaultDraw();

      //----------------grafica de velocidad vs tiempo-----------------------------------
      noStroke();
      fill(255, 255, 255);
      plot2.setTitleText("V vs T");
      fill(215, 219, 221);
      rect(600, 280, 580, 200, 25);
      fill(215, 219, 221);
      rect(30, 620, 500, 50, 25);
      fill(0, 0, 0);
      textSize(20);
      text("Velocidad: "+vel1[cont]+" m/s", 50, 650);
      plot2.setPoints(myArray2);
      plot2.defaultDraw();

      //----------------grafica de aceleracion vs tiempo-----------------------------------
      noStroke();
      fill(255, 255, 255);
      plot3.setTitleText("A vs T");
      fill(215, 219, 221);
      rect(600, 530, 580, 200, 25);
      fill(215, 219, 221);
      rect(30, 680, 500, 50, 25);
      fill(0, 0, 0);
      textSize(20);
      text("Aceleracion: "+ace1[cont]+" m/s^2", 50, 710);
      plot3.setPoints(myArray3);
      plot3.defaultDraw();
    } else if (caso=="sistema amortiguado") {

      plot.setTitleText("P vs T");
      plot2.setTitleText("V vs T");
      plot3.setTitleText("A vs T");
      image(img14, 0, 0);
      image(img15, 15, 30, 250, 50);
      image(img31, 150, 80, 120, y); 
      image(img16, -15, 80, 200, y); 
      image(img15, 15, y+80, 250, 120);

      if (continuar==false) {
        image(img36, 260, 30, 50, 50);
        contador=contador+1;
      } else {
        image(img37, 260, 30, 50, 50);
      }

      if (t1==0) {
        parar=true;
      }

      //--------------hago el contador de cuanto se demora la animacion----------------------------
      if (cont==t1) {
        parar=true;
        textSize(20);
        fill(255, 255, 255);
        text("tiempo: "+t1, 90, 60);
        etapa=5;
      } else if (cont!=t1 && parar==false && continuar==false) {
        y=y-cambio;
        textSize(20);
      }
      fill(255, 255, 255);
      text("tiempo: "+cont, 90, 60);
      //calculo el tiempo por cada draw   
      if (contador==60 && continuar==false) {
        graficas();
        cont=cont+1;
        if (cont!=t1) {
          contador=0;
        }
        amplitud1[0]=a;
        f_inicial=sqrt(k/m);
        pos1[0]=amplitud1[0]*sin(o1);
        vel1[0]=amplitud1[0]*y1*sin(o1)+amplitud1[cont-1]*f*cos(o1);
        amplitud1[cont]=sqrt((pos1[0]*pos1[0])+pow((vel1[0]+y1*pos1[0])/o1, 2));
        y1=b1/(2*m);

        if (condicion==3) {
          pos1[cont]=amplitud1[cont]*exp(-y1*cont)*sin(f*cont+o1);
          vel1[cont]=-y1*exp(-y1*cont)*sin(f*cont+o1)+amplitud1[cont]*exp(-y1*cont)*f*cos(f*cont+o1);
          ace1[cont]=-amplitud1[cont]*pow(y1, 2)*exp(-cont*y1)*sin(f*cont+o1)+amplitud1[cont]*f*y1*exp(-cont*y1)*cos(f*cont+o1)-amplitud1[cont]*pow(f, 2)*exp(-cont*y1)*sin(f*cont+o1);
          f=sqrt(pow(f_inicial, 2)-pow(y1, 2));
        } else if (condicion==2) {
          bb=pow(y1, 2)-pow(f, 2);
          pos1[cont]=(vel1[0]/bb)*exp(-y1*cont)*sin(bb*cont);
          vel1[cont]=-y1*exp(-y1*cont)*sin(f*cont+o1)+amplitud1[cont]*exp(-y1*cont)*f*cos(f*cont+o1);
          ace1[cont]=-amplitud1[cont]*pow(y1, 2)*exp(-cont*y1)*sin(f*cont+o1)+amplitud1[cont]*f*y1*exp(-cont*y1)*cos(f*cont+o1)-amplitud1[cont]*pow(f, 2)*exp(-cont*y1)*sin(f*cont+o1);
        } else if (condicion==1) {
          pos1[cont]=(amplitud1[cont]*cont+b1)*exp(-y1*cont);
          vel1[cont]=-y1*exp(-y1*cont)*sin(f*cont+o1)+amplitud1[cont]*exp(-y1*cont)*f*cos(f*cont+o1);
          ace1[cont]=-amplitud1[cont]*pow(y1, 2)*exp(-cont*y1)*sin(f*cont+o1)+amplitud1[cont]*f*y1*exp(-cont*y1)*cos(f*cont+o1)-amplitud1[cont]*pow(f, 2)*exp(-cont*y1)*sin(f*cont+o1);
        }

        if (round(vel1[cont])==0 &&  round(vel1[cont-1])==0  &&  round(vel1[cont-2])==0 &&  round(vel1[cont-3])==0&& cont>3) {
          parar=true;
        }
      }

      //graficas si son subamortiguado
      if (condicion==3) {
        //--------------cambios de velocidad--------------------------
        if (y>max) {
          cambio=vel;

          if (vel>-1) {
            vel=vel-0.025;
          }

          if (max!=300) {
            max=max-5;
          }
        }
        if (y<min) {
          cambio=-vel;
        }
        //grafica de posicion
        graf("Pos: ", " m", pos1[cont], 80, 110, plot, myArray);
        //writer("Pos: ", " m", pos1[cont], out2);

        //grafica de velocidad vs tiempo
        graf("Vel: ", " m/s", vel1[cont], 150, 180, plot2, myArray2);
        //writer("Vel: ", " m/s", vel1[cont], out2);


        //grafica de aceleracion
        graf("Ace: ", " m/s^2", ace1[cont], 220, 250, plot3, myArray3);
        //writer("Ace: ", " m/s^2", ace1[cont], out2);

        out2.println("Tiempo: "+cont);
        out2.println("Pos: " + pos1[cont]+" m");
        out2.println("Vel: " + vel1[cont]+" m/s");
        out2.println("Ace: " + ace1[cont]+" m/s^2");
        out2.println("");
        out1.close();
        out3.close();
      } else if (condicion==2) {
        //--------------cambios de velocidad--------------------------
        if (y>max) {
          cambio=vel;

          if (vel>0) {
            vel=vel-0.075;
          }

          if (max!=300) {
            max=max-5;
          }
        }
        if (y<min) {
          cambio=-vel;
        }
        //grafica de posicion
        graf("Pos: ", " m", pos1[cont], 80, 110, plot, myArray);
        //writer("Pos: ", " m", pos1[cont], out2);

        //grafica de velocidad
        graf("Vel: ", " m/s", vel1[cont], 150, 180, plot2, myArray2);
        //writer("Vel: ", " m/s", vel1[cont], out2);

        //grafica de aceleracion
        graf("Ace: ", " m/s^2", ace1[cont], 220, 250, plot3, myArray3);
        //writer("Ace: ", " m/s^2", ace1[cont], out2);

        out2.println("Tiempo: "+cont);
        out2.println("Pos: " + pos1[cont]+" m");
        out2.println("Vel: " + vel1[cont]+" m/s");        
        out2.println("Ace: " + ace1[cont]+" m/s^2");
        out2.println("");
        out1.close();
        out3.close();
      } else if (condicion==1) {
        //--------------cambios de velocidad--------------------------
        if (y>max) {
          cambio=vel;

          if (vel>0) {
            vel=vel-0.075;
          }

          if (max!=300) {
            max=max-5;
          }
        }
        if (y<min) {
          cambio=-vel;
        }

        //grafica de posicion
        graf("Pos: ", " m", pos1[cont], 80, 110, plot, myArray);
        //writer("Pos: ", " m", pos1[cont], out2);

        //grafica de velocidad vs tiempo
        graf("Vel: ", " m/s", vel1[cont], 150, 180, plot2, myArray2);
        //writer("Vel: ", " m/s", vel1[cont], out2);

        //grafica de aceleracion
        graf("Ace: ", " m/s^2", ace1[cont], 220, 250, plot3, myArray3);
        //writer("Ace: ", " m/s^2", ace1[cont], out2);

        out2.println("Tiempo: "+cont);
        out2.println("Pos: " + pos1[cont]+" m");
        out2.println("Vel: " + vel1[cont]+" m/s");        
        out2.println("Ace: " + ace1[cont]+" m/s^2");
        out2.println("");
        out1.close();
        out3.close();
      }
    } else if (caso=="oscilaciones forzadas") {
      background(133, 193, 233);
      plot.setTitleText("P vs T");
      plot2.setTitleText("V vs T");
      plot3.setTitleText("A vs T");

      image(img14, 0, 0);
      image(img15, 15, 30, 250, 50);
      image(img31, 150, 80, 120, y); 
      image(img16, -15, 80, 200, y); 
      image(img15, 15, y+80, 250, 120);

      if (continuar==false) {
        image(img36, 260, 30, 50, 50);
        contador=contador+1;
      } else {
        image(img37, 260, 30, 50, 50);
      }

      if (t1==0) {
        parar=true;
      }

      //--------------hago el contador de cuanto se demora la animacion----------------------------
      if (cont==t1) {
        parar=true;
        textSize(20);
        fill(255, 255, 255);
        text("Tiempo: "+t1, 90, 60);
        etapa=5;
      } else if (cont!=t1 && parar==false && continuar==false) {
        y=y-cambio;
        textSize(20);
      }
      fill(255, 255, 255);
      text("Tiempo: "+cont, 90, 60);
      //calculo el tiempo por cada draw   
      if (contador==60 && continuar==false) {
        graficas();
        cont=cont+1;
        if (cont!=t1) {
          contador=0;
        }
        y1=b1/(2*m);
        f_inicial=sqrt(k/m);
        f=sqrt(pow(f_inicial, 2)-pow(y1, 2));

        amplitud1[cont]=(1)/(m)*(f_angular)/(sqrt(pow(pow(f, 2)-pow(f_inicial, 2), 2)+4*pow(f, 2)*pow(y1, 2)));
        bbb=atan((1)/(m)*(pow(f, 2)-pow(f_inicial, 2))/(2*y1*f));
        pos1[cont]=amplitud1[cont]*sin(f*cont+bbb); 
        vel1[cont]=amplitud1[cont]*f*cos(f*cont+bbb);
        ace1[cont]=-amplitud1[cont]*pow(f, 2)*sin(cont*f+bbb);

        if (round(vel1[cont])==0 &&  round(vel1[cont-1])==0  &&  round(vel1[cont-2])==0 &&  round(vel1[cont-3])==0&& cont>3) {
          parar=true;
        }
      }

      //--------------cambios de velocidad--------------------------
      if (y>max) {
        cambio=vel;

        if (vel>-1) {
          vel=vel-0.025;
        }

        if (max!=300) {
          max=max-5;
        }
      }
      if (y<min) {
        cambio=-vel;
      }

      //grafica de posicion
      graf("Pos: ", " m", pos1[cont], 80, 110, plot, myArray);

      //grafica de velocidad
      graf("Vel: ", " m/s", vel1[cont], 150, 180, plot2, myArray2);

      //grafica de aceleracion vs tiempo
      graf("Ace: ", " m/s^2", ace1[cont], 220, 250, plot3, myArray3);
      out3.println("Tiempo: "+cont);
      out3.println("Pos: " + pos1[cont]+" m");
      out3.println("Vel: " + vel1[cont]+" m/s");        
      out3.println("Ace: " + ace1[cont]+" m/s^2");
      out3.println("");
      out1.close();
      out2.close();
    }
  } else if (etapa==10) {
    image(img22, 0, 0);
    image(img21, 1000, 50, 100, 100);
  } else if (etapa==11) {
    image(img23, 0, 0);
    image(img20, 100, 50, 100, 100);
    image(img21, 1000, 50, 100, 100);
    instrucciones_una_vez=0;
  } else if (etapa==12) {
    image(img25, 0, 0);
    image(img20, 100, 50, 100, 100);
    image(img21, 1000, 50, 100, 100);
    instrucciones_una_vez=0;
  } else if (etapa==13) {
    image(img32, 0, 0);
    image(img20, 100, 50, 100, 100);
    image(img5, 350, 600, 500, 100);
    text("Finalizar", 510, 670);
  } else if (etapa==5) {
    image(img35, 0, 0);

    if ((caso=="oscilaciones forzadas" || caso=="sistema amortiguado" || caso=="sistema no amortiguado")&& kol==true) {
      gra=true;
      gra2=true;
      gra3=true;
      grafica=1;
      kol=false;
    }


    if (grafica==1 && gra==true) {
      //plot = new GPlot(this, 150, 80, 900, 600);
      plot.setDim(panelDim);
      plot.setPos(150, 80);
      plot.activatePanning();
      plot.activateZooming(1.1, CENTER, CENTER);
      plot.setTitleText("P vs T");
      plot.setPoints(myArray);
      plot.defaultDraw();
    } else if (grafica==2 && gra2==true) {
      //plot2 = new GPlot(this, 150, 80, 900, 600);
      plot2.setDim(panelDim);
      plot2.setPos(150, 80);
      plot2.activatePanning();
      plot2.activateZooming(1.1, CENTER, CENTER);
      plot2.setTitleText("V vs T");
      plot2.setPoints(myArray2);
      plot2.defaultDraw();
    } else if (grafica==3 && gra3==true) {
      //plot3 = new GPlot(this, 150, 80, 900, 600);
      plot3.setDim(panelDim);
      plot3.setPos(150, 80);
      plot3.activatePanning();
      plot3.activateZooming(1.1, CENTER, CENTER);
      plot3.setTitleText("A vs T");
      plot3.setPoints(myArray3);
      plot3.defaultDraw();
    }


    //-----------guardar las imagenes de las graficas--------------
    if (screenshot==true && grafica==1 && caso=="sistema no amortiguado") {      
      descargar(plot, myArray, "sistema no amortiguado/Posicion vs Tiempo/Grafica.jpg", "sistema no amortiguado/Posicion vs Tiempo/Datos.csv", table);
    }

    if (screenshot==true && grafica==2 && caso=="sistema no amortiguado") {   
      descargar(plot2, myArray2, "sistema no amortiguado/Velocidad vs Tiempo/Grafica.jpg", "sistema no amortiguado/Velocidad vs Tiempo/Datos.csv", table2);
    }

    if (screenshot==true && grafica==3 && caso=="sistema no amortiguado") {
      descargar(plot3, myArray3, "sistema no amortiguado/Aceleracion vs Tiempo/Grafica.jpg", "sistema no amortiguado/Aceleracion vs Tiempo/Datos.csv", table3);
    }

    //-----------------grafica de sistema amortiguado------------------------------- 
    if (screenshot==true && grafica==1 && caso=="sistema amortiguado") {
      descargar(plot, myArray, "sistema amortiguado/Posicion vs Tiempo/Grafica.jpg", "sistema amortiguado/Posicion vs Tiempo/Datos.csv", table);
    }

    if (screenshot==true && grafica==2 && caso=="sistema amortiguado") {
      descargar(plot2, myArray2, "sistema amortiguado/Velocidad vs Tiempo/Grafica.jpg", "sistema amortiguado/Velocidad vs Tiempo/Datos.csv", table2);
    }

    if (screenshot==true && grafica==3 && caso=="sistema amortiguado") {
      descargar(plot3, myArray3, "sistema amortiguado/Aceleracion vs Tiempo/Grafica.jpg", "sistema amortiguado/Aceleracion vs Tiempo/Datos.csv", table3);
    }

    //-----------------grafica de sistema oscilador forzado ------------------------------- 
    if (screenshot==true && grafica==1 && caso=="oscilaciones forzadas") {
      descargar(plot, myArray, "oscilaciones forzadas/Posicion vs Tiempo/Grafica.jpg", "oscilaciones forzada/Posicion vs Tiempo/Datos.csv", table);
    }

    if (screenshot==true && grafica==2 && caso=="oscilaciones forzadas") {
      descargar(plot2, myArray2, "oscilaciones forzadas/Velocidad vs Tiempo/Grafica.jpg", "oscilaciones forzada/Velocidad vs Tiempo/Datos.csv", table2);
    }

    if (screenshot==true && grafica==3 && caso=="oscilaciones forzadas") {
      descargar(plot3, myArray3, "oscilaciones forzadas/Aceleracion vs Tiempo/Grafica.jpg", "oscilaciones forzada/Aceleracion vs Tiempo/Datos.csv", table3);
    }


    image(img26, 1070, 300, 100, 100);
    image(img27, 30, 300, 100, 100);
    image(img28, 1000, 82, 45, 45);
  }
  out1.flush();
  out2.flush();
  out3.flush();
}

void keyPressed() {
  //---------------------para ingresar los datos del tiempo ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux==true && aux==true && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    t=t+key;
    conteo=t.length();
    if (conteo>5) {
      aux=false;
      t1=Integer.parseInt(t);
      t=t+" Seg";
    }
  }  



  //---------------------para ingresar los datos de la amplitud ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux2==true && aux==false && aux2==true && aux==false && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    amplitud=amplitud+key;
    conteo=amplitud.length();
    if (conteo>10) {
      aux2=false;
      amplitud1[0]=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
  }  


  //---------------------para ingresar los datos del frecuencia ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux3==true && aux2==false && aux3==true && aux==false && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    frecuencia=frecuencia+key;
    conteo=frecuencia.length();
    if (conteo>10) {
      aux3=false;
      f=Float.parseFloat(frecuencia);
      frecuencia=frecuencia+" rads/s";
    }
  }  


  //---------------------para ingresar los datos de la fase inicial ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux4==true && aux3==false && aux2==false && aux==false && aux4==true && caso=="sistema no amortiguado" && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    fase_inicial=fase_inicial+key;
    conteo=fase_inicial.length();
    if (conteo>10) {
      aux4=false;
      o=Float.parseFloat(fase_inicial);
      etapa=3;
      fase_inicial=fase_inicial+" rad";
    }
  }  



  // --------------------------------- ingreso de los datos del sistema amortiguado ---------------------------------------------------

  //---------------------para ingresar los datos de la masa ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux2==true && aux==false && aux2==true && aux==false && (caso=="sistema amortiguado" || caso=="oscilaciones forzadas") && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.')) {
    masa=masa+key;
    conteo=masa.length();
    if (conteo>10) {
      aux2=false;
      m=Float.parseFloat(masa);
      masa=masa+" kg";
    }
  }  


  //---------------------para ingresar los datos de la constante de elasticidad ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux3==true && aux2==false && aux3==true && aux==false && (caso=="sistema amortiguado" || caso=="oscilaciones forzadas") && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    elasticidad=elasticidad+key;
    conteo=elasticidad.length();
    if (conteo>10) {
      aux3=false;
      k=Float.parseFloat(elasticidad);
      elasticidad=elasticidad+" N/m";
    }
  }  


  //---------------------para ingresar los datos de la constante de amortiguamineto ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux4==true && aux3==false && aux2==false && aux==false && aux4==true && (caso=="sistema amortiguado" || caso=="oscilaciones forzadas") && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    amortiguamiento=amortiguamiento+key;
    conteo=amortiguamiento.length();
    if (conteo>10) {
      aux4=false;
      b1=Float.parseFloat(amortiguamiento);
      amortiguamiento=amortiguamiento+" kg/s";
    }
  }

  //---------------------para ingresar los datos de la amplitud ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT && aux3==false && aux2==false && aux==false && aux6==true && caso=="sistema amortiguado" && aux4==false && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    amplitud=amplitud+key;
    conteo=amplitud.length();
    if (conteo>10) {
      aux6=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
  }


  //---------------------para ingresar los datos del angulo de fase ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux5==true && aux3==false && aux2==false && aux==false && aux5==true && caso=="sistema amortiguado" && aux4==false && aux6==false && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    angulo_de_fase=angulo_de_fase+key;
    conteo=angulo_de_fase.length();
    if (conteo>10) {
      aux5=false;
      o1=Float.parseFloat(angulo_de_fase);
      etapa=3;
      angulo_de_fase=angulo_de_fase+" °";
    }
  }


  //----------------------------------oscilaciones forzadas----------------------------------------

  //---------------------para ingresar los datos de la frecuencia angular ------------------------------------
  if (cont==1 && key!=ENTER && key!=BACKSPACE&&keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT&& aux5==true && aux3==false && aux2==false && aux==false  && caso=="oscilaciones forzadas" && aux4==false  && (key=='1' || key=='2' || key=='3' || key=='4' || key=='5' || key=='6' || key=='7' || key=='8' || key=='9' || key=='0' || key=='.' || key=='-')) {
    frecuencia=frecuencia+key;
    conteo=frecuencia.length();
    if (conteo>10) {
      aux5=false;
      f_angular=Float.parseFloat(frecuencia);
      etapa=3;
      frecuencia=frecuencia+" N";
    }
  }
}




void mouseClicked() {
  //-------------controles para el menu de las transformaciones del resorte----------------
  if (mouseX>900 && mouseX<1000 && mouseY>300 && mouseY<400 && valor<3 && etapa==1) {
    valor=valor+1;
  }

  if (mouseX>220 && mouseX<330 && mouseY>300 && mouseY<400 && valor>1 && etapa==1) {
    valor=valor-1;
  }

  if (mouseX>350 && mouseX<850 && mouseY>500 && mouseY<600 && etapa==1) {
    etapa=2;
  }

  //parar y reproducir musica  lo comente pq me estresaba escucharlo cada que lo ejecutaba
  if (mouseX>50 && mouseX<120 && mouseY>30 && mouseY<100 && etapa==0) {
    if (musica==true) {
      musica=false;
    } else if (musica==false) {
      musica=true;
    }
  }




  //---------------------los controles para la timepo------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>80 && mouseY<120 && etapa==2) {
    t="";
    aux=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>80 && mouseY<120 && etapa==2 && aux==true) {

    try {
      aux=false;
      t1=Integer.parseInt(t);
      t=t+" Seg";
    }
    catch(Exception e) {
      t="";
      aux=true;
    }
  }



  // ------------------- los controles para el menu de la amplitud----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>270 && mouseY<320 && etapa==2 && caso=="sistema no amortiguado") {
    amplitud="";
    aux2=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>270 && mouseY<320 && etapa==2 && aux2==true && aux==false && caso=="sistema no amortiguado") {

    try {
      aux2=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
    catch(Exception e) {
      amplitud="";
      aux2=true;
    }
  }



  // ------------------- los controles para el menu de la frecuencia----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>460 && mouseY<510 && etapa==2 && caso=="sistema no amortiguado") {
    frecuencia="";
    aux3=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>460 && mouseY<510 && etapa==2 && aux3==true && aux2==false && aux==false && caso=="sistema no amortiguado") {

    try {
      aux3=false;
      f=Float.parseFloat(frecuencia);
      frecuencia=frecuencia+" rads/s";
    }
    catch(Exception e) {
      frecuencia="";
      aux3=true;
    }
  }




  // ------------------- los controles para el menu de la fase inicial----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>650 && mouseY<700 && etapa==2 && caso=="sistema no amortiguado") {
    fase_inicial="";
    aux4=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>650 && mouseY<700 && etapa==2 && aux4==true && aux3==false && aux2==false && aux==false && caso=="sistema no amortiguado") {

    try {
      aux4=false;
      o=Float.parseFloat(fase_inicial);
      etapa=3;
      fase_inicial=fase_inicial+" rad";
    }
    catch(Exception e) {
      fase_inicial="";
      aux4=true;
    }
  }

  //--------------------pausar animacion----------------------------------------------------------------------------------
  if (mouseX>260 && mouseX<310 && mouseY>30 && mouseY<80 && etapa==4 && (caso=="sistema no amortiguado" || caso=="sistema amortiguado" || caso=="oscilaciones forzadas")) {
    if (continuar==false) {
      continuar=true;
    } else {
      continuar=false;
    }
  }

  if (mouseX>250 && mouseX<950 && mouseY>600 && mouseY<700 && etapa==3 && (aceleracion==true || posicion==true || velocidad==true)) {
    etapa=4;
  }

  //sistema amortiguado acpetar de la etapa 3
  if (mouseX>250 && mouseX<950 && mouseY>500 && mouseY<600 && etapa==3 && caso=="sistema amortiguado") {
    etapa=4;
  }

  //-----------------------------------------sistema amortiguado-----------------------------------------------------------------

  // ------------------- los controles para el menu de la masa----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>270 && mouseY<320 && etapa==2 && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas")) {
    masa="";
    aux2=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>270 && mouseY<320 && etapa==2 && aux2==true && aux==false && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas")) {

    try {
      aux2=false;
      m=Float.parseFloat(masa);
      masa=masa+" kg";
    }
    catch(Exception e) {
      masa="";
      aux2=true;
    }
  }



  // ------------------- los controles para el menu de la constante de elasticidad----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>460 && mouseY<510 && etapa==2 && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas")) {
    elasticidad="";
    aux3=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>460 && mouseY<510 && etapa==2 && aux3==true && aux2==false && aux==false && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas")) {

    try {
      aux3=false;
      k=Float.parseFloat(elasticidad);
      elasticidad=elasticidad+" N/m";
    }
    catch(Exception e) {
      elasticidad="";
      aux3=true;
    }
  }




  // ------------------- los controles para el menu de la constante de amortigumiento----------------------
  if (mouseX>1080 && mouseX<1130 && mouseY>650 && mouseY<700 && etapa==2 && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas")) {
    amortiguamiento="";
    aux4=true;
  }

  if (mouseX>650 && mouseX<700 && mouseY>650 && mouseY<700 && etapa==2 && aux4==true && aux3==false && aux2==false && aux==false && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas")) {

    try {
      aux4=false;
      b1=Float.parseFloat(amortiguamiento);
      amortiguamiento=amortiguamiento+" kg/s";
    }
    catch(Exception e) {
      amortiguamiento="";
      aux4=true;
    }
  }


  // ------------------- los controles para el menu de la amplitud----------------------
  if (mouseX>480 && mouseX<530 && mouseY>460 && mouseY<510 && etapa==2 && caso=="sistema amortiguado") {
    amplitud="";
    aux6=true;
  }

  if (mouseX>50 && mouseX<100 && mouseY>460 && mouseY<510 && etapa==2 && aux4==false && aux3==false && aux2==false && aux==false && caso=="sistema amortiguado" && aux6==true) {

    try {
      aux6=false;
      a=Float.parseFloat(amplitud);
      amplitud=amplitud+" m";
    }
    catch(Exception e) {
      amplitud="";
      aux6=true;
    }
  }


  // ------------------- los controles para el menu del angulo de fase----------------------
  if (mouseX>480 && mouseX<530 && mouseY>650 && mouseY<700 && etapa==2 && caso=="sistema amortiguado") {
    angulo_de_fase="";
    aux5=true;
  }

  if (mouseX>50 && mouseX<100 && mouseY>650 && mouseY<700 && etapa==2 && aux5==true && aux3==false && aux2==false && aux==false && caso=="sistema amortiguado" && aux4==false && aux6==false) {

    try {
      aux5=false;
      o1=Float.parseFloat(angulo_de_fase);
      etapa=3;
      angulo_de_fase=angulo_de_fase+" °";
    }
    catch(Exception e) {
      angulo_de_fase="";
      aux5=true;
    }
  }

  // ------------------- los controles para el menu de la frecuencia angular----------------------
  if (mouseX>480 && mouseX<530 && mouseY>650 && mouseY<700 && etapa==2 && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas")) {
    frecuencia="";
    aux5=true;
  }

  if (mouseX>50 && mouseX<100 && mouseY>650 && mouseY<700 && etapa==2 && aux5==true && aux3==false && aux2==false && aux==false && (caso=="sistema amortiguado"|| caso=="oscilaciones forzadas") && aux4==false) {

    try {
      aux5=false;
      f_angular=Float.parseFloat(frecuencia);
      etapa=3;
      frecuencia=frecuencia+" rad/s";
    }
    catch(Exception e) {
      frecuencia="";
      aux5=true;
    }
  }

  // ------------------- los controles para el inicio del programa----------------------
  if (mouseX>250 && mouseX<950 && mouseY>450 && mouseY<520 && una_sola_vez==0 && etapa==0) {
    etapa=1; // cambiar el 4 por el 1
    una_sola_vez=1;
  }

  // ------------------- los controles para ir a las instrucciones----------------------
  if (mouseX>250 && mouseX<950 && mouseY>540 && mouseY<610 && etapa==0) {
    etapa=10;
  }

  // ------------------- los controles para salir del programa----------------------
  if (mouseX>250 && mouseX<950 && mouseY>630 && mouseY<700 && etapa==0) {
    exit();
  }

  // ------------------- los controles para las instrucciones----------------------
  if (mouseX>1000 && mouseX<1100 && mouseY>50 && mouseY<150 && etapa==10) {
    etapa=11;
    instrucciones_una_vez=1;
  }

  if (mouseX>1000 && mouseX<1100 && mouseY>50 && mouseY<150 && etapa==11 && instrucciones_una_vez==0) {
    etapa=12;
    instrucciones_una_vez=1;
  }
  if (mouseX>100 && mouseX<200 && mouseY>50 && mouseY<150 && etapa==11) {
    etapa=10;
  }

  if (mouseX>1000 && mouseX<1100 && mouseY>50 && mouseY<150 && etapa==12 && instrucciones_una_vez==0) {
    etapa=13;
    instrucciones_una_vez=1;
  }
  if (mouseX>100 && mouseX<200 && mouseY>50 && mouseY<150 && etapa==12) {
    etapa=11;
  }
  if (mouseX>100 && mouseX<200 && mouseY>50 && mouseY<150 && etapa==13) {
    etapa=12;
  }
  if (mouseX>350 && mouseX<850 && mouseY>600 && mouseY<700 && etapa==13) {
    etapa=1;
  }

  //-----------------------graficas de la etapa 4--------------------------------------- 
  if (mouseX>1070 && mouseX<1170 && mouseY>300 && mouseY<400 && etapa==5 && grafica>=1 && grafica<=2 && (gra2==true || gra3==true)) {
    grafica=grafica+1;
  }
  if (mouseX>30 && mouseX<130 && mouseY>300 && mouseY<400 && etapa==5 && grafica<=3 && grafica>=2 && (gra==true || gra2==true)) {
    grafica=grafica-1;
  }

  //----------------------------boton de descarga-----------------------------------
  if (mouseX>1000 && mouseX<1045 && mouseY>82 && mouseY<127 && etapa==5) {
    screenshot=true;
  }
}

//--------------------funcion para crear menus para ingresar los datos && ahorro de lineas de codigo:180-----------------------------------------
public void menus(int posx, int posy, String titulo, int posxx, int posyy, int posxxx, int posyyy, int posxxxx, int posyyyy, int posicionx, int posiciony, int posicionxx, int posicionyy, String variable, int otra) {

  fill(215, 219, 221);
  noStroke();
  rect(posx, posy, 580, otra, 25);
  fill(0, 0, 0);
  text(titulo, posxx, posyy);
  textSize(20);
  image(img7, posxxx, posyyy, 50, 50);
  image(img8, posxxxx, posyyyy, 50, 50);
  fill(255, 255, 255);
  rect(posicionx, posiciony, 350, 50);
  fill(0, 0, 0);
  text(variable, posicionxx, posicionyy);
}

//--------------------funcion para las graficas de los casos amortiguado y forzado - lineas ahorradas:96-----------------------------------------
public void graf(String tip, String uni, float tipo, int rect, int text, GPlot plot, GPointsArray myArray) {
  noStroke();
  fill(215, 219, 221);
  rect(270, rect, 320, 50, 25);
  fill(0, 0, 0);
  textSize(20);
  text(tip+tipo+uni, 275, text);
  plot.setPoints(myArray);
  plot.defaultDraw();
}

//-----------------------------cargar las graficas- lineas ahorradas:36---------------------------------------------------------------------------
public void graficas() {

  myArray.add(cont, pos1[cont]);
  myArray2.add(cont, vel1[cont]);
  myArray3.add(cont, ace1[cont]);


  TableRow newRow = table.addRow();
  newRow.setFloat("posicion", pos1[cont]);
  newRow.setFloat("tiempo", cont);

  TableRow newRow2 = table2.addRow();
  newRow2.setFloat("Velocidad", vel1[cont]);
  newRow2.setFloat("tiempo", cont);


  TableRow newRow3 = table3.addRow();
  newRow3.setFloat("Aceleracion", ace1[cont]);
  newRow3.setFloat("tiempo", cont);
}


//--------------------------funcion para descargar los archivos de las graficas- lineas ahorradas:63  ---------------------------------------
public void descargar(GPlot plot, GPointsArray myArray, String nombre, String nombre2, Table table) {

  plot = new GPlot(this, 0, 0, 1200, 750);
  plot.setPoints(myArray);
  plot.defaultDraw();
  save(nombre);
  saveTable(table, nombre2);
  plot = new GPlot(this, 150, 80, 900, 600);
  screenshot=false;
}
