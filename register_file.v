module register_file(PA, PB, PC, A, B, Dec, CLK, E);
  output [31:0] PA;     // Output A
  output [31:0] PB;     // Output B
  input [31:0]  PC;     // Input C
  input [4:0]   A; 	  // Mux A Address
  input [4:0]   B;      // Mux B Address
  input [4:0]   Dec;    // Decoder Address
  input   	    CLK;    // Clock.   
  input			E;
    
  wire [31:0]   Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31;
   
  wire   dr0, dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12, dr13, dr14, dr15, dr16, dr17, dr18, dr19, dr20, dr21, dr22, dr23, dr24, dr25, dr26, dr27, dr28, dr29, dr30, dr31;
    
    
  mux32_1 muxA(PA, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, A);
    
  mux32_1 muxB(PB, Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18, Q19, Q20, Q21, Q22, Q23, Q24, Q25, Q26, Q27, Q28, Q29, Q30, Q31, B);
    
  decoder dcdr(dr0, dr1, dr2, dr3, dr4, dr5, dr6, dr7, dr8, dr9, dr10, dr11, dr12, dr13, dr14, dr15, dr16, dr17, dr18, dr19, dr20, dr21, dr22, dr23, dr24, dr25, dr26, dr27, dr28, dr29, dr30, dr31, Dec[4], Dec[3], Dec[2], Dec[1], Dec[0], E); 
    
  register r0(Q0, PC, 0, CLK);    
  register r1(Q1, PC, dr1, CLK);     
  register r2(Q2, PC, dr2, CLK);    
  register r3(Q3, PC, dr3, CLK);     
  register r4(Q4, PC, dr4, CLK);    
  register r5(Q5, PC, dr5, CLK);     
  register r6(Q6, PC, dr6, CLK);    
  register r7(Q7, PC, dr7, CLK);
  register r8(Q8, PC, dr8, CLK);    
  register r9(Q9, PC, dr9, CLK);     
  register r10(Q10, PC, dr10, CLK);    
  register r11(Q11, PC, dr11, CLK);     
  register r12(Q12, PC, dr12, CLK);    
  register r13(Q13, PC, dr13, CLK);     
  register r14(Q14, PC, dr14, CLK);    
  register r15(Q15, PC, dr15, CLK);
  register r16(Q16, PC, dr16, CLK);    
  register r17(Q17, PC, dr17, CLK);     
  register r18(Q18, PC, dr18, CLK);    
  register r19(Q19, PC, dr19, CLK);     
  register r20(Q20, PC, dr20, CLK);    
  register r21(Q21, PC, dr21, CLK);     
  register r22(Q22, PC, dr22, CLK);    
  register r23(Q23, PC, dr23, CLK);
  register r24(Q24, PC, dr24, CLK);    
  register r25(Q25, PC, dr25, CLK);     
  register r26(Q26, PC, dr26, CLK);    
  register r27(Q27, PC, dr27, CLK);     
  register r28(Q28, PC, dr28, CLK);    
  register r29(Q29, PC, dr29, CLK);     
  register r30(Q30, PC, dr30, CLK);    
  register r31(Q31, PC, dr31, CLK);
endmodule // register_file 

module decoder(E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20, E21, E22, E23, E24, E25, E26, E27, E28, E29, E30, E31, A4, A3, A2, A1, A0, E);
  output E0;  // Output to r0
  output E1;  // Output to r1 
  output E2;  // Output to r2
  output E3;  // Output to r3
  output E4;  // Output to r4
  output E5;  // Output to r5
  output E6;  // Output to r6 
  output E7;  // Output to r7
  output E8;  // Output to r8
  output E9;  // Output to r9 
  output E10; // Output to r10
  output E11; // Output to r11
  output E12; // Output to r12
  output E13; // Output to r13
  output E14; // Output to r14 
  output E15; // Output to r15
  output E16; // Output to r16
  output E17; // Output to r17
  output E18; // Output to r18
  output E19; // Output to r19
  output E20; // Output to r20
  output E21; // Output to r21
  output E22; // Output to r22
  output E23; // Output to r23
  output E24; // Output to r24
  output E25; // Output to r25
  output E26; // Output to r26
  output E27; // Output to r27
  output E28; // Output to r28
  output E29; // Output to r29
  output E30; // Output to r30
  output E31; // Output to r31
    
  input  A4;  // BCD input most significant bit
  input  A3;
  input  A2;  // BCD input  middle bit
  input  A1;  
  input  A0;  // BCD input least significant bit 
    
  input  E;   // Enable
    
  // Negation of inputs
  wire   A4n; 
  wire   A3n;
  wire   A2n; 
  wire   A1n; 
  wire   A0n;
  
  not(A4n, A4);
  not(A3n, A3);
  not(A2n, A2);
  not(A1n, A1);
  not(A0n, A0);
    
  and(E0, E, A4n, A3n, A2n, A1n, A0n);  // 0: 00000
  and(E1, E, A4n, A3n, A2n, A1n, A0);   // 1: 00001
  and(E2, E, A4n, A3n, A2n, A1, A0n);   // 2: 00010
  and(E3, E, A4n, A3n, A2n, A1, A0);    // 3: 00011
  and(E4, E, A4n, A3n, A2, A1n, A0n);   // 4: 00100
  and(E5, E, A4n, A3n, A2, A1n, A0);    // 5: 00101
  and(E6, E, A4n, A3n, A2, A1, A0n);    // 6: 00110
  and(E7, E, A4n, A3n, A2, A1, A0);     // 7: 00111
  and(E8, E, A4n, A3, A2n, A1n, A0n);   // 8: 01000
  and(E9, E, A4n, A3, A2n, A1n, A0);    // 9: 01001
  and(E10, E, A4n, A3, A2n, A1, A0n);    // 10: 01010
  and(E11, E, A4n, A3, A2n, A1, A0);     // 11: 01011
  and(E12, E, A4n, A3, A2, A1n, A0n);    // 12: 01100
  and(E13, E, A4n, A3, A2, A1n, A0);     // 13: 01101
  and(E14, E, A4n, A3, A2, A1, A0n);     // 14: 01110
  and(E15, E, A4n, A3, A2, A1, A0);      // 15: 01111
  and(E16, E, A4, A3n, A2n, A1n, A0n);   // 16: 10000
  and(E17, E, A4, A3n, A2n, A1n, A0);    // 17: 10001
  and(E18, E, A4, A3n, A2n, A1, A0n);    // 18: 10010
  and(E19, E, A4, A3n, A2n, A1, A0);     // 19: 10011
  and(E20, E, A4, A3n, A2, A1n, A0n);    // 20: 10100
  and(E21, E, A4, A3n, A2, A1n, A0);     // 21: 10101
  and(E22, E, A4, A3n, A2, A1, A0n);     // 22: 10110
  and(E23, E, A4, A3n, A2, A1, A0);      // 23: 10111
  and(E24, E, A4, A3, A2n, A1n, A0n);    // 24: 11000
  and(E25, E, A4, A3, A2n, A1n, A0);     // 25: 11001
  and(E26, E, A4, A3, A2n, A1, A0n);     // 26: 11010
  and(E27, E, A4, A3, A2n, A1, A0);      // 27: 11011
  and(E28, E, A4, A3, A2, A1n, A0n);     // 28: 11100
  and(E29, E, A4, A3, A2, A1n, A0);      // 29: 11101
  and(E30, E, A4, A3, A2, A1, A0n);      // 30: 11110
  and(E31, E, A4, A3, A2, A1, A0);       // 31: 11111
  
endmodule // octal_decoder   

module register(Qs, Ds, Ld, CLK);
  output reg [31:0] Qs;
  input [31:0]  Ds;
  input   Ld;
  input   CLK;
  
  initial begin
  	Qs= 32'd0;
  end
  
  always @(Qs, Ld, CLK)
    if(Ld && CLK)
      Qs<=Ds;
  
endmodule //Register
  

module mux32_1(Out, I00, I01, I02, I03, I04, I05, I06, I07, I08, I09, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31, Select);  
  output reg [31:0] Out;   // Output 
    
  input [31:0]  I31;  
  input [31:0]  I30;  
  input [31:0]  I29;  
  input [31:0]  I28;  
  input [31:0]  I27;  
  input [31:0]  I26;  
  input [31:0]  I25;   
  input [31:0]  I24;
  input [31:0]  I23;  
  input [31:0]  I22;  
  input [31:0]  I21;  
  input [31:0]  I20;  
  input [31:0]  I19;  
  input [31:0]  I18;  
  input [31:0]  I17;   
  input [31:0]  I16;
  input [31:0]  I15;  
  input [31:0]  I14;  
  input [31:0]  I13;  
  input [31:0]  I12;  
  input [31:0]  I11;  
  input [31:0]  I10;  
  input [31:0]  I09;   
  input [31:0]  I08;
  input [31:0]  I07;  
  input [31:0]  I06;  
  input [31:0]  I05;  
  input [31:0]  I04;  
  input [31:0]  I03;  
  input [31:0]  I02;  
  input [31:0]  I01;   
  input [31:0]  I00;
  
  input [4:0]   Select; 
    
  always @(Select, I00, I01, I02, I03, I04, I05, I06, I07, I08, I09, I10, I11, I12, I13, I14, I15, I16, I17, I18, I19, I20, I21, I22, I23, I24, I25, I26, I27, I28, I29, I30, I31)
    begin
      case({Select[4], Select[3], Select[2], Select[1], Select[0]})
        0 : Out=I00;
        1 : Out=I01;
        2 : Out=I02;
        3 : Out=I03;
        4 : Out=I04;
        5 : Out=I05;
        6 : Out=I06;
        7 : Out=I07;
        8 : Out=I08;
        9 : Out=I09;
        10 : Out=I10;
        11 : Out=I11;
        12 : Out=I12;
        13 : Out=I13;
        14 : Out=I14;
        15 : Out=I15;
        16 : Out=I16;
        17 : Out=I17;
        18 : Out=I18;
        19 : Out=I19;
        20 : Out=I20;
        21 : Out=I21;
        22 : Out=I22;
        23 : Out=I23;
        24 : Out=I24;
        25 : Out=I25;
        26 : Out=I26;
        27 : Out=I27;
        28 : Out=I28;
        29 : Out=I29;
        30 : Out=I30;
        31 : Out=I31;
       default Out=1'bx;
      endcase
    end 
endmodule // 32_1_mux 
 