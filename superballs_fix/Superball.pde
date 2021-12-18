//class Superballを定義
public class Superball{
  float grvty, x, y, dia, addX, addY, hue;
  float prePos;
  
  float upAdj, downAdj, leftAdj, rightAdj;
  int vanishCount = 0;
  int alpha = 200;
  //属性。属性というのは多分クラス内で使う変数のことだと思う。
  
  Superball(float constX, float constY, float constDia, float constGrvty,
  float constAddX, float constAddY, float constHue){
  //コンストラクタ。
    
    x = constX;
    y = constY;
    dia = constDia;
    grvty = constGrvty;
    addX = constAddX;
    addY = constAddY;
    hue = constHue;
    
  }
  
  
  void move(){  //球の移動を担当する関数
    addY += grvty;
    prePos = y;
    
    upAdj = 0 +(dia/2)-0.1;
    downAdj = 1000 -(dia/2)+0.1;
    leftAdj = 0 +(dia/2)-0.1;
    rightAdj = 1000 -(dia/2)+0.1;
    
    x += addX;
    y += addY;
    
    
    
    if(x > rightAdj || x < leftAdj){
      if(x > rightAdj){
        prePos = rightAdj;
      }else{
        prePos = leftAdj;
      }
      addX *= (-1);
    }
    
    if(y > downAdj || y < upAdj){
      addY *= (-0.97);
      addX *= 0.98;
      
      y = prePos;
      
      vanishCount ++;
    }
  }
  
  void display(){  //球の描写を担当する関数
    if(vanishCount > 500){
      alpha -= 1;
    }
    
    fill(hue, 80, 100, alpha);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x,y,dia,dia);
  }
  
}
