/*
 * arduinoInterface.ino
 *
 * An Arduino sketch framework for sending and receiving data from a PC.
 * The sketch expects that data will arrive in chunks of size FRAMESIZE.
 * It after it receives the last byte it will blink the LED that many
 * times, then write the last byte back to the serial port.
 *
 * JSB 5/2013 
 */
#define LEDPIN      13         // Pin of LED to blink
#define BAUDRATE 115200        // Serial baudrate  
#define FRAMESIZE    4         // Size of incoming data chunks, # of bytes

byte dataFrame[FRAMESIZE];     // An array to hold incoming data

void setup() {
  
  pinMode(LEDPIN,    OUTPUT);
  digitalWrite(LEDPIN, LOW);
  
  Serial.begin(BAUDRATE); 
}

void loop() {
  
  int i;
  
  // If there is enough available data, read it.
  if (Serial.available() >= FRAMESIZE) {
    
      // Read FRAMESIZE bytes into the array dataFrame
      Serial.readBytes((char *) dataFrame, FRAMESIZE);  
      
      // Take the last byte, blink the LED that many times
      for (i=0; i < dataFrame[FRAMESIZE-1]; i++) {
        digitalWrite(LEDPIN, HIGH); 
        delay(100);
        digitalWrite(LEDPIN, LOW);
        delay(100);
      }
      
      // Take the last byte, write it back to the serial port.
      Serial.write(dataFrame[FRAMESIZE-1]);       
  }
}
