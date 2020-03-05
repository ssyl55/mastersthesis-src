% Choose n - number of points and d - dimension and p - norm.
n = 10;
dim = 2;
p = 2;
% Choose n points in Rd randomly.
X = rand([dim,n]);
% Choose scaling range.
t = 0.1:0.1:100;
% Compute and plot magnitude function.
mags = magfinite(X,p,t);
figure(1);
plot(t,mags);

% Compute total similarity and compare with n
totalSims = zeros(length(t),1);
for i = 1:length(t)
    totalSims(i) = sum(sum(sim(dist(X,p,t(i)))));
end

figure(2);
plot(t,totalSims);
hold on;
plot(t,totalSims - n);
hold off;

% Compute S inequality
S = zeros(length(t),1);
T = zeros(length(t),1);
P = zeros(length(t),1);
for i = 1:length(t)
    S(i) = ((n-(mags(i)/n)*totalSims(i))^2)/((mags(i)/n)^2*totalSims(i)-mags(i));
    T(i) = totalSims(i) - n - S(i);
    P(i) = totalSims(i) - (n^2)/mags(i);
end

figure(3);
plot(t,S);
hold on;
plot(t,P);
legend('S','P');