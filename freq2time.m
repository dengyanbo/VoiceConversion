function time = freq2time(freqs)
lenData = length(freqs(1).data);
time = struct('data',zeros(lenData,1));
for i = 1:length(freqs)
   freq = freqs(i).data;
   conjFreq = conj(freq(end-isreal(freq(end)):-1:2, :));
   fullFreq = [freq; conjFreq];
   dataTemp = real(ifft(fullFreq));
   time(i).data = dataTemp;
end
