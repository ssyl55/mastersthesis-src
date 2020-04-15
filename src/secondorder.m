ds = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41];
seconds = zeros(length(ds),1);
secondsmu = zeros(length(ds),1);
secondsimp = zeros(length(ds),1);
secondsimp2 = zeros(length(ds),1);
firsts = zeros(length(ds),1);
quos = zeros(length(ds),1);
quos2 = zeros(length(ds),1);
quos3 = zeros(length(ds),1);

for i = 1:length(ds)
    d = ds(i);
    m = (d-1)/2;

    D = roof(m-1,0);
    N = roof(m+1,2);
    Dp = Dp0(m);
    Np = Np0(m);
    N2p = N2p0(m);
    D2p = D2p0(m);

    seconds(i) = 2*((N2p - factorial(d)*D2p)/(factorial(d)*D)) - (V1(m)*Dp/D);
    secondsmu(i) = 2*(mu(m)/N) - (V1(m)*Dp/D);
    secondsimp(i) = (6*sig2sumovern(m)) - (V1(m)*DpoverD(m));
    quos(i) = (secondsmu(i)/seconds(i));
    quos2(i) = (secondsimp(i)/secondsmu(i));
    firsts(i) = 0.5*V1(m);
    
    % Try out the simplifications I got for the doubly indexed sums
    % First sum:
    firstsum = 0;
    for p2 = 2:(m+1)
        for q1 = 0:(p2-2)
            for q2 = 0:(m+1-p2)
                firstsum = firstsum + kratio(2,q1+1)*(1/(2*p2-1))*kratio(p2+1,p2+q2);
            end
        end
    end
    
    % Second sum:
    secondsum = 2*m^2/((2*m-1)*(2*m+1))-(2*m*sqrt(pi)*gamma(m))/((2*m-1)*(2*m+1)*gamma(m-0.5));
    
    % Third sum:
    thirdsum = (m+1)/(2*m+1)-(sqrt(pi)*gamma(m+1))/((2*m+1)*gamma(m+0.5));
    
    % Fourth sum:
    fourthsum = 0;
    for p1 = 2:m
        for p2 = (p1+1):(m-1)
            for q1 = 0:(p2-p1-1)
                fourthsum = fourthsum + (1/(2*p1-1))*kratio(p1+1,p1+q1)*(1/(2*p2-1))*kratio(p2+1,m+1);
            end
        end
    end

    %Dsum:
    dsum = V1(m)*((m+1)-(2^(2*m)*(factorial(m))^2)/(factorial(2*m)));
    
    secondsimp2(i) = 6*(firstsum + secondsum + thirdsum + fourthsum) - dsum;
    
    quos3(i) = secondsimp2(i)/secondsimp(i);
end

figure(1);
plot(ds, firsts, 'r--o');
hold on;
plot(ds, seconds, 'b--o');
%plot(ds, secondsmu, 'g--o');
plot(ds, secondsimp, 'k--o');
plot(ds, secondsimp2, 'g--o');
hold off;
legend('Firsts', 'Seconds', 'Secondsimp', 'Secondsimp2', 'Location', 'NorthWest');

% plot(ds, secondsimp, 'b--o');
% xlabel('Dimension d');
% ylabel('Second order term');
% title('Second order term vs. Dimension');
% set(gca, 'FontSize', 15);