unsigned char TMR0H_preset = 0xFF;
unsigned char TMR0L_preset = 0x00;

unsigned char displayNum = 0;

void incrementUntil9(unsigned char *n){
  //Incrementar valor apontado por n
  (*n) += 1;

  // Caso acima de 9, retornar o valor para 0
  if(*n >= 10){
    (*n) = 0;
  }
}

void out7Seg(unsigned char n)
{
  switch (n)
  {      // acionamento do display de 7 segmentos do kit EasyPIC (PORTD)
    case 0:{ latd = 0b00111111; break;}   // 0 no display de 7seg.
    case 1:{ latd = 0b00000110; break;}   // 1 no display de 7seg.
    case 2:{ latd = 0b01011011; break;}   // 2 no display de 7seg.
    case 3:{ latd = 0b01001111; break;}   // 3 no display de 7seg.
    case 4:{ latd = 0b01100110; break;}   // 4 no display de 7seg.
    case 5:{ latd = 0b01101101; break;}   // 5 no display de 7seg.
    case 6:{ latd = 0b01111101; break;}   // 6 no display de 7seg.
    case 7:{ latd = 0b00000111; break;}   // 7 no display de 7seg.
    case 8:{ latd = 0b01111111; break;}   // 8 no display de 7seg.
    case 9:{ latd = 0b01101111; break;}   // 9 no display de 7seg.
    default:{ latd = 0b00000000; break;} // entrada inv�lida, apagar display
  }

}

void INTERRUPCAO_HIGH() iv 0x0008 ics ICS_AUTO {
  // vetor de tratamento da interrup��o (endere�o fixo 0x0008)
  // Definir em Tools > Interrupt Assistant
  // HIGH = interrup��o de alta prioridade
  // LOW = interrup��o de baixa prioridade (endere�o 0x0018)
  // ics = servi�o de acionamento/tratamento da interrup��o


  // tratamento - acionar LED
  if(INTCON.TMR0IF == 1)    //Foi o TIMER0 que gerou a interrup��o ?
  {
    out7Seg(displayNum);
    incrementUntil9(&displayNum);

    TMR0H = TMR0H_preset;
    TMR0L = TMR0L_preset;
    INTCON.TMR0IF = 0;   //N�o esquecer de zerar a Flag
  }

  else if(INTCON.INT0IF == 1){
    T0CON.TMR0ON = 1;// Inicia timer, ligando o display
    
    TMR0H_preset = 0x0B;
    TMR0L_preset = 0xDC;

    INTCON.INT0IF = 0;
  }
  else if(INTCON3.INT1IF == 1){
    T0CON.TMR0ON = 1;// Inicia timer, ligando o display
    
    TMR0H_preset = 0xC2;
    TMR0L_preset = 0xF7;

    INTCON3.INT1IF = 0;
  }
}

void configInterrupt(){
  //Configura��o Global das interrup��es GIE   - chave geral que sinaliza que o
  //programa usar� interrup��es
  INTCON.GIE = 1;

  INTCON.TMR0IE = 1;   //Habilita a interrup��o individual do TIMER0
  INTCON.INT0IE = 1; //Habilita a interrup��o espec�fica INT0
  INTCON3.INT1IP = 1; // Interrupc�o INT1 em alta prioridade
  INTCON3.INT1IE = 1; //Habilita a interrup��o espec�fica INT1

  INTCON2.INTEDG0 = 1; //Borda de subida
  INTCON2.INTEDG1 = 1; //Borda de subida
}

void configMCU()
{
  // Configurando os pinos como digitais
  ADCON1 |= 0x0F;
  // Config. das portas
  TRISD = 0;    // PORTD como sa�da  (usar LED)
  PORTD = 0;    // LED inicialmente OFF
  
  TRISA = 0X00; // PORTA como saida (ligar display)
  PORTA = 0x0F; // PORTA 0, 1, 2 e 3 ligados para ligar o display no kit EasyPic
  
  TRISB = 0xFF; // PORTB como entradas
}

void configTimer(){
  // Timer0 Registers:// 16-Bit Mode; Prescaler=1:32; TMRH Preset=B; TMRL Preset=DC; Freq=1,00Hz; Period=1,00 s
  T0CON.TMR0ON = 0;// Timer0 On/Off Control bit:1=Enables Timer0 / 0=Stops Timer0
  T0CON.T08BIT = 0;// Timer0 8-bit/16-bit Control bit: 1=8-bit timer/counter / 0=16-bit timer/counter
  T0CON.T0CS   = 0;// TMR0 Clock Source Select bit: 0=Internal Clock (CLKO) / 1=Transition on T0CKI pin
  T0CON.T0SE   = 0;// TMR0 Source Edge Select bit: 0=low/high / 1=high/low
  T0CON.PSA    = 0;// Prescaler Assignment bit: 0=Prescaler is assigned; 1=NOT assigned/bypassed
  T0CON.T0PS2  = 1;// bits 2-0  PS2:PS0: Prescaler Select bits
  T0CON.T0PS1  = 0;
  T0CON.T0PS0  = 0;
  TMR0H = TMR0H_preset;    // preset for Timer0 MSB register
  TMR0L = TMR0L_preset;    // preset for Timer0 LSB register
}

void main() {
  // Configura��o inicial do MCU
  configMCU();
  configTIMER();
  configInterrupt();
  
  // Pooling
  while(1);
}