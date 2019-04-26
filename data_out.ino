void setup() {
  pinMode(2,INPUT);
  pinMode(3,INPUT);
  pinMode(4,INPUT);
  pinMode(5,INPUT);
  pinMode(6,INPUT);
  pinMode(7,INPUT);
  pinMode(8,INPUT);
  pinMode(9,INPUT);
  pinMode(10,INPUT);
  pinMode(11,INPUT);
  pinMode(12,INPUT);
  pinMode(13,INPUT);  
Serial.begin(9600);

}

int c= 1;
void loop()
{ 

  if(digitalRead(12)==1)
  {
    if(c < 2)
    {  
    
      int z0 = digitalRead(6);
      int z1 = digitalRead(5);
      int z2 = digitalRead(4);
      int z3 = digitalRead(3);
      int z4 = digitalRead(2);
      
      int b0 = digitalRead(11);
      int b1 = digitalRead(10);
      int b2 = digitalRead(9);
      int b3 = digitalRead(8);
      int b4 = digitalRead(7);
      
      int Q = (z0<<4)+(z1<<3)+(z2<<2)+(z3<<1)+z4;
      int R = (b0<<4)+(b1<<3)+(b2<<2)+(b3<<1)+b4;
    
      Serial.print("Quotient is");
      Serial.print(" ");
      Serial.println(int(Q));
      
      Serial.print("Remainder is");
      Serial.print(" ");
      Serial.println(int(R));
      c = c+1;
//      delay(100);
    }
  }
}
