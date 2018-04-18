function AudioAmplifier(file)
[x, Fs] = audioread(file);

max_signal=max(abs(x));
factor=1/max_signal;
amp_x=x.*factor;

fc = 4000;
Wn = (2/Fs)*fc;
[b,a] = butter(10,Wn);

y = filter(b, a, amp_x);
fileName = strcat(file, 'amp.wav');
audiowrite(fileName, y, Fs);


