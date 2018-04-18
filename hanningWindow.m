function output = hanningWindow(windowSize, wavoutTemp) %#codegen
temp = hann(windowSize);
output = wavoutTemp .* temp;
