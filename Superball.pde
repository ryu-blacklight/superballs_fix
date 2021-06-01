//class Superballを定義
public class Superball{
  float grvty, x, y, dia, addX, addY, i;
  //属性。属性というのは多分クラス内で使う変数のことだと思う。
  
  Superball(float constX, float constY, float constDia, float constGrvty,
  float constAddX, float constAddY){
  //コンストラクタ。
    
    x = constX;
    y = constY;
    dia = constDia;
    grvty = constGrvty;
    addX = constAddX;
    addY = constAddY;
    
  }
  
  
  void move(){  //球の移動を担当する関数
    addY += grvty;
  
    x += addX;
    y += addY;
    
    if(x > 990 || x < 10){
      addX *= (-1);
    }
    
    if(y > 990 || y < 10){
      addY *= (-0.97);
    }
  }
  
  void display(){  //球の描写を担当する関数
    
    fill(360, 0, 50);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x,y,dia,dia);
  }
}
