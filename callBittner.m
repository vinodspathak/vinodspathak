function  [k] = callBittner(head)
epsilon = 0.52; % [mm3 mm-3]
a = -3.1; % cavitation water potential [MPa]
E = 3.5 % [MPa]
kMax = 1.7*10^(-2); % [mm s-1]
lambda = 0.86; % [-]
theta = epsilon+a/E; % [-]
eta = 2/lambda+1;
%feature1
if head >= a % non-cavitation
    % k = kMax*((theta/eta)+((1-(theta/eta))*((a-head)/a)^2)); % [mm/s]
    k = kMax*(theta/epsilon+(1-theta/epsilon)*((a-head)/a)^2);
else % cavitation
    % k =  (kMax*(head/a)^(-lambda*(2/(lambda+1))));  % [mm/s] ;
    k = kMax*(head/a)^(-lambda*eta);
end
k

end
