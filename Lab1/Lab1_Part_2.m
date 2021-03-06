clc;clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reading data from the file
%Note: - time is in miliseconds and framesize is in Bytes
%      - file is sorted in transmit sequence
%  Column 1:   index of frame (in display sequence)
%  Column 2:   time of frame in ms (in display sequence)
%  Column 3:   type of frame (I, P, B)
%  Column 4:   size of frame (in Bytes)
%  Column 5-7: not used
%
% Since we are interested in the transmit sequence we ignore Columns 1 and
% 2. So, we are only interested in the following columns: 
%       Column 3:  assigned to type_f
%       Column 4:   assigned to framesize_f
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[index, time, type_f, framesize_f, dummy1, dymmy2, dymmy3 ] = textread('movietrace.data', '%f %f %c %f %f %f %f');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   CODE FOR EXERCISE 2.2   (version: Spring 2007)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Extracting the I,P,B frmes characteristics from the source file
%frame size of I frames  : framesize_I
%frame size of P frames  : framesize_p 
%frame size of B frames  : framesize_B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a=0;
b=0;
c=0;
for i=1:length(index)
    if type_f(i)=='I'
        a=a+1;
        framesize_I(a)=framesize_f(i);
    end
     if type_f(i)=='B'
         b=b+1;
         framesize_B(b)=framesize_f(i);
         end
     if type_f(i)=='P'
         c=c+1;
         framesize_P(c)=framesize_f(i);
     end

end

numFrames = a+b+c
totalf = sum(framesize_f)
minf = min(framesize_f)
maxf = max(framesize_f)
meanf = mean(framesize_f)

Ilength = length(framesize_I);
Imax = max(framesize_I)
Imin = min(framesize_I)
Imean = mean(framesize_I)

Blength = length(framesize_B);
Bmax = max(framesize_B)
Bmin = min(framesize_B)
Bmean = mean(framesize_B)

Plength = length(framesize_P);
Pmax = max(framesize_P)
Pmin = min(framesize_P)
Pmean = mean(framesize_P)

meanbitrate = meanf * 8 * 0.001 / 33.333330
peakbitrate = maxf * 8 * 0.001 /33.333330
peaktoavg = peakbitrate / meanbitrate

figure(1);
plot(index,framesize_f);
title('Frame Size VS. Frame Sequence Number');
xlabel('Frame Sequence Number');
ylabel('Frame Size (bytes)');

figure(2);
subplot(3,1,1);
hist(framesize_I);
title('Distribution of I Frames');
xlabel('Frame Size (bytes)');
ylabel('Frequency');
subplot(3,1,2);
hist(framesize_P);
title('Distribution of P Frames');
xlabel('Frame Size (bytes)');
ylabel('Frequency');
subplot(3,1,3);
hist(framesize_B);
title('Distribution of B Frames');
xlabel('Frame Size (bytes)');
ylabel('Frequency');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Hint1: You may use the MATLAB functions 'length()','mean()','max()','min()'.
%       which calculate the length,mean,max,min of a
%       vector (for example max(framesize_P) will give you the size of
%       largest P frame
%Hint2: Use the 'plot' function to graph the framesize as a function of the frame
%       sequence number. 
%Hint3: Use the function 'hist' to show the distribution of the frames. Before 
%       that function type 'figure(2);' to indicate your figure number.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   CODE FOR EXERCISE 2.3   (version: Spring 2007)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following code will generates Plot 1. You generate Plot2 , Plot3 on
%your own. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The next line assigns a label (figure number) to the figure 
figure(3);

initial_point=1;
ag_frame=500;
jj=initial_point;
i=1;
bytes_f=zeros(1,100);
while i<=100
while ((jj-initial_point)<=ag_frame*i && jj<length(framesize_f))
bytes_f(i)=bytes_f(i)+framesize_f(jj);
jj=jj+1;
end
i=i+1;
end
subplot(3,1,1);bar(bytes_f);
title('Amount of Data For Every 500 Frames');
xlabel('Frames (unit of 500 frames)');
ylabel('Number of bytes (bytes)');

initial_point=3000;
ag_frame=50;
jj=initial_point;
i=1;
bytes_f=zeros(1,100);
while i<=100
while ((jj-initial_point)<=ag_frame*i && jj<length(framesize_f))
bytes_f(i)=bytes_f(i)+framesize_f(jj);
jj=jj+1;
end
i=i+1;
end
subplot(3,1,2);bar(bytes_f);
title('Amount of Data For Every 50 Frames Starting Frame 3000');
xlabel('Frames (unit of 50 frames)');
ylabel('Number of bytes (bytes)');

initial_point=5010;
ag_frame=5;
jj=initial_point;
i=1;
bytes_f=zeros(1,100);
while i<=100
while ((jj-initial_point)<=ag_frame*i && jj<length(framesize_f))
bytes_f(i)=bytes_f(i)+framesize_f(jj);
jj=jj+1;
end
i=i+1;
end
subplot(3,1,3);bar(bytes_f);
title('Amount of Data For Every 5 Frames Starting Frame 5010');
xlabel('Frames (unit of 5 frames)');
ylabel('Number of bytes (bytes)');
