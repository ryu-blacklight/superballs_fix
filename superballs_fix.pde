
/*
#########################################################################################
別ファイルにあるクラスの参照は問題なくできていて、アニメーションもうまくいっている。
配列の適用と、クラスの格納が難しい状態
#########################################################################################
*/

Superball sb;

float grvty, x, y, dia, addX, addY;
int i;
int[] oldArray;
int[] newArray;
//int型で定義すると、減速処理中に速度が１未満の小数点になった時に速度が０となり演算処理が停止します
//必ずfloat型の浮動小数点で定義してください


void setup(){
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100);
  
  //sb = new Superball[];
  
  i = 0;
  
  oldArray = new int [1];
  sb = new Superball(0,0,0,0,0,0);
  
  frameRate(60);
}

void draw(){
  background(240,20,90);
  
  sb.display();
  sb.move();
  
  //background(360, 0, 70);
  
  //translate(30, 870);
  //saveFrame("frames/Gravity######.tga");
  
}

void mouseClicked(){
  
  //i++;
  
  dia = int(random(16,30));
  grvty = 0.98*int(random(2,5));
  addX = int(random(-50,50));
  addY = int(random(-30,70));
  //ランダムパラメータを生成。
  
  //newArray = 
  
  sb = new Superball(pmouseX,pmouseY,dia,grvty,addX,addY);
  //クリック時、新インスタンスを生成。
  //
  
  
  i++;  //処理終了時
    
}
