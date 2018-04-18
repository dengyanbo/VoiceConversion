function [wavOut, fs] = vc(wav, fs, alpha, f0ratio, warping)%, varargin)
% [wav,fs] = audioread(sourceWavFileName);

wav = wav(:,1);
wav = wav ./ max(wav); %normalize

% zero = zeros(16000,1);
% wav = [wav; zero];

% if length(varargin)==0
    pm = findPM(wav, fs);
% else
%     pm = load(varargin{1});
%     pm = round(pm .* fs);
%     pm = [pm(1); diff(pm)];
% 
%     if sum(pm)>length(wav)
%         error('pm file is unsuitable for wav');
%     end
% end

frames = splitWavByPm(wav, pm);
freqs = time2freq(frames);

warpedFreqs = vtln(freqs, warping, alpha);%asymmetric

warpedWav = freq2time(warpedFreqs);
wavOut = psola(warpedWav, f0ratio);


% audiowrite(outputFileName, wavOut, fs);
%  save('pm.mat','pm');
%  save('freqs.mat','freqs');
%  save('warpedFreqs.mat','warpedFreqs');
%  save('warpedWav.mat','warpedWav');
%  save('wavOut.mat','wavOut');
% display(size(frames));
% display(size(pm));
% display(size(freqs));
% display(size(warpedFreqs));
% display(size(warpedWav));
% display(size(wavOut));
% 
% 
% %print -depsc2 pm.eps;
