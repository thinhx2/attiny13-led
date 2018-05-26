#include <avr/io.h>
#include <util/delay.h>

int main(void) {
    DDRB &= ~(1<<PB3);  // IN
    PORTB |= (1<<PB3);  // Pull-up ON


    DDRB |=  (1<<PB4);   // OUT
	
	while(1) {
        PORTB |= (1<<PB4);
		_delay_ms(1000);
		PORTB &= ~(1<<PB4);
		_delay_ms(1000);
	}
	return 0;
}

