%graphics_toolkit ("gnuplot");

figure;

data = dlmread("manipulator_joint5.txt", ",");
t1 = 8700;
a = size(data(1:t1, 2));

errorQe = data(1:t1, 1) - data(1:t1, 2);

minerror = min(errorQe)
maxerror = max(errorQe)

hold all;
    
t = title('Tracking error on joint 5');
set(t, 'FontSize', 24);
xl = xlabel ('time(seconds)'); 
set(xl, 'FontSize', 20);
yl = ylabel ('Error (rad)');
set(yl, 'FontSize', 20);
ylim([-1 1]);

plot(data(1:t1, 3), errorQe(1:t1,1), 'Color', 'r');

%plot(data(:, 2), data(:, 1), '--', 'Color', 'r');
set(findall(gca, 'Type', 'Line'),'LineWidth',3)

print -dpng joint5_trajectoryerror.png;
