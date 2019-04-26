void setup() {
  Serial.begin(115200);
  Serial.println("(Dividend,Divisor) =") ; 
  pinMode(2,OUTPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);  

}

void loop(){


if (Serial.available()>0){

int A =Serial.parseInt();  
int B = Serial.parseInt();

Serial.println(A);
Serial.println(B);

  

digitalWrite(9,A%2);
A = (A>>1);
digitalWrite(10,A%2);
A = (A>>1);
digitalWrite(11,A%2);
A = (A>>1);
digitalWrite(12,A%2);
A = (A>>1);
digitalWrite(13,A%2);
A = (A>>1);



digitalWrite(3,B%2);
B = (B>>1);
digitalWrite(4,B%2);
B = (B>>1);
digitalWrite(5,B%2);
B = (B>>1);
digitalWrite(6,B%2);
B = (B>>1);
digitalWrite(7,B%2);
B = (B>>1);


digitalWrite(8,1);
delay(100000000);
}

}
