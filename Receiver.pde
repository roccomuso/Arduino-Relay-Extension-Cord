// Reicever  - Al pin 8 è connesso il relè.

#include <VirtualWire.h>
void setup()
{
    //Serial.begin(9600); // Debugging only
    pinMode(8, OUTPUT);
    
    // Initialise the IO and ISR
    vw_set_ptt_inverted(true); // Required for DR3100
    vw_setup(2000);      // Bits per sec
    vw_rx_start();       // Start the receiver PLL running
    
}
void loop()
{
    uint8_t buf[VW_MAX_MESSAGE_LEN];
    uint8_t buflen = VW_MAX_MESSAGE_LEN;
    if (vw_get_message(buf, &buflen)) // Non-blocking
    {
        int i;
        String x = ""; //conterrà la stringa ricevuta
 
        for (i = 0; i < buflen; i++)
        {
          
            //Serial.print(buf[i], HEX);
            //Serial.print(" ");
            //Serial.print((char) buf[i]); //casting a carattere del codice ascii
            x += (char)buf[i];
      }
      
     //Serial.println("");
     if (x == "on"){ // Se il mex ricevuto è "on"
        //Serial.println(x);
        digitalWrite(8, HIGH);
        }else if(x == "off"){
        digitalWrite(8, LOW);
       }
       
    }
}