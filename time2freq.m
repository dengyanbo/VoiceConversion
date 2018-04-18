function freqs = time2freq(time)

% lenData = length(time(1).data);
freq = fft(time(1).data);
freqs = struct('data', freq(1:ceil((length(freq)+1)/2)));

for i = 1:length(time)
    freq = fft(time(i).data);
    freqs(i).data = freq(1:ceil((length(freq)+1)/2));
end
