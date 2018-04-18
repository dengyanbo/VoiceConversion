function output = spec_trkWindow(windowSize)
L = windowSize;
beta = 0.5;
output = besseHelper(beta*sqrt(1-(((0:L-1)-(L-1)/2)/((L-1)/2)).^2))/1.0635;
end

function output = besseHelper(z)

sum = zeros(1,length(z));
for i = 0:10000
    sumTemp = sum + (((z/2).^i)/(factorial(i))).^2;
    sum = sumTemp;
end
output = sum;
end