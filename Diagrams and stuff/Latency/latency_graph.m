% Mobile
    % Actual
    mobile_time = csvread('mobile_history.csv');
    mobile_latency = [];
    tech_latency = [5 80 150];

    for ti=1:size(mobile_time,1)
        total = sum(mobile_time(ti,(2:4)));
        mobile_latency = [mobile_latency sum(mobile_time(ti,(2:4)).*tech_latency)/total];
    end

    % Time X
    x = mobile_time(:,1)

    % LTE
    lte = 5*ones(length(x),1)';

% Backbone
    backbone_history = csvread('backbone_history.csv');

% Propagation
    propagation = [19,76 89,68 147,44 127];

% Plot : Theoretical
figure(1)
hold on
grid on


for i=2:5
    plot(i-1:i,(mean(backbone_history(:,i))+5)*ones(2,1))
end

for i=1:4
    plot(i:i+1,(propagation(i)+5)*ones(2,1),'r')
end

plot(1:5,5*ones(5,1));

ylabel('Latency (ms)')
hold off

% Plot : Actual
figure(2)
hold on
grid on


for i=2:4
    %plot(i-1:i,mean(backbone_history(:,1)))
end
%surf(x,1:5,mobile_latency_3)
ylabel('Latency (ms)')
hold off