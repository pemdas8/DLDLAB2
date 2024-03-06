/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module GenerateKeys (Key, SubKey1, SubKey2, SubKey3, SubKey4,
		     SubKey5, SubKey6, SubKey7, SubKey8,
		     SubKey9, SubKey10, SubKey11, SubKey12,
		     SubKey13, SubKey14, SubKey15, SubKey16);
   
   // Generate SubKeys
   input logic [63:0]  Key;
   output logic [47:0] SubKey1;
   output logic [47:0] SubKey2;
   output logic [47:0] SubKey3;
   output logic [47:0] SubKey4;
   output logic [47:0] SubKey5;
   output logic [47:0] SubKey6;
   output logic [47:0] SubKey7;
   output logic [47:0] SubKey8;
   output logic [47:0] SubKey9;
   output logic [47:0] SubKey10;
   output logic [47:0] SubKey11;
   output logic [47:0] SubKey12;
   output logic [47:0] SubKey13;
   output logic [47:0] SubKey14;
   output logic [47:0] SubKey15;
   output logic [47:0] SubKey16;

   logic [27:0]left_block, [27:0]right_block;
   logic [27:0] A1,B1;
   logic [27:0] A2,B2;
   logic [27:0] A3,B3;
   logic [27:0] A4,B4;
   logic [27:0] A5,B5;
   logic [27:0] A6,B6;
   logic [27:0]	A7,B7;
   logic [27:0] A8,B8;
   logic [27:0] A9,B9;
   logic [27:0] A10,B10;
   logic [27:0] A11,B11;
   logic [27:0] A12,B12;
   logic [27:0] A13,B13;
   logic [27:0]	A14,B14;
   logic [27:0]	A15,B15;
   logic [27:0]	A16,B16;

   PC1 pc1round(key,left_block,right_block);
   
   assign A1 = {left_block[26:0], left_block[27]};
   assign B1 = {right_block[26:0], right_block[27]};

   PC2 round1(A1,B1,SubKey1);

   assign A2 = {A1[26:0], A1[27]};
   assign B2 = {B1[26:0], B1[27]};

   PC2 round2(A2,B2,SubKey2);

   assign A3 = {A2[25:0], A2[27:26]};
   assign B3 = {B2[25:0], B2[27:26]};

   PC2 round3(A3,B3,SubKey3);

   assign A4 = {A3[25:0], A3[27:26]};
   assign B4 = {B3[25:0], B3[27:26]};

   PC2 round4(A4,B4,SubKey4);

   assign A5 = {A4[25:0], A4[27:26]};
   assign B5 = {B4[25:0], B4[27:26]};

   PC2 round5(A5,B5,SubKey5);

   assign A6 = {A5[25:0], A5[27:26]};
   assign B6 = {B5[25:0], B5[27:26]};

   PC2 round6(A6,B6,Subkey6);

   assign A7 = {A6[25:0], A6[27:26]};
   assign B7 = {B6[25:0], B6[27:26]};

   PC2 round7(A7,B7,Subkey7);

   assign A8 = {A7[25:0], A7[27:26]};
   assign B8 = {B7[25:0], B7[27:26]};

   PC2 round8(A8,B8,Subkey8);
   
   assign A9 = {A8[26:0], A8[27]};
   assign B9 = {B8[26:0], B8[27]};

   PC2 round8(A9,B9,Subkey9);

   assign A10 = {A9[25:0], A8[27:26]};
   assign B10 = {B9[25:0], B8[27:26]};

   PC2 round9(A10,B10,Subkey10);

   assign A11 = {A10[25:0], A10[27:26]};
   assign B11 = {B10[25:0], B10[27:26]};

   PC2 round10(A11,B11,Subkey11);

   assign A12 = {A11[25:0], A11[27:26]};
   assign B12 = {B11[25:0], B11[27:26]};

   PC2 round11(A12,B12,Subkey12);

   assign A13 = {A12[25:0], A12[27:26]};
   assign B13 = {B12[25:0], B12[27:26]};

   PC2 round12(A13,B13,Subkey13);

   assign A14 = {A13[25:0], A13[27:26]};
   assign B14 = {B13[25:0], B13[27:26]};

   PC2 round13(A14,B14,Subkey14);

   assign A15 = {A14[25:0], A14[27:26]};
   assign B15 = {B14[25:0], B14[27:26]};

   PC2 round14(A15,B15,Subkey15);

   assign A16 = {A15[26:0], A15[27]};
   assign B16 = {B15[26:0], B15[27]};



endmodule // GenerateKeys

module PC1 (key, left_block, right_block);

   input logic [63:0]  key;
   output logic [27:0] left_block;
   output logic [27:0] right_block;

   //Left Block
   assign left_block[27]=key[64-57];
   assign left_block[26]=key[64-49];
   assign left_block[25]=key[64-41];
   assign left_block[24]=key[64-33];
   assign left_block[23]=key[64-25];
   assign left_block[22]=key[64-17];
   assign left_block[21]=key[64-9];
   assign left_block[20]=key[64-1];
   assign left_block[19]=key[64-58];
   assign left_block[18]=key[64-50];
   assign left_block[17]=key[64-42];
   assign left_block[16]=key[64-34];
   assign left_block[15]=key[64-26];
   assign left_block[14]=key[64-18];
   assign left_block[13]=key[64-10];
   assign left_block[12]=key[64-2];
   assign left_block[11]=key[64-59];
   assign left_block[10]=key[64-51];
   assign left_block[9]=key[64-43];
   assign left_block[8]=key[64-35];
   assign left_block[7]=key[64-27];
   assign left_block[6]=key[64-19];
   assign left_block[5]=key[64-11];
   assign left_block[4]=key[64-3];
   assign left_block[3]=key[64-60];
   assign left_block[2]=key[64-52];
   assign left_block[1]=key[64-44];
   assign left_block[0]=key[64-36];
   
   //Right Block
   assign right_block[27]=key[64-63];
   assign right_block[26]=key[64-55];
   assign right_block[25]=key[64-47];
   assign right_block[24]=key[64-39];
   assign right_block[23]=key[64-31];
   assign right_block[22]=key[64-23];
   assign right_block[21]=key[64-15];
   assign right_block[20]=key[64-7];
   assign right_block[19]=key[64-62];
   assign right_block[18]=key[64-54];
   assign right_block[17]=key[64-46];
   assign right_block[16]=key[64-38];
   assign right_block[15]=key[64-30];
   assign right_block[14]=key[64-22];
   assign right_block[13]=key[64-14];
   assign right_block[12]=key[64-6];
   assign right_block[11]=key[64-61];
   assign right_block[10]=key[64-53];
   assign right_block[9]=key[64-45];
   assign right_block[8]=key[64-37];
   assign right_block[7]=key[64-29];
   assign right_block[6]=key[64-21];
   assign right_block[5]=key[64-13];
   assign right_block[4]=key[64-5];
   assign right_block[3]=key[64-28];
   assign right_block[2]=key[64-20];
   assign right_block[1]=key[64-12];
   assign right_block[0]=key[64-4];   

endmodule // PC1

module PC2 (left_block, right_block, subkey);

   input logic [27:0] left_block;
   input logic [27:0] right_block;
   output logic [47:0] subkey;

   logic[55:0] pc2_in;
   assign pc2_in = {left_block,right_block};

   assign subkey[48]=pc2_in[55-14];  //fill in each subkey with specified bit
   assign subkey=pc2_in[55-17];
   assign subkey=pc2_in[55-11];
   assign subkey=pc2_in[55-24];
   assign subkey=pc2_in[55-1];
   assign subkey=pc2_in[55-5];
   assign subkey=pc2_in[55-3];
   assign subkey=pc2_in[55-28];
   assign subkey=pc2_in[55-15];
   assign subkey=pc2_in[55-6];
   assign subkey=pc2_in[55-21];
   assign subkey=pc2_in[55-10];
   assign subkey=pc2_in[55-23];
   assign subkey=pc2_in[55-19];
   assign subkey=pc2_in[55-12];
   assign subkey=pc2_in[55-4];
   assign subkey=pc2_in[55-26];
   assign subkey=pc2_in[55-8];
   assign subkey=pc2_in[55-16];
   assign subkey=pc2_in[55-7];
   assign subkey=pc2_in[55-27];
   assign subkey=pc2_in[55-20];
   assign subkey=pc2_in[55-13];
   assign subkey=pc2_in[55-2];
   assign subkey=pc2_in[55-41];
   assign subkey=pc2_in[55-52];
   assign subkey=pc2_in[55-31];
   assign subkey=pc2_in[55-37];
   assign subkey=pc2_in[55-47];
   assign subkey=pc2_in[55-55];
   assign subkey=pc2_in[55-30];
   assign subkey=pc2_in[55-40];
   assign subkey=pc2_in[55-51];
   assign subkey=pc2_in[55-45];
   assign subkey=pc2_in[55-33];
   assign subkey=pc2_in[55-33];
   assign subkey=pc2_in[55-48];
   assign subkey=pc2_in[55-44];
   assign subkey=pc2_in[55-49];
   assign subkey=pc2_in[55-39];
   assign subkey=pc2_in[55-56];
   assign subkey=pc2_in[55-34];
   assign subkey=pc2_in[55-53];
   assign subkey=pc2_in[55-46];
   assign subkey=pc2_in[55-42];
   assign subkey=pc2_in[55-50];
   assign subkey=pc2_in[55-36];
   assign subkey=pc2_in[55-29];
   assign subkey=pc2_in[55-32];



endmodule // PC2

// Straight Function
module SF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [31:0] out_block;

   logic [31:0]sf_in;
   feistel sf1(inp_block, sf_in);

   assign out_block=sf_in[32-16];  //fill out out_block with specified bit to each assignment
   assign out_block=sf_in[32-7];
   assign out_block=sf_in[32-20];
   assign out_block=sf_in[32-21];
   assign out_block=sf_in[32-29];
   assign out_block=sf_in[32-12];
   assign out_block=sf_in[32-28];
   assign out_block=sf_in[32-17];
   assign out_block=sf_in[32-1];
   assign out_block=sf_in[32-15];
   assign out_block=sf_in[32-23];
   assign out_block=sf_in[32-26];
   assign out_block=sf_in[32-5];
   assign out_block=sf_in[32-18];
   assign out_block=sf_in[32-31];
   assign out_block=sf_in[32-10];
   assign out_block=sf_in[32-2];
   assign out_block=sf_in[32-8];
   assign out_block=sf_in[32-24];
   assign out_block=sf_in[32-14];
   assign out_block=sf_in[32-32];
   assign out_block=sf_in[32-27];
   assign out_block=sf_in[32-3];
   assign out_block=sf_in[32-9];
   assign out_block=sf_in[32-19];
   assign out_block=sf_in[32-13];
   assign out_block=sf_in[32-30];
   assign out_block=sf_in[32-6];
   assign out_block=sf_in[32-22];
   assign out_block=sf_in[32-11];
   assign out_block=sf_in[32-4];
   assign out_block=sf_in[32-25];

endmodule // SF

// Expansion Function
module EF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [47:0] out_block;

   assign out_block = inp_block[32-32];
   assign out_block = inp_block[32-1];
   assign out_block = inp_block[32-2];
   assign out_block = inp_block[32-3];
   assign out_block = inp_block[32-4];
   assign out_block = inp_block[32-5];
   assign out_block = inp_block[32-4];
   assign out_block = inp_block[32-5];
   assign out_block = inp_block[32-6];
   assign out_block = inp_block[32-7];
   assign out_block = inp_block[32-8];
   assign out_block = inp_block[32-9];
   assign out_block = inp_block[32-8];
   assign out_block = inp_block[32-9];
   assign out_block = inp_block[32-10];
   assign out_block = inp_block[32-11];
   assign out_block = inp_block[32-12];
   assign out_block = inp_block[32-13];
   assign out_block = inp_block[32-12];
   assign out_block = inp_block[32-13];
   assign out_block = inp_block[32-14];
   assign out_block = inp_block[32-15];
   assign out_block = inp_block[32-16];
   assign out_block = inp_block[32-17];
   assign out_block = inp_block[32-16];
   assign out_block = inp_block[32-17];
   assign out_block = inp_block[32-18];
   assign out_block = inp_block[32-19];
   assign out_block = inp_block[32-20];
   assign out_block = inp_block[32-21];
   assign out_block = inp_block[32-20];
   assign out_block = inp_block[32-21];
   assign out_block = inp_block[32-22];
   assign out_block = inp_block[32-23];
   assign out_block = inp_block[32-24];
   assign out_block = inp_block[32-25];
   assign out_block = inp_block[32-24];
   assign out_block = inp_block[32-25];
   assign out_block = inp_block[32-26];
   assign out_block = inp_block[32-27];
   assign out_block = inp_block[32-28];
   assign out_block = inp_block[32-29];
   assign out_block = inp_block[32-28];
   assign out_block = inp_block[32-29];
   assign out_block = inp_block[32-30];
   assign out_block = inp_block[32-31];
   assign out_block = inp_block[32-32];
   assign out_block = inp_block[32-1];

endmodule // EF

module feistel (inp_block, subkey, out_block);

   input logic [31:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [31:0] out_block;

   logic [47:0]exp_out;
   logic [47:0]XOR1;
   logic [31:0]s_out;

   EF exp1(inp_block, exp_out);
   assign XOR1 = exp_out ^ subkey;

   S1_Box sbox1(XOR1[47:42], s_out[31:28]);
   S2_Box sbox2(XOR1[41:36], s_out[27:24]);
   S3_Box sbox3(XOR1[35:30], s_out[23:20]);
   S4_Box sbox4(XOR1[29:24], s_out[19:16]);
   S5_Box sbox5(XOR1[23:18], s_out[15:12]);
   S6_Box sbox6(XOR1[17:12], s_out[11:8]);
   S7_Box sbox7(XOR1[11:6], s_out[7:4]);
   S8_Box sbox8(XOR1[5:0], s_out[3:0]);

   SF sf1(s_out, out_block);

endmodule // Feistel

// DES block round
module round (inp_block, subkey, out_block);

   input logic [63:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [63:0] out_block;

   logic [31:0]left_block;
   logic [31:0]right_block;
   logic [63:0]XOR2;
   logic [31:0]feistel_out;

   assign left_block = inp_block[63:32];
   assign right_block = inp_block[31:0];

   assign out_block[63:32]= right_block;
   feistel round_in(right_block, subkey, feistel_out);
   assign XOR2 = left_block ^ feistel_out;
   assign out_block[31:0]= XOR2;

   PC2 pc2_in1(XOR2, out_block);

endmodule // round1

// Initial Permutation
module IP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-58];
   assign out_block[62] = inp_block[64-50];
   assign out_block[61] = inp_block[64-42];
   assign out_block[60] = inp_block[64-34];
   assign out_block[59] = inp_block[64-26];
   assign out_block[58] = inp_block[64-18];
   assign out_block[57] = inp_block[64-10];
   assign out_block[56] = inp_block[64-2];
   assign out_block[55] = inp_block[64-60];
   assign out_block[54] = inp_block[64-52];   
   assign out_block[53] = inp_block[64-44];   
   assign out_block[52] = inp_block[64-36];
   assign out_block[51] = inp_block[64-28];
   assign out_block[50] = inp_block[64-20];
   assign out_block[49] = inp_block[64-12];
   assign out_block[48] = inp_block[64-4];
   assign out_block[47] = inp_block[64-62];
   assign out_block[46] = inp_block[64-54];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-38];   
   assign out_block[43] = inp_block[64-30];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-14];
   assign out_block[40] = inp_block[64-6];
   assign out_block[39] = inp_block[64-64];
   assign out_block[38] = inp_block[64-56];
   assign out_block[37] = inp_block[64-48];
   assign out_block[36] = inp_block[64-40];
   assign out_block[35] = inp_block[64-32];
   assign out_block[34] = inp_block[64-24];   
   assign out_block[33] = inp_block[64-16];
   assign out_block[32] = inp_block[64-8];   
   assign out_block[31] = inp_block[64-57];
   assign out_block[30] = inp_block[64-49];
   assign out_block[29] = inp_block[64-41];
   assign out_block[28] = inp_block[64-33];
   assign out_block[27] = inp_block[64-25];
   assign out_block[26] = inp_block[64-17];
   assign out_block[25] = inp_block[64-9];   
   assign out_block[24] = inp_block[64-1];   
   assign out_block[23] = inp_block[64-59];
   assign out_block[22] = inp_block[64-51];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-35];
   assign out_block[19] = inp_block[64-27];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-11];
   assign out_block[16] = inp_block[64-3];
   assign out_block[15] = inp_block[64-61];
   assign out_block[14] = inp_block[64-53];   
   assign out_block[13] = inp_block[64-45];
   assign out_block[12] = inp_block[64-37];   
   assign out_block[11] = inp_block[64-29];
   assign out_block[10] = inp_block[64-21];
   assign out_block[9] = inp_block[64-13];
   assign out_block[8] = inp_block[64-5];
   assign out_block[7] = inp_block[64-63];
   assign out_block[6] = inp_block[64-55];
   assign out_block[5] = inp_block[64-47];
   assign out_block[4] = inp_block[64-39];   
   assign out_block[3] = inp_block[64-31];
   assign out_block[2] = inp_block[64-23];    
   assign out_block[1] = inp_block[64-15];
   assign out_block[0] = inp_block[64-7];   

endmodule // IP

// Final Permutation
module FP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-40];
   assign out_block[62] = inp_block[64-8];
   assign out_block[61] = inp_block[64-48];
   assign out_block[60] = inp_block[64-16];
   assign out_block[59] = inp_block[64-56];
   assign out_block[58] = inp_block[64-24];
   assign out_block[57] = inp_block[64-64];
   assign out_block[56] = inp_block[64-32];   
   assign out_block[55] = inp_block[64-39];
   assign out_block[54] = inp_block[64-7];   
   assign out_block[53] = inp_block[64-47];   
   assign out_block[52] = inp_block[64-15];
   assign out_block[51] = inp_block[64-55];
   assign out_block[50] = inp_block[64-23];
   assign out_block[49] = inp_block[64-63];
   assign out_block[48] = inp_block[64-31];   
   assign out_block[47] = inp_block[64-38];
   assign out_block[46] = inp_block[64-6];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-14];   
   assign out_block[43] = inp_block[64-54];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-62];
   assign out_block[40] = inp_block[64-30];   
   assign out_block[39] = inp_block[64-37];
   assign out_block[38] = inp_block[64-5];
   assign out_block[37] = inp_block[64-45];
   assign out_block[36] = inp_block[64-13];
   assign out_block[35] = inp_block[64-53];
   assign out_block[34] = inp_block[64-21];   
   assign out_block[33] = inp_block[64-61];
   assign out_block[32] = inp_block[64-29];   
   assign out_block[31] = inp_block[64-36];
   assign out_block[30] = inp_block[64-4];
   assign out_block[29] = inp_block[64-44];
   assign out_block[28] = inp_block[64-12];
   assign out_block[27] = inp_block[64-52];
   assign out_block[26] = inp_block[64-20];
   assign out_block[25] = inp_block[64-60];   
   assign out_block[24] = inp_block[64-28];   
   assign out_block[23] = inp_block[64-35];
   assign out_block[22] = inp_block[64-3];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-11];
   assign out_block[19] = inp_block[64-51];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-59];
   assign out_block[16] = inp_block[64-27];   
   assign out_block[15] = inp_block[64-34];
   assign out_block[14] = inp_block[64-2];   
   assign out_block[13] = inp_block[64-42];
   assign out_block[12] = inp_block[64-10];   
   assign out_block[11] = inp_block[64-50];
   assign out_block[10] = inp_block[64-18];
   assign out_block[9] = inp_block[64-58];
   assign out_block[8] = inp_block[64-26];   
   assign out_block[7] = inp_block[64-33];
   assign out_block[6] = inp_block[64-1];
   assign out_block[5] = inp_block[64-41];   
   assign out_block[4] = inp_block[64-9];
   assign out_block[3] = inp_block[64-49];    
   assign out_block[2] = inp_block[64-17];
   assign out_block[1] = inp_block[64-57];
   assign out_block[0] = inp_block[64-25];  

endmodule // FP

module S1_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd14;             
	  6'd1  : out_bits = 4'd4;             
	  6'd2  : out_bits = 4'd13;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd2;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd10;             
	  6'd10 : out_bits = 4'd6;             
	  6'd11 : out_bits = 4'd12;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd9;             
	  6'd14 : out_bits = 4'd0;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd0;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd7;             
	  6'd19 : out_bits = 4'd4;             
	  6'd20 : out_bits = 4'd14;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd10;             
	  6'd25 : out_bits = 4'd6;             
	  6'd26 : out_bits = 4'd12;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd9;             
	  6'd29 : out_bits = 4'd5;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd1;             
	  6'd34 : out_bits = 4'd14;             
	  6'd35 : out_bits = 4'd8;             
	  6'd36 : out_bits = 4'd13;             
	  6'd37 : out_bits = 4'd6;             
	  6'd38 : out_bits = 4'd2;             
	  6'd39 : out_bits = 4'd11;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd12;             
	  6'd42 : out_bits = 4'd9;             
	  6'd43 : out_bits = 4'd7;             
	  6'd44 : out_bits = 4'd3;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd0;             
	  6'd48 : out_bits = 4'd15;             
	  6'd49 : out_bits = 4'd12;             
	  6'd50 : out_bits = 4'd8;             
	  6'd51 : out_bits = 4'd2;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd1;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd5;        
	  6'd57 : out_bits = 4'd11;        
	  6'd58 : out_bits = 4'd3;       
	  6'd59 : out_bits = 4'd14;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd13;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S1_Box

module S2_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})             
	  6'd0  : out_bits = 4'd15;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd11;             
	  6'd6  : out_bits = 4'd3;             
	  6'd7  : out_bits = 4'd4;             
	  6'd8  : out_bits = 4'd9;             
	  6'd9  : out_bits = 4'd7;             
	  6'd10 : out_bits = 4'd2;             
	  6'd11 : out_bits = 4'd13;             
	  6'd12 : out_bits = 4'd12;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd10;             
	  6'd16 : out_bits = 4'd3;             
	  6'd17 : out_bits = 4'd13;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd15;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd8;             
	  6'd23 : out_bits = 4'd14;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd1;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd6;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd11;             
	  6'd31 : out_bits = 4'd5;             
	  6'd32 : out_bits = 4'd0;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd7;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd4;             
	  6'd38 : out_bits = 4'd13;             
	  6'd39 : out_bits = 4'd1;             
	  6'd40 : out_bits = 4'd5;             
	  6'd41 : out_bits = 4'd8;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd6;             
	  6'd44 : out_bits = 4'd9;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd2;             
	  6'd47 : out_bits = 4'd15;             
	  6'd48 : out_bits = 4'd13;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd10;             
	  6'd51 : out_bits = 4'd1;             
	  6'd52 : out_bits = 4'd3;             
	  6'd53 : out_bits = 4'd15;            
	  6'd54 : out_bits = 4'd4;             
	  6'd55 : out_bits = 4'd2;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd6;        
	  6'd58 : out_bits = 4'd7;       
	  6'd59 : out_bits = 4'd12;       
	  6'd60 : out_bits = 4'd0;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd14;      
	  6'd63 : out_bits = 4'd9;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S2_Box

module S3_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd10;             
	  6'd1  : out_bits = 4'd0;             
	  6'd2  : out_bits = 4'd9;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd3;             
	  6'd6  : out_bits = 4'd15;             
	  6'd7  : out_bits = 4'd5;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd12;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd4;             
	  6'd14 : out_bits = 4'd2;             
	  6'd15 : out_bits = 4'd8;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd7;             
	  6'd18 : out_bits = 4'd0;             
	  6'd19 : out_bits = 4'd9;             
	  6'd20 : out_bits = 4'd3;             
	  6'd21 : out_bits = 4'd4;             
	  6'd22 : out_bits = 4'd6;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd2;             
	  6'd25 : out_bits = 4'd8;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd12;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd15;             
	  6'd31 : out_bits = 4'd1;             
	  6'd32 : out_bits = 4'd13;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd9;             
	  6'd36 : out_bits = 4'd8;             
	  6'd37 : out_bits = 4'd15;             
	  6'd38 : out_bits = 4'd3;             
	  6'd39 : out_bits = 4'd0;             
	  6'd40 : out_bits = 4'd11;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd2;             
	  6'd43 : out_bits = 4'd12;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd14;             
	  6'd47 : out_bits = 4'd7;             
	  6'd48 : out_bits = 4'd1;             
	  6'd49 : out_bits = 4'd10;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd0;             
	  6'd52 : out_bits = 4'd6;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd4;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd14;       
	  6'd59 : out_bits = 4'd3;       
	  6'd60 : out_bits = 4'd11;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd12;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S3_Box

module S4_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd7;             
	  6'd1  : out_bits = 4'd13;             
	  6'd2  : out_bits = 4'd14;            
	  6'd3  : out_bits = 4'd3;             
	  6'd4  : out_bits = 4'd0;             
	  6'd5  : out_bits = 4'd6;             
	  6'd6  : out_bits = 4'd9;             
	  6'd7  : out_bits = 4'd10;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd2;             
	  6'd10 : out_bits = 4'd8;             
	  6'd11 : out_bits = 4'd5;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd12;             
	  6'd14 : out_bits = 4'd4;             
	  6'd15 : out_bits = 4'd15;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd8;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd5;             
	  6'd20 : out_bits = 4'd6;             
	  6'd21 : out_bits = 4'd15;             
	  6'd22 : out_bits = 4'd0;             
	  6'd23 : out_bits = 4'd3;             
	  6'd24 : out_bits = 4'd4;             
	  6'd25 : out_bits = 4'd7;             
	  6'd26 : out_bits = 4'd2;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd1;             
	  6'd29 : out_bits = 4'd10;             
	  6'd30 : out_bits = 4'd14;             
	  6'd31 : out_bits = 4'd9;             
	  6'd32 : out_bits = 4'd10;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd9;             
	  6'd35 : out_bits = 4'd0;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd11;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd13;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd3;             
	  6'd43 : out_bits = 4'd14;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd2;             
	  6'd46 : out_bits = 4'd8;             
	  6'd47 : out_bits = 4'd4;             
	  6'd48 : out_bits = 4'd3;             
	  6'd49 : out_bits = 4'd15;             
	  6'd50 : out_bits = 4'd0;             
	  6'd51 : out_bits = 4'd6;             
	  6'd52 : out_bits = 4'd10;             
	  6'd53 : out_bits = 4'd1;            
	  6'd54 : out_bits = 4'd13;             
	  6'd55 : out_bits = 4'd8;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd4;        
	  6'd58 : out_bits = 4'd5;       
	  6'd59 : out_bits = 4'd11;       
	  6'd60 : out_bits = 4'd12;       
	  6'd61 : out_bits = 4'd7;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd14;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S4_Box

module S5_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd2;             
	  6'd1  : out_bits = 4'd12;             
	  6'd2  : out_bits = 4'd4;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd7;             
	  6'd5  : out_bits = 4'd10;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd6;             
	  6'd8  : out_bits = 4'd8;             
	  6'd9  : out_bits = 4'd5;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd15;             
	  6'd12 : out_bits = 4'd13;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd14;             
	  6'd15 : out_bits = 4'd9;             
	  6'd16 : out_bits = 4'd14;             
	  6'd17 : out_bits = 4'd11;             
	  6'd18 : out_bits = 4'd2;             
	  6'd19 : out_bits = 4'd12;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd7;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd5;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd15;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd3;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd2;             
	  6'd34 : out_bits = 4'd1;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd13;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd8;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd9;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd5;             
	  6'd44 : out_bits = 4'd6;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd0;             
	  6'd47 : out_bits = 4'd14;             
	  6'd48 : out_bits = 4'd11;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd12;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd14;            
	  6'd54 : out_bits = 4'd2;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd6;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd9;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd4;       
	  6'd62 : out_bits = 4'd5;      
	  6'd63 : out_bits = 4'd3;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S5_Box

module S6_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd12;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd10;            
	  6'd3  : out_bits = 4'd15;             
	  6'd4  : out_bits = 4'd9;             
	  6'd5  : out_bits = 4'd2;             
	  6'd6  : out_bits = 4'd6;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd0;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd4;             
	  6'd12 : out_bits = 4'd14;             
	  6'd13 : out_bits = 4'd7;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd11;             
	  6'd16 : out_bits = 4'd10;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd2;             
	  6'd20 : out_bits = 4'd7;             
	  6'd21 : out_bits = 4'd12;             
	  6'd22 : out_bits = 4'd9;             
	  6'd23 : out_bits = 4'd5;             
	  6'd24 : out_bits = 4'd6;             
	  6'd25 : out_bits = 4'd1;             
	  6'd26 : out_bits = 4'd13;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd9;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd15;             
	  6'd35 : out_bits = 4'd5;             
	  6'd36 : out_bits = 4'd2;             
	  6'd37 : out_bits = 4'd8;             
	  6'd38 : out_bits = 4'd12;             
	  6'd39 : out_bits = 4'd3;             
	  6'd40 : out_bits = 4'd7;             
	  6'd41 : out_bits = 4'd0;             
	  6'd42 : out_bits = 4'd4;             
	  6'd43 : out_bits = 4'd10;             
	  6'd44 : out_bits = 4'd1;             
	  6'd45 : out_bits = 4'd13;             
	  6'd46 : out_bits = 4'd11;             
	  6'd47 : out_bits = 4'd6;             
	  6'd48 : out_bits = 4'd4;             
	  6'd49 : out_bits = 4'd3;             
	  6'd50 : out_bits = 4'd2;             
	  6'd51 : out_bits = 4'd12;             
	  6'd52 : out_bits = 4'd9;             
	  6'd53 : out_bits = 4'd5;            
	  6'd54 : out_bits = 4'd15;             
	  6'd55 : out_bits = 4'd10;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd14;        
	  6'd58 : out_bits = 4'd1;       
	  6'd59 : out_bits = 4'd7;       
	  6'd60 : out_bits = 4'd6;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd8;      
	  6'd63 : out_bits = 4'd13;	  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S6_Box

module S7_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd4;             
	  6'd1  : out_bits = 4'd11;             
	  6'd2  : out_bits = 4'd2;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd15;             
	  6'd5  : out_bits = 4'd0;             
	  6'd6  : out_bits = 4'd8;             
	  6'd7  : out_bits = 4'd13;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd12;             
	  6'd10 : out_bits = 4'd9;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd10;             
	  6'd14 : out_bits = 4'd6;             
	  6'd15 : out_bits = 4'd1;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd0;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd9;             
	  6'd22 : out_bits = 4'd1;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd14;             
	  6'd25 : out_bits = 4'd3;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd2;             
	  6'd29 : out_bits = 4'd15;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd1;             
	  6'd33 : out_bits = 4'd4;             
	  6'd34 : out_bits = 4'd11;             
	  6'd35 : out_bits = 4'd13;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd3;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd14;             
	  6'd40 : out_bits = 4'd10;             
	  6'd41 : out_bits = 4'd15;             
	  6'd42 : out_bits = 4'd6;             
	  6'd43 : out_bits = 4'd8;             
	  6'd44 : out_bits = 4'd0;             
	  6'd45 : out_bits = 4'd5;             
	  6'd46 : out_bits = 4'd9;             
	  6'd47 : out_bits = 4'd2;             
	  6'd48 : out_bits = 4'd6;             
	  6'd49 : out_bits = 4'd11;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd8;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd4;            
	  6'd54 : out_bits = 4'd10;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd5;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd15;       
	  6'd60 : out_bits = 4'd14;       
	  6'd61 : out_bits = 4'd2;       
	  6'd62 : out_bits = 4'd3;      
	  6'd63 : out_bits = 4'd12;  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S7_Box

module S8_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd13;             
	  6'd1  : out_bits = 4'd2;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd4;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd1;             
	  6'd8  : out_bits = 4'd10;             
	  6'd9  : out_bits = 4'd9;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd14;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd12;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd1;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd13;             
	  6'd19 : out_bits = 4'd8;             
	  6'd20 : out_bits = 4'd10;             
	  6'd21 : out_bits = 4'd3;             
	  6'd22 : out_bits = 4'd7;             
	  6'd23 : out_bits = 4'd4;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd5;             
	  6'd26 : out_bits = 4'd6;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd14;             
	  6'd30 : out_bits = 4'd9;             
	  6'd31 : out_bits = 4'd2;             
	  6'd32 : out_bits = 4'd7;             
	  6'd33 : out_bits = 4'd11;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd1;             
	  6'd36 : out_bits = 4'd9;             
	  6'd37 : out_bits = 4'd12;             
	  6'd38 : out_bits = 4'd14;             
	  6'd39 : out_bits = 4'd2;             
	  6'd40 : out_bits = 4'd0;             
	  6'd41 : out_bits = 4'd6;             
	  6'd42 : out_bits = 4'd10;             
	  6'd43 : out_bits = 4'd13;             
	  6'd44 : out_bits = 4'd15;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd8;             
	  6'd48 : out_bits = 4'd2;             
	  6'd49 : out_bits = 4'd1;             
	  6'd50 : out_bits = 4'd14;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd10;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd15;        
	  6'd57 : out_bits = 4'd12;        
	  6'd58 : out_bits = 4'd9;       
	  6'd59 : out_bits = 4'd0;       
	  6'd60 : out_bits = 4'd3;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd11;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S8_Box

module DES (input logic [63:0] key, input logic [63:0] plaintext, 
	    input logic encrypt, output logic [63:0] ciphertext);

   logic [47:0] 	SubKey1, SubKey2, SubKey3, SubKey4;   
   logic [47:0] 	SubKey5, SubKey6, SubKey7, SubKey8;   
   logic [47:0] 	SubKey9, SubKey10, SubKey11, SubKey12;
   logic [47:0] 	SubKey13, SubKey14, SubKey15, SubKey16;

   logic [63:0] 	ip_out;   
   logic [63:0] 	r1_out;
   logic [63:0]		r2_out;
   logic [63:0]		r3_out;
   logic [63:0] 	r4_out;
   logic [63:0]		r5_out;
   logic [63:0]		r6_out;
   logic [63:0] 	r7_out;
   logic [63:0]		r8_out;
   logic [63:0]		r9_out;
   logic [63:0] 	r10_out;
   logic [63:0]		r11_out;
   logic [63:0]		r12_out;
   logic [63:0] 	r13_out;
   logic [63:0]		r14_out;
   logic [63:0]		r15_out;
   logic [63:0] 	r16_out;   
 
   // SubKey generation
   GenerateKeys k1 (key, SubKey1, SubKey2, SubKey3, SubKey4,
		    SubKey5, SubKey6, SubKey7, SubKey8,
		    SubKey9, SubKey10, SubKey11, SubKey12,
		    SubKey13, SubKey14, SubKey15, SubKey16);
   // encrypt (encrypt=1) or decrypt (encrypt=0) 

   // Initial Permutation (IP)
   IP b1 (plaintext, ip_out);
   // round 1
   round r1(ip_out, SubKey1, r1_out);
   // round 2
   round r2(r1_out, SubKey2, r2_out);
   // round 3
   round r3(r2_out, SubKey3, r3_out);
   // round K
   round r4(r3_out, SubKey4, r4_out);   
   // round K
   round r5(r4_out, SubKey5, r5_out);
   // round K
   round r6(r5_out, SubKey6, r6_out);
   // round K
   round r7(r6_out, SubKey7, r7_out);
   // round K
   round r8(r7_out, SubKey8, r8_out);
   // round 9
   round r9(r8_out, SubKey9, r9_out);
   // round 10
   round r10(r9_out, SubKey10, r10_out);
   // round 11
   round r11(r10_out, SubKey11, r11_out);
   // round 12
   round r12(r11_out, SubKey12, r12_out);
   // round 13
   round r13(r12_out, SubKey13, r13_out);
   // round 14
   round r14(r13_out, SubKey14, r14_out);
   // round 15
   round r15(r14_out, SubKey15, r15_out);
   // round 16
   round r16(r15_out, SubKey16, r16_out);

   // Final Permutation (IP^{-1}) (swap output of round16)
   FP FP({r16_out[31:0], r16_out[63:32]}, ciphertext);
   
endmodule // DES