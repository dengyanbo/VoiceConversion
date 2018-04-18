files = dir('*.wav');
count = 0;
fs = 0;
for file = files'
    [s,fs] = audioread(file.name);
    if count == 0
        Sum = s;
    else
        Sum = [Sum; s];
    end
    count = count + 1;
end
audiowrite('concatenated.wav', Sum, fs);