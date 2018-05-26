#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    DDRB &= ~(1<<PB3);  // IN
    PORTB |= (1<<PB3);  // Pull-up ON

    DDRB |=  (1<<PB4);   // OUT
	
	while(1) {
        if (PINB & (1<<PB3)) {  // Not pressed
            PORTB |= (1<<PB4);  // Turn OFF
        } else {
		    PORTB &= ~(1<<PB4);  // Turn ON
        }
	}
	return 0;
}

