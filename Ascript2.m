alpha = 0.1;
fRatio = 1.0;
warping = 'bilinear';
outputFileName = strcat('data/sampleResults/output_a', num2str(alpha), '.wav');
vc('data/sample.wav', alpha, fRatio, outputFileName, warping)