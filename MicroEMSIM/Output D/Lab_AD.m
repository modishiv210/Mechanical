spaf = readmatrix('main_asc_spaf.txt');
fc = readmatrix('main_asc_fc.txt');
pv = readmatrix('main_asc_pv.txt');
vt = readmatrix('main_asc_vt.txt');
sfr = importfile('main_asc_sfr.txt');

%% (i) - Cutting Force
angle = fc(1:3600,1);
Fx = fc(1:3600,2);
Fy = fc(1:3600,3);
Fz = fc(1:3600,4);

figure(1)
plot(angle,Fx)
title('Cutting force')
xlabel('Angle (deg)')
ylabel('Force in X direction')
saveas(1,'D-1x.png')

figure(2)
plot(angle,Fy)
title('Cutting force')
xlabel('Angle (deg)')
ylabel('Force in Y direction')
saveas(2,'D-1y.png')

figure(3)
plot(angle,Fz)
title('cutting force')
xlabel('Angle (deg)')
ylabel('Force in Z direction')
saveas(3,'D-1z.png')

%% 
% (ii) - Peak to Valley
AvgFx = sum(pv(1:10,1))/10;
AvgFy = sum(pv(1:10,2))/10;

% (iii) - Tool Deflection
AvgDx = sum(pv(1:10,3))/10;
AvgDy = sum(pv(1:10,4))/10;

Adx = sum(vt(1:3600,2))/3600;
Ady = sum(vt(1:3600,3))/3600;

%% (iv) - Surface Profile

nX = sfr(2,2);
nY = sfr(4,2);
X = sfr(3,1:nX);
Y = sfr(5,1:nY);
H = sfr(7:nY+6,1:nX);

figure(4)
surf(X, Y, H)
title('surface of floor')
colormap turbo
colorbar
%saveas(4,'D-4.png')

%% (v) - Surface Charastics
nC = find(Y==0);
nS = 26; 
center = H(nC,:);
side = H(nS,:);

figure(5)
plot(X,center)
title('Surface profile - centerline')
xlabel('X')
ylabel('Height')
saveas(5,'D-5-center.png')

figure(6)
plot(X,side)
title('Surface profile - sideline 25 um of edge')
xlabel('X')
ylabel('Height')
saveas(6,'D-5-side.png')

%% (vi) - Tool Vibrations
angle = vt(1:3600,1);
dx = vt(1:3600,2);
dy = vt(1:3600,3);

figure(7)
plot(angle,dx)
title('Vibrations of Tool')
xlabel('Angle (deg)')
ylabel('dx')
saveas(7,'D-6x.png')

figure(8)
plot(angle,dy)
title('Vibrations of Tool')
xlabel('Angle (deg)')
ylabel('dy')
saveas(8,'D-6y.png')