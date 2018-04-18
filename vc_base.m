% function [wavOut, fs] = vc_base (sourceWavFileName, alpha, f0ratio, outputFileName, warping)
sourceWavFileName = 'data/sample2.wav';
alpha = -0.08;
f0ratio = 1.0;
outputFileName = 'data/sample2test.wav';
warping = 'bilinear';

[wav,fs] = audioread(sourceWavFileName);
% codegen -config:lib -launchreport nonlinearFilt -args {coder.Constant(1), coder.Constant(1), coder.Constant(1), zeros(length(wav),1)}
% codegen -config:lib -launchreport hanningWindow -args {zeros(1102,1), zeros(1102,1)}%{coder.Constant(1)}
% codegen -config:lib -launchreport spec_trkWindow -args {coder.Constant(1)}

[wavOut, fs] = vc(wav, fs, alpha, f0ratio, warping);

audiowrite(outputFileName, wavOut, fs);