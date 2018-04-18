function frames = splitWavByPm(wav, pm)

lenData = pm(1) - 1;
pmSum = 0;
frames = struct('data', zeros(lenData, 1));
for i = 1:length(pm)
    frames(i).data = wav(pmSum+1:pmSum+pm(i));
    pmSum = pmSum + pm(i);
end
