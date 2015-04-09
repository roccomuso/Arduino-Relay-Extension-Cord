//Transmitter  - Arduino connesso in seriale, riceve "m" o "n" da tastiera e spedisce via radio 433mhz le stringhe "on" oppure "off"

#include <VirtualWire.h>

int val;

void setup()
{
    Serial.begin(9600);   // Debugging only
    
    // Initialise the IO and ISR
    vw_set_ptt_inverted(true); // Required for DR3100
    vw_setup(2000);      // Bits per sec
}
void loop()
{   
    
   if (Serial.available())
    {
        val = Serial.read();
        
        Serial.println(val);
        if (val == 110) // n = 110 in dec
        {
             const char *msg = "off";
             vw_send((uint8_t *)msg, strlen(msg));
             vw_wait_tx(); // Wait until the whole message is gone
        }
        else if (val == 109) //109 = m in dec
        {
            const char *msg = "on";
            vw_send((uint8_t *)msg, strlen(msg));
            vw_wait_tx(); // Wait until the whole message is gone
        }

     }

    delay(200);
}