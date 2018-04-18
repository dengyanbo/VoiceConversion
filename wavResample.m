NewFs = 16000;                  %resampled at 16000 Hz
fileName = 'sa1.wav';           %input filename
[s, fs] = audioread(fileName);  %read audio file
s = resample(s, NewFs, fs);
NewFileName = strcat('resampled-', fileName);
audiowrite(NewFileName, s, NewFs);