MAIN_FILE=main

PROGRAMMER=usbasp
MCU=attiny13

F_CPU=${CK_DEFAULT}

#------------------------------------------------------------------------------

${MAIN_FILE}.hex: ${MAIN_FILE}.o
	avr-objcopy -O ihex ${MAIN_FILE}.o ${MAIN_FILE}.hex
	rm ${MAIN_FILE}.o

${MAIN_FILE}.o: ${MAIN_FILE}.c
	avr-gcc -std=c99 -Wall -mmcu=${MCU} -I. -gdwarf-2 -DF_CPU=${F_CPU} -Os -o ${MAIN_FILE}.o ${MAIN_FILE}.c

flash: ${MAIN_FILE}.hex
	${AVRDUDE} -U flash:w:${MAIN_FILE}.hex

update: clean flash

erase:
	${AVRDUDE} -e

clean:
	rm ${MAIN_FILE}.hex

fuze_t13_clock_9m6:
	${AVRDUDE} -U lfuse:w:0x7a:m

fuze_t13_clock_4m8:
	${AVRDUDE} -U lfuse:w:0x79:m

fuze_t13_clock_9m6_div8:
	${AVRDUDE} -U lfuse:w:0x6a:m

fuze_t13_clock_4m8div8:
	${AVRDUDE} -U lfuse:w:0x69:m

fuze_t13_clock_128k:
	${AVRDUDE} -U lfuse:w:0x7b:m

fuze_t13_clock_128kdiv8:
	${AVRDUDE} -U lfuse:w:0x6b:m

fuze_t13_default:
	${AVRDUDE} -U lfuse:w:0x6a:m -U hfuse:w:0xff:m

#------------------------------------------------------------------------------

AVRDUDE=avrdude -c ${PROGRAMMER} -p ${MCU}

CK_9M6=9600000UL
CK_4M8=4800000UL
CK_9M6_DIV8=1200000UL
CK_4M8_DIV8=600000UL
CK_128K=128000UL
CK_128K_DIV8=16000UL
CK_DEFAULT=${CK_9M6_DIV8}
