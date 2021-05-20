close all;

pkg load statistics

plotIt = false;

if(exist("dataset","var") && exist("dataN","var"))
else
    dataN = LoadData("EMG_data_for_gestures-master", "txt", "MLR_EMG_data.mat");
    load MLR_EMG_data.mat;
endif

Ndata = round(dataN*0.1);

if(plotIt)
  % looking at the data
  for i = 1:Ndata
    lege = [""];
    figure(i)
    hold on
    for j= 1:8 
      plot(dataset.(strcat("data",(num2str(i)))).time,dataset.(strcat("data",(num2str(i)))).(strcat("channel",(num2str(j)))))
      lege = [lege; strcat("Channel ",(num2str(j)))];
    endfor

    plot(dataset.(strcat("data",(num2str(i)))).time,dataset.(strcat("data",(num2str(i)))).class*0.0001)
    lege = [lege; strcat("data ",(num2str(i)))];
    legend(lege);
    % hold off
  endfor
endif


% attempt at PCA
% [coeff,score,latent] = pca(dataset.data1.channel1)
%% not implemented yet


%% again
dat = [];
for i = 1:8
  dat = [dat,dataset.data1.(strcat("channel",(num2str(i))))];
endfor
men = mean(dat);
cent = center(dat);
covar = cov(cent);
[W, eigs] = eig(covar)
eigVals = diag(eigs)
n = length(dat);
Var = eigVals/(n-1)
pc = (W*cent')';

Var./sum(Var)

[maxVar, imaxVar] = max(Var./sum(Var))

figure(1)
plot(dataset.data1.time,pc(:,imaxVar))

combMag = sqrt(sum(dat.^2,2));
figure(2)
plot(dataset.data1.time,combMag)


% Fs = length(dataset.data1.channel1)/(dataset.data1.time(end)/1000) %sampling frequency
% T = 1/Fs;
% L = dataset.data1.time(end);

% Y = fft(dataset.data1.channel1);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);

% f = Fs*(0:(L/2))/L;
% figure()
% hold on
% plot(f,P1)
% title('Single-Sided Amplitude Spectrum of Channel')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

% Fs = length(dataset.data1.channel2)*1000/dataset.data1.time(end) %sampling frequency
% T = 1/Fs;
% L = dataset.data1.time(end);

% Y = fft(dataset.data1.channel2);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);

% f = Fs*(0:(L/2))/L;

% plot(f,P1)
