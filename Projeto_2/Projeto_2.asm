
_incrementUntil9:

;Projeto_2.c,6 :: 		void incrementUntil9(unsigned char *n){
;Projeto_2.c,8 :: 		(*n) += 1;
	MOVFF       FARG_incrementUntil9_n+0, FSR0L+0
	MOVFF       FARG_incrementUntil9_n+1, FSR0H+0
	MOVFF       FARG_incrementUntil9_n+0, FSR1L+0
	MOVFF       FARG_incrementUntil9_n+1, FSR1H+0
	INCF        POSTINC1+0, 1 
;Projeto_2.c,11 :: 		if(*n >= 10){
	MOVFF       FARG_incrementUntil9_n+0, FSR0L+0
	MOVFF       FARG_incrementUntil9_n+1, FSR0H+0
	MOVLW       10
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_incrementUntil90
;Projeto_2.c,12 :: 		(*n) = 0;
	MOVFF       FARG_incrementUntil9_n+0, FSR1L+0
	MOVFF       FARG_incrementUntil9_n+1, FSR1H+0
	CLRF        POSTINC1+0 
;Projeto_2.c,13 :: 		}
L_incrementUntil90:
;Projeto_2.c,14 :: 		}
L_end_incrementUntil9:
	RETURN      0
; end of _incrementUntil9

_out7Seg:

;Projeto_2.c,16 :: 		void out7Seg(unsigned char n)
;Projeto_2.c,18 :: 		switch (n)
	GOTO        L_out7Seg1
;Projeto_2.c,20 :: 		case 0:{ latd = 0b00111111; break;}   // 0 no display de 7seg.
L_out7Seg3:
	MOVLW       63
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,21 :: 		case 1:{ latd = 0b00000110; break;}   // 1 no display de 7seg.
L_out7Seg4:
	MOVLW       6
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,22 :: 		case 2:{ latd = 0b01011011; break;}   // 2 no display de 7seg.
L_out7Seg5:
	MOVLW       91
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,23 :: 		case 3:{ latd = 0b01001111; break;}   // 3 no display de 7seg.
L_out7Seg6:
	MOVLW       79
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,24 :: 		case 4:{ latd = 0b01100110; break;}   // 4 no display de 7seg.
L_out7Seg7:
	MOVLW       102
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,25 :: 		case 5:{ latd = 0b01101101; break;}   // 5 no display de 7seg.
L_out7Seg8:
	MOVLW       109
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,26 :: 		case 6:{ latd = 0b01111101; break;}   // 6 no display de 7seg.
L_out7Seg9:
	MOVLW       125
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,27 :: 		case 7:{ latd = 0b00000111; break;}   // 7 no display de 7seg.
L_out7Seg10:
	MOVLW       7
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,28 :: 		case 8:{ latd = 0b01111111; break;}   // 8 no display de 7seg.
L_out7Seg11:
	MOVLW       127
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,29 :: 		case 9:{ latd = 0b01101111; break;}   // 9 no display de 7seg.
L_out7Seg12:
	MOVLW       111
	MOVWF       LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,30 :: 		default:{ latd = 0b00000000; break;} // entrada inválida, apagar display
L_out7Seg13:
	CLRF        LATD+0 
	GOTO        L_out7Seg2
;Projeto_2.c,31 :: 		}
L_out7Seg1:
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg3
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg4
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg5
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg6
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg7
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg8
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg9
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg10
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg11
	MOVF        FARG_out7Seg_n+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_out7Seg12
	GOTO        L_out7Seg13
L_out7Seg2:
;Projeto_2.c,33 :: 		}
L_end_out7Seg:
	RETURN      0
; end of _out7Seg

_INTERRUPCAO_HIGH:

;Projeto_2.c,35 :: 		void INTERRUPCAO_HIGH() iv 0x0008 ics ICS_AUTO {
;Projeto_2.c,44 :: 		if(INTCON.TMR0IF == 1)    //Foi o TIMER0 que gerou a interrupção ?
	BTFSS       INTCON+0, 2 
	GOTO        L_INTERRUPCAO_HIGH14
;Projeto_2.c,46 :: 		out7Seg(displayNum);
	MOVF        _displayNum+0, 0 
	MOVWF       FARG_out7Seg_n+0 
	CALL        _out7Seg+0, 0
;Projeto_2.c,47 :: 		incrementUntil9(&displayNum);
	MOVLW       _displayNum+0
	MOVWF       FARG_incrementUntil9_n+0 
	MOVLW       hi_addr(_displayNum+0)
	MOVWF       FARG_incrementUntil9_n+1 
	CALL        _incrementUntil9+0, 0
;Projeto_2.c,49 :: 		TMR0H = TMR0H_preset;
	MOVF        _TMR0H_preset+0, 0 
	MOVWF       TMR0H+0 
;Projeto_2.c,50 :: 		TMR0L = TMR0L_preset;
	MOVF        _TMR0L_preset+0, 0 
	MOVWF       TMR0L+0 
;Projeto_2.c,51 :: 		INTCON.TMR0IF = 0;   //Não esquecer de zerar a Flag
	BCF         INTCON+0, 2 
;Projeto_2.c,52 :: 		}
	GOTO        L_INTERRUPCAO_HIGH15
L_INTERRUPCAO_HIGH14:
;Projeto_2.c,54 :: 		else if(INTCON.INT0IF == 1){
	BTFSS       INTCON+0, 1 
	GOTO        L_INTERRUPCAO_HIGH16
;Projeto_2.c,55 :: 		T0CON.TMR0ON = 1;// Inicia timer, ligando o display
	BSF         T0CON+0, 7 
;Projeto_2.c,57 :: 		TMR0H_preset = 0x0B;
	MOVLW       11
	MOVWF       _TMR0H_preset+0 
;Projeto_2.c,58 :: 		TMR0L_preset = 0xDC;
	MOVLW       220
	MOVWF       _TMR0L_preset+0 
;Projeto_2.c,60 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;Projeto_2.c,61 :: 		}
	GOTO        L_INTERRUPCAO_HIGH17
L_INTERRUPCAO_HIGH16:
;Projeto_2.c,62 :: 		else if(INTCON3.INT1IF == 1){
	BTFSS       INTCON3+0, 0 
	GOTO        L_INTERRUPCAO_HIGH18
;Projeto_2.c,63 :: 		T0CON.TMR0ON = 1;// Inicia timer, ligando o display
	BSF         T0CON+0, 7 
;Projeto_2.c,65 :: 		TMR0H_preset = 0xC2;
	MOVLW       194
	MOVWF       _TMR0H_preset+0 
;Projeto_2.c,66 :: 		TMR0L_preset = 0xF7;
	MOVLW       247
	MOVWF       _TMR0L_preset+0 
;Projeto_2.c,68 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;Projeto_2.c,69 :: 		}
L_INTERRUPCAO_HIGH18:
L_INTERRUPCAO_HIGH17:
L_INTERRUPCAO_HIGH15:
;Projeto_2.c,70 :: 		}
L_end_INTERRUPCAO_HIGH:
L__INTERRUPCAO_HIGH24:
	RETFIE      1
; end of _INTERRUPCAO_HIGH

_configInterrupt:

;Projeto_2.c,72 :: 		void configInterrupt(){
;Projeto_2.c,75 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Projeto_2.c,77 :: 		INTCON.TMR0IE = 1;   //Habilita a interrupção individual do TIMER0
	BSF         INTCON+0, 5 
;Projeto_2.c,78 :: 		INTCON.INT0IE = 1; //Habilita a interrupção específica INT0
	BSF         INTCON+0, 4 
;Projeto_2.c,79 :: 		INTCON3.INT1IP = 1; // Interrupcão INT1 em alta prioridade
	BSF         INTCON3+0, 6 
;Projeto_2.c,80 :: 		INTCON3.INT1IE = 1; //Habilita a interrupção específica INT1
	BSF         INTCON3+0, 3 
;Projeto_2.c,82 :: 		INTCON2.INTEDG0 = 1; //Borda de descida
	BSF         INTCON2+0, 6 
;Projeto_2.c,83 :: 		INTCON2.INTEDG1 = 1; //Borda de descida
	BSF         INTCON2+0, 5 
;Projeto_2.c,84 :: 		}
L_end_configInterrupt:
	RETURN      0
; end of _configInterrupt

_configMCU:

;Projeto_2.c,86 :: 		void configMCU()
;Projeto_2.c,89 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Projeto_2.c,91 :: 		TRISD = 0;    // PORTD como saída  (usar LED)
	CLRF        TRISD+0 
;Projeto_2.c,92 :: 		PORTD = 0;    // LED inicialmente OFF
	CLRF        PORTD+0 
;Projeto_2.c,94 :: 		TRISA = 0X00;
	CLRF        TRISA+0 
;Projeto_2.c,95 :: 		PORTA = 0x0F;
	MOVLW       15
	MOVWF       PORTA+0 
;Projeto_2.c,97 :: 		TRISB = 0xFF; // PORTB como entradas
	MOVLW       255
	MOVWF       TRISB+0 
;Projeto_2.c,98 :: 		}
L_end_configMCU:
	RETURN      0
; end of _configMCU

_configTimer:

;Projeto_2.c,100 :: 		void configTimer(){
;Projeto_2.c,102 :: 		T0CON.TMR0ON = 0;// Timer0 On/Off Control bit:1=Enables Timer0 / 0=Stops Timer0
	BCF         T0CON+0, 7 
;Projeto_2.c,103 :: 		T0CON.T08BIT = 0;// Timer0 8-bit/16-bit Control bit: 1=8-bit timer/counter / 0=16-bit timer/counter
	BCF         T0CON+0, 6 
;Projeto_2.c,104 :: 		T0CON.T0CS   = 0;// TMR0 Clock Source Select bit: 0=Internal Clock (CLKO) / 1=Transition on T0CKI pin
	BCF         T0CON+0, 5 
;Projeto_2.c,105 :: 		T0CON.T0SE   = 0;// TMR0 Source Edge Select bit: 0=low/high / 1=high/low
	BCF         T0CON+0, 4 
;Projeto_2.c,106 :: 		T0CON.PSA    = 0;// Prescaler Assignment bit: 0=Prescaler is assigned; 1=NOT assigned/bypassed
	BCF         T0CON+0, 3 
;Projeto_2.c,107 :: 		T0CON.T0PS2  = 1;// bits 2-0  PS2:PS0: Prescaler Select bits
	BSF         T0CON+0, 2 
;Projeto_2.c,108 :: 		T0CON.T0PS1  = 0;
	BCF         T0CON+0, 1 
;Projeto_2.c,109 :: 		T0CON.T0PS0  = 0;
	BCF         T0CON+0, 0 
;Projeto_2.c,110 :: 		TMR0H = TMR0H_preset;    // preset for Timer0 MSB register
	MOVF        _TMR0H_preset+0, 0 
	MOVWF       TMR0H+0 
;Projeto_2.c,111 :: 		TMR0L = TMR0L_preset;    // preset for Timer0 LSB register
	MOVF        _TMR0L_preset+0, 0 
	MOVWF       TMR0L+0 
;Projeto_2.c,112 :: 		}
L_end_configTimer:
	RETURN      0
; end of _configTimer

_main:

;Projeto_2.c,114 :: 		void main() {
;Projeto_2.c,116 :: 		configMCU();
	CALL        _configMCU+0, 0
;Projeto_2.c,117 :: 		configTIMER();
	CALL        _configTimer+0, 0
;Projeto_2.c,118 :: 		configInterrupt();
	CALL        _configInterrupt+0, 0
;Projeto_2.c,121 :: 		while(1);
L_main19:
	GOTO        L_main19
;Projeto_2.c,122 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
