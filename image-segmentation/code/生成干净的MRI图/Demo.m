clc;clear all;
filename='data\t1_icbm_normal_1mm_pn0_rf0.rawb';
M=rawb_transform(filename);
A=M(:,:,100); %A=uint8(A);        %代表不同的切片
A=double(A);
A=rot90(A);
A=A./255;
figure(1),imshow( A ); %title( 'B' ); 
        

