
/*
 * main.c
 *
 *  Created on: 2020年3月8日
 *      Author: lhf
 */
// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

int main()
{
	volatile unsigned int *LED_PIO = (unsigned int*)0x00000080; //make a pointer to access the PIO block
	volatile unsigned char *SW_PIO = (unsigned char*)0x00000060;
	volatile unsigned char *KEY_PIO = (unsigned char*) 0x00000050;
	unsigned int c = 0;
	unsigned int flag = 0;
	*LED_PIO = 0; //clear all LEDs
	while ( (1+1) != 3) //infinite loop
	{
		if (*KEY_PIO == 2){
			c = 0;
		}
		if (*KEY_PIO == 1){
			flag = 1;
			c += *SW_PIO;
		}
		if (c > 255){
			c = c - 256;
		}
		*LED_PIO = c;
		while(flag){
			if (*KEY_PIO == 3){
				flag = 0;
			}
		}
	}
	return 1; //never gets here
}