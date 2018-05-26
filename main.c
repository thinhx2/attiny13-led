#include <avr/io.h>
#include <util/delay.h>

#define BTN_PRESSED !(PINB & (1<<PB3))
#define LED_OFF     PORTB |= (1<<PB4)
#define LED_ON      PORTB &= ~(1<<PB4)

int main(void) {
    DDRB &= ~(1<<PB3);  // Button pin = Input
    PORTB |= (1<<PB3);  // Pull-up = ON
    DDRB |=  (1<<PB4);   // LED pin = Output
	
	while(1) {
        if (BTN_PRESSED) LED_ON; else LED_OFF;
	}
	return 0;
}

