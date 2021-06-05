ArrayList<Superball> sb;
//オブジェクトの宣言。「可変配列とSuperballクラスを使ってsbを作れるようにするよ」　作れるようにしただけ。

float grvty, x, y, dia, addX, addY, rndHue, rnd1;

//int型で定義すると、減速処理中に速度が１未満の小数点になった時に速度が０となり演算処理が停止します
//必ずfloat型の浮動小数点で定義してください


void setup(){
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100, 1000);
  
  sb = new ArrayList<Superball>();  //実際にsbを作るのはここから。可変配列を設定。
  
  frameRate(60);
  rndHue = 0;
}


void draw(){
  background(240, 20, 90);
  
  cursor();
  
  for(int j = 0; j < sb.size(); j++){
      sb.get(j).display();
      sb.get(j).move();
  }
  //召喚したインスタンスごとに処理を実行。
  //個人メモ：get()は可変配列の参照。move()とかはインスタンスのメソッド参照。
  
  /*
  if(frameCount < 600){
    saveFrame("frames/Gravity######.tga");
  }
  //gif作りたいとき使う
  */
}


void cursor(){
//カーソルの描写。
  for(int i = 0; i < 4; i++){
    int addI = i*90;
    //90度制限したarc関数を使って、90度毎に4回描写。
    
    for(int j = 0; j < 5; j++){
      int varJ1 = j*8;
      int varJ2 = j*12;
      
      int radStart = (0+addI)+varJ2;
      int radEnd = (90+addI)-varJ2;
      
      stroke(rndHue,80,100);
      strokeWeight(1);
      noFill();
      ellipse (mouseX, mouseY, 12, 12);
      arc(mouseX, mouseY, 24+varJ1, 24+varJ1, radians(radStart), radians(radEnd));
    }
  }
  
  int[] p1 = {mouseX+2, mouseY-2};
  int[] p2 = {mouseX+24, mouseY-24};
  int[] p3 = {mouseX+170, mouseY-24};
  int[] p4 = {mouseX+180, mouseY-34};
  int[] p5 = {mouseX+200, mouseY-34};
  int[] p01 = {mouseX+190, mouseY-30};
  int[] p02 = {mouseX+200, mouseY-30};
  
  line(p1[0], p1[1], p2[0], p2[1]);
  line(p2[0], p2[1], p3[0], p3[1]);
  line(p3[0], p3[1], p4[0], p4[1]);
  line(p4[0], p4[1], p5[0], p5[1]);
  line(p01[0], p01[1], p02[0], p02[1]);
  
  textSize(16);
  fill(0,0,100);
  text("Previous Ballcolor",mouseX+30,mouseY-28);
}


void mousePressed(){
//マウスを押したときにだけ実行。if(mousePressed)を使うとDraw更新されるたびに生成されていく。毎秒60個。
//それはちょっとまずいので関数実行で一個ずつ。
  
  dia = int(random(16,30));
  grvty = 0.98*int(random(2,5));
  addX = int(random(-50,50));
  addY = int(random(-30,70));
  rndHue = int(random(360));
  //ランダムパラメータを生成。
  
  
  sb.add(new Superball(mouseX, mouseY, dia, grvty, addX, addY, rndHue));
  //クリック時に新インスタンスを生成、可変配列に追加。
}


/*
参考サイト

https://qiita.com/sazae2000en/items/9a744e2570c380ddbf99
ArrayList（可変配列）の作成のために参照。

https://stackoverflow.com/questions/10520617/why-can-array-constants-only-be-used-in-initializers
不可変配列の初期化に、既に決めてある数字を入れる方法。
*/
