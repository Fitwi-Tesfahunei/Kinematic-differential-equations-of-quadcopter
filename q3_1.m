function dzdt = q3_1(t,z)
global w1 w2 w3
w1 = 1*sin(t);
w2 = 2*sin(2*t);
w3 = 3*sin(3*t);

dzdt = [(w2*sin(z(3)) + w3*cos(z(3)))/sin(z(2));
        (w2*cos(z(3))-w3*sin(z(3)));
        w1 - (w2*sin(z(3))+w3*cos(z(3)))*cos(z(2))/sin(z(2))];