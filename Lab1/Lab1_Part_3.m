clc;clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reading the data and putting the first 100000 entries in variables 
%Note that time is in seconds and framesize is in Bytes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
no_entries=1000000;
[time1, framesize1] = textread('Bel.data', '%f %f');
time=time1(1:no_entries);
framesize=framesize1(1:no_entries);
totalbytes = sum(framesize1)
meanpacketsize = mean(framesize1);
meantimediff = mean(diff(time1));
meanbitrate = meanpacketsize * 8 * 0.000001 / meantimediff
[a] = time1(1)
[b] = transpose(diff(time1));
[timediff] = [a b];

peakbitrate = max((framesize1*8*0.000001)./transpose(timediff))
peaktoaverage = peakbitrate / meanbitrate

figure(1);
plot(time1,framesize1);
title('Packet Size VS. Time');
xlabel('Time (s)');
ylabel('Packet Size (bytes)');

figure(2);
hist(framesize1);
title('Distribution of Packet Sizes');
xlabel('Packet Size (bytes)');
ylabel('Frequency');

%%%%%%%%%%%%%%%%%%%%%%%%%Exercise %%%3.2%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The following code will generate Plot 1; You generate Plot2 , Plot3.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);
jj=1;
i=1;
initial_p=0;
ag_time=1;
bytes_p=zeros(1,100);
while time(jj)<=initial_p
    jj=jj+1;
end
while i<=100
while ((time(jj)-initial_p)<=ag_time*i && jj<no_entries)
bytes_p(i)=bytes_p(i)+framesize(jj);
jj=jj+1;
end
i=i+1;
end
%%%%%%%%
subplot(3,1,1);bar(bytes_p);
title('Amount of Data Captured In Every 1s Interval');
xlabel('Time Intervals of 1s');
ylabel('Packet Size(bytes');

jj=1;
i=1;
initial_p=20;
ag_time=0.1;
bytes_p=zeros(1,100);
while time(jj)<=initial_p
    jj=jj+1;
end
while i<=100
while ((time(jj)-initial_p)<=ag_time*i && jj<no_entries)
bytes_p(i)=bytes_p(i)+framesize(jj);
jj=jj+1;
end
i=i+1;
end
%%%%%%%%
subplot(3,1,2);bar(bytes_p);
title('Amount of Data Captured In Every 100ms Interval From Time 20s');
xlabel('Time Intervals of 100ms');
ylabel('Packet Size(bytes');

jj=1;
i=1;
initial_p=90;
ag_time=0.01;
bytes_p=zeros(1,100);
while time(jj)<=initial_p
    jj=jj+1;
end
while i<=100
while ((time(jj)-initial_p)<=ag_time*i && jj<no_entries)
bytes_p(i)=bytes_p(i)+framesize(jj);
jj=jj+1;
end
i=i+1;
end
%%%%%%%%
subplot(3,1,3);bar(bytes_p);
title('Amount of Data Captured In Every 10ms Interval From Time 90s');
xlabel('Time Intervals of 1oms');
ylabel('Packet Size(bytes');





