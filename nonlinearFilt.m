function output = nonlinearFilt(w1, w2, Filter_order, DataA)
% filter F1
%   w1  = (F_hp / (Fs/ 2));
%   w2  = (F_lp/ (Fs/2));
%   w   = [w1 w2];
  b_F1 = firHelper(Filter_order, w1, w2);
  a   = 1;


%filtering the original data with the bandpass filter,
% DataA   is original acoustic signal

% Original signal filtered with F1
output = filter(b_F1, a, DataA);
end

% display(length(output));

function filterOut = firHelper(order, w1, w2)
fsr = 16000;
fc  = 16000*((w2 + w1)/2);

bw  =  1000;%50
nt  =  order;
g   =  1;

if(mod(nt,2) ~= 0)
    nt = nt+1;
end

fir = zeros(nt - 1, 1);
for i = 1: nt - 1
        a  = (i - nt/2) * 2.0*pi*bw/fsr;
        ys = 1 ;
        if a ~= 0 
            ys = sin(a)/a;
        end
        yg = g * (4.0 * bw/fsr);
        yw = 0.54 - 0.46 * cos(i * 2.0*pi/nt);
        yf = cos((i - nt/2) * 2.0*pi*fc/fsr);
	fir(i) = yf * yw * yg * ys;
end
filterOut = fir;
% N = order;
% L=(N-1)/2;
% 
% Nodd = rem(N,2);
% 
% % if (ftype == 0),  % Type I and Type II linear phase FIR
%     % basis vectors are cos(2*pi*m*f) (see m below)
%     if ~Nodd
%         m=(0:L)+.5;   % type II
%     else
%         m=(0:L);      % type I
%     end
%     k=m';
%     need_matrix = (~fullband) || (~constant_weights);
%     if need_matrix
%         I1=k(:,ones(size(m)))+m(ones(size(k)),:);    % entries are m + k
%         I2=k(:,ones(size(m)))-m(ones(size(k)),:);    % entries are m - k
%         G=zeros(size(I1));
%     end
% 
%     if Nodd
%         k=k(2:length(k));
%         b0=0;       %  first entry must be handled separately (where k(1)=0)
%     end;
%     b=zeros(size(k));
%     for s=1:2:length(F),
%         m=(M(s+1)-M(s))/(F(s+1)-F(s));    %  slope
%         b1=M(s)-m*F(s);                   %  y-intercept
%         if Nodd
%             b0 = b0 + (b1*(F(s+1)-F(s)) + m/2*(F(s+1)*F(s+1)-F(s)*F(s)))...
%                 * abs(W((s+1)/2)^2) ;
%         end
%         b = b+(m/(4*pi*pi)*(cos(2*pi*k*F(s+1))-cos(2*pi*k*F(s)))./(k.*k))...
%             * abs(W((s+1)/2)^2);
%         b = b + (F(s+1)*(m*F(s+1)+b1)*sinc(2*k*F(s+1)) ...
%             - F(s)*(m*F(s)+b1)*sinc(2*k*F(s))) ...
%             * abs(W((s+1)/2)^2);
%         if need_matrix
%             G = G + (.5*F(s+1)*(sinc(2*I1*F(s+1))+sinc(2*I2*F(s+1))) ...
%                 - .5*F(s)*(sinc(2*I1*F(s))+sinc(2*I2*F(s))) ) ...
%                 * abs(W((s+1)/2)^2);
%         end
%     end;
%     if Nodd
%         b=[b0; b];
%     end;
% 
%     if need_matrix
%         a=G\b;
%     else
%         a=(W(1)^2)*4*b;
%         if Nodd
%             a(1) = a(1)/2;
%         end
%     end
%     if Nodd
%         h=[a(L+1:-1:2)/2; a(1); a(2:L+1)/2].';
%     else
%         h=.5*[flipud(a); a].';
%     end;
% 
% filterOut = h;
end

