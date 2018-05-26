MAIN_FILE_NAME=main

PROGRAMMER=usbasp
MCU=attiny13

CK_128KHZ=128000UL
CK_9MHZ6_DIV8=1200000UL
F_CPU=${CK_9MHZ6_DIV8}

${MAIN_FILE_NAME}.hex: ${MAIN_FILE_NAME}.o
	avr-objcopy -O ihex ${MAIN_FILE_NAME}.o ${MAIN_FILE_NAME}.hex
	rm ${MAIN_FILE_NAME}.o

${MAIN_FILE_NAME}.o: ${MAIN_FILE_NAME}.c
	avr-gcc -std=c99 -Wall -mmcu=${MCU} -I. -gdwarf-2 -DF_CPU=${F_CPU} -Os -o ${MAIN_FILE_NAME}.o ${MAIN_FILE_NAME}.c

flash: ${MAIN_FILE_NAME}.hex
	avrdude -c ${PROGRAMMER} -p ${MCU} -U flash:w:${MAIN_FILE_NAME}.hex

update: clean flash

erase:
	avrdude -c ${PROGRAMMER} -p ${MCU} -e

clean:
	rm ${MAIN_FILE_NAME}.hex
