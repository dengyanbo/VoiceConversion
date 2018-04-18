alpha = 1.2;
fRatio = 1.2;
for warping = {'asymmetric','symmetric','power','quadratic','bilinear'}
    for alpha = 0.8:0.1:1.4
        for fRatio = 1.0:0.1:1.4
            outputFileName = strcat('data/sampleResults/',warping{1},'/output_a', num2str(alpha), '_f', num2str(fRatio), '.wav');
            vc('data/sample.wav', alpha, fRatio, outputFileName, warping{1}, 'data/pitchMarksMat.txt')
        end
    end
end