ds = [1 3 5 7 9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41];
seconds = zeros(length(ds),1);
secondsmu = zeros(length(ds),1);
secondsimp = zeros(length(ds),1);
firsts = zeros(length(ds),1);
quos = zeros(length(ds),1);
quos2 = zeros(length(ds),1);

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
end

figure(1);
% plot(ds, firsts, 'r--o');
% hold on;
% plot(ds, seconds, 'b--o');
% plot(ds, secondsmu, 'g--o');
% plot(ds, secondsimp, 'k--o');
% hold off;
% legend('Firsts', 'Seconds', 'Secondsmu', 'Secondsimp', 'Location', 'NorthWest');

plot(ds, secondsimp, 'b--o');
xlabel('Dimension d');
ylabel('Second order term');
title('Second order term vs. Dimension');
set(gca, 'FontSize', 15);