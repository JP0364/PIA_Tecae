%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program to Plot Cp Vector Over Airfoil Surface
% By K Vijay Anand, Bangalore, India
% Email: haivijayanand@gmail.com
% V1.0 - 05/Oct/2017
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clc

% Sample Airfoil Coordinates of x and y  [NACA 2412]
x  = [1.0;0.99648;0.99208;0.98732;0.98219;0.97670;0.97087;0.96474;0.95834;0.95173;0.94494;0.93801;0.93098;0.92386;0.91669;0.90947;0.90221;0.89493;0.88763;0.88032;0.87300;0.86566;0.85832;0.85098;0.84362;0.83627;0.82891;0.82155;0.81418;0.80681;0.79944;0.79207;0.78470;0.77732;0.76994;0.76256;0.75518;0.74780;0.74041;0.73303;0.72564;0.71825;0.71087;0.70348;0.69609;0.68870;0.68131;0.67392;0.66653;0.65914;0.65175;0.64436;0.63698;0.62959;0.62220;0.61481;0.60743;0.60005;0.59266;0.58528;0.57790;0.57052;0.56315;0.55577;0.54840;0.54103;0.53367;0.52630;0.51894;0.51158;0.50423;0.49688;0.48953;0.48219;0.47485;0.46751;0.46018;0.45286;0.44555;0.43824;0.43094;0.42365;0.41638;0.40911;0.40187;0.39466;0.38747;0.38030;0.37315;0.36600;0.35887;0.35176;0.34465;0.33755;0.33047;0.32339;0.31633;0.30927;0.30224;0.29521;0.28819;0.28119;0.27421;0.26724;0.26029;0.25335;0.24643;0.23953;0.23266;0.22580;0.21897;0.21216;0.20538;0.19862;0.19190;0.18521;0.17855;0.17193;0.16535;0.15882;0.15234;0.14591;0.13954;0.13324;0.12702;0.12088;0.11483;0.10888;0.10306;0.097360;0.091810;0.086420;0.081210;0.076190;0.071360;0.066750;0.062370;0.058200;0.054270;0.050550;0.047060;0.043790;0.040710;0.037830;0.035140;0.032610;0.030250;0.028030;0.025950;0.024000;0.022170;0.020460;0.018840;0.017320;0.015890;0.014540;0.013270;0.012080;0.010950;0.0098900;0.0089000;0.0079600;0.0070900;0.0062700;0.0055000;0.0047900;0.0041200;0.0035100;0.0029500;0.0024400;0.0019800;0.0015700;0.0012100;0.00089000;0.00063000;0.00041000;0.00024000;0.00011000;4.0000e-05;0;1.0000e-05;6.0000e-05;0.00016000;0.00030000;0.00050000;0.00075000;0.0010500;0.0014100;0.0018200;0.0022800;0.0028000;0.0033700;0.0040000;0.0046800;0.0054200;0.0062100;0.0070500;0.0079500;0.0089100;0.0099200;0.010990;0.012120;0.013320;0.014590;0.015920;0.017330;0.018830;0.020400;0.022070;0.023830;0.025700;0.027690;0.029800;0.032030;0.034420;0.036960;0.039660;0.042550;0.045630;0.048920;0.052430;0.056170;0.060150;0.064380;0.068870;0.073600;0.078590;0.083810;0.089260;0.094920;0.10078;0.10682;0.11301;0.11935;0.12581;0.13238;0.13906;0.14581;0.15265;0.15955;0.16651;0.17352;0.18058;0.18769;0.19483;0.20201;0.20923;0.21647;0.22375;0.23104;0.23837;0.24571;0.25308;0.26047;0.26788;0.27530;0.28274;0.29020;0.29767;0.30516;0.31266;0.32018;0.32770;0.33524;0.34279;0.35035;0.35791;0.36548;0.37306;0.38064;0.38822;0.39580;0.40336;0.41091;0.41845;0.42599;0.43353;0.44107;0.44862;0.45617;0.46372;0.47127;0.47883;0.48640;0.49397;0.50155;0.50912;0.51671;0.52430;0.53189;0.53949;0.54709;0.55469;0.56230;0.56991;0.57752;0.58514;0.59276;0.60038;0.60801;0.61564;0.62327;0.63091;0.63854;0.64618;0.65382;0.66146;0.66911;0.67675;0.68440;0.69205;0.69970;0.70735;0.71500;0.72266;0.73031;0.73797;0.74562;0.75328;0.76093;0.76859;0.77625;0.78390;0.79156;0.79921;0.80687;0.81452;0.82218;0.82983;0.83748;0.84513;0.85277;0.86041;0.86805;0.87568;0.88330;0.89091;0.89850;0.90606;0.91359;0.92108;0.92850;0.93584;0.94307;0.95015;0.95704;0.96369;0.97005;0.97609;0.98175;0.98703;0.99191;0.99641;1];
y  =[0.0012600;0.0019900;0.0028900;0.0038600;0.0049000;0.0060100;0.0071700;0.0083800;0.0096400;0.010930;0.012230;0.013560;0.014890;0.016220;0.017550;0.018870;0.020190;0.021500;0.022800;0.024080;0.025360;0.026620;0.027870;0.029110;0.030340;0.031550;0.032750;0.033940;0.035120;0.036280;0.037430;0.038570;0.039690;0.040800;0.041900;0.042980;0.044050;0.045110;0.046160;0.047190;0.048210;0.049210;0.050200;0.051180;0.052150;0.053100;0.054040;0.054960;0.055870;0.056760;0.057650;0.058510;0.059370;0.060200;0.061030;0.061830;0.062630;0.063410;0.064170;0.064920;0.065650;0.066370;0.067070;0.067750;0.068420;0.069070;0.069700;0.070320;0.070920;0.071500;0.072070;0.072610;0.073140;0.073650;0.074150;0.074620;0.075070;0.075500;0.075920;0.076310;0.076680;0.077040;0.077360;0.077670;0.077960;0.078220;0.078450;0.078650;0.078830;0.078970;0.079080;0.079160;0.079210;0.079220;0.079210;0.079160;0.079080;0.078970;0.078820;0.078640;0.078420;0.078170;0.077890;0.077560;0.077200;0.076810;0.076370;0.075900;0.075390;0.074840;0.074240;0.073610;0.072940;0.072230;0.071470;0.070670;0.069830;0.068940;0.068010;0.067040;0.066020;0.064960;0.063850;0.062700;0.061500;0.060260;0.058980;0.057670;0.056310;0.054930;0.053510;0.052080;0.050620;0.049150;0.047680;0.046210;0.044740;0.043290;0.041860;0.040450;0.039070;0.037710;0.036390;0.035100;0.033840;0.032610;0.031420;0.030250;0.029110;0.027990;0.026900;0.025840;0.024790;0.023770;0.022760;0.021770;0.020790;0.019820;0.018870;0.017930;0.017000;0.016070;0.015150;0.014240;0.013340;0.012430;0.011540;0.010640;0.0097500;0.0088600;0.0079800;0.0070900;0.0062100;0.0053400;0.0044700;0.0036100;0.0027500;0.0019100;0.0010800;0.00026000;-0.00055000;-0.0013700;-0.0022100;-0.0030500;-0.0038900;-0.0047400;-0.0055900;-0.0064300;-0.0072700;-0.0081100;-0.0089400;-0.0097600;-0.010570;-0.011370;-0.012160;-0.012940;-0.013720;-0.014480;-0.015240;-0.015990;-0.016740;-0.017470;-0.018210;-0.018940;-0.019660;-0.020390;-0.021110;-0.021830;-0.022550;-0.023270;-0.023990;-0.024720;-0.025450;-0.026180;-0.026910;-0.027650;-0.028390;-0.029130;-0.029880;-0.030620;-0.031370;-0.032110;-0.032850;-0.033580;-0.034300;-0.035010;-0.035690;-0.036350;-0.036980;-0.037580;-0.038150;-0.038680;-0.039180;-0.039640;-0.040060;-0.040440;-0.040780;-0.041090;-0.041370;-0.041600;-0.041810;-0.041980;-0.042130;-0.042240;-0.042330;-0.042390;-0.042430;-0.042440;-0.042430;-0.042400;-0.042350;-0.042270;-0.042190;-0.042080;-0.041960;-0.041820;-0.041670;-0.041500;-0.041330;-0.041140;-0.040930;-0.040720;-0.040500;-0.040270;-0.040030;-0.039790;-0.039530;-0.039270;-0.039010;-0.038740;-0.038460;-0.038190;-0.037900;-0.037610;-0.037310;-0.037000;-0.036680;-0.036350;-0.036010;-0.035660;-0.035310;-0.034940;-0.034570;-0.034190;-0.033810;-0.033420;-0.033020;-0.032610;-0.032200;-0.031790;-0.031370;-0.030940;-0.030510;-0.030070;-0.029630;-0.029190;-0.028740;-0.028290;-0.027830;-0.027370;-0.026910;-0.026450;-0.025980;-0.025510;-0.025030;-0.024560;-0.024080;-0.023600;-0.023120;-0.022630;-0.022150;-0.021660;-0.021170;-0.020680;-0.020180;-0.019690;-0.019190;-0.018690;-0.018190;-0.017690;-0.017190;-0.016690;-0.016180;-0.015680;-0.015170;-0.014660;-0.014150;-0.013640;-0.013130;-0.012620;-0.012100;-0.011590;-0.011070;-0.010550;-0.010030;-0.0095100;-0.0089900;-0.0084700;-0.0079500;-0.0074300;-0.0069000;-0.0063900;-0.0058700;-0.0053600;-0.0048600;-0.0043700;-0.0039000;-0.0034400;-0.0030000;-0.0025900;-0.0022100;-0.0018500;-0.0015200;-0.0012600];

% Coefficient of Pressure (Cp) over airfoil, obtained from ...
% Xfoil / MSES / CFD Fluent / CFX / OPENFOAM etc
% [Cp Obtained from X-Foil at M=0.2, ReNo = 1e6]
cp =[0.21481;0.20413;0.18744;0.17037;0.15314;0.13566;0.11870;0.10180;0.085740;0.070100;0.054950;0.040850;0.027010;0.014390;0.0017700;-0.010050;-0.021050;-0.032180;-0.042140;-0.052210;-0.061760;-0.071150;-0.079890;-0.088490;-0.096830;-0.10472;-0.11283;-0.12038;-0.12756;-0.13481;-0.14169;-0.14855;-0.15508;-0.16143;-0.16774;-0.17346;-0.17922;-0.18505;-0.19015;-0.19527;-0.20022;-0.20449;-0.20933;-0.21339;-0.21799;-0.22274;-0.22915;-0.23812;-0.25170;-0.27111;-0.29444;-0.31726;-0.32517;-0.32706;-0.32980;-0.33302;-0.33654;-0.34028;-0.34421;-0.34831;-0.35254;-0.35689;-0.36134;-0.36594;-0.37063;-0.37538;-0.38028;-0.38525;-0.39032;-0.39549;-0.40072;-0.40605;-0.41146;-0.41694;-0.42253;-0.42816;-0.43394;-0.43968;-0.44566;-0.45171;-0.45781;-0.46408;-0.47046;-0.47708;-0.48388;-0.49079;-0.49733;-0.50363;-0.50947;-0.51532;-0.52067;-0.52580;-0.53089;-0.53546;-0.54029;-0.54445;-0.54837;-0.55235;-0.55613;-0.55950;-0.56264;-0.56555;-0.56824;-0.57088;-0.57307;-0.57505;-0.57678;-0.57828;-0.57925;-0.58039;-0.58092;-0.58114;-0.58101;-0.58070;-0.57978;-0.57861;-0.57724;-0.57532;-0.57288;-0.57002;-0.56697;-0.56269;-0.55867;-0.55371;-0.54789;-0.54238;-0.53493;-0.52822;-0.51974;-0.51064;-0.50131;-0.49069;-0.47960;-0.46747;-0.45458;-0.44146;-0.42650;-0.41114;-0.39537;-0.37881;-0.36082;-0.34263;-0.32296;-0.30364;-0.28231;-0.26126;-0.23824;-0.21484;-0.19046;-0.16461;-0.13725;-0.11008;-0.081220;-0.050680;-0.018460;0.014120;0.050060;0.086840;0.12585;0.16571;0.20895;0.25196;0.29676;0.34626;0.39775;0.44845;0.49957;0.55467;0.61036;0.66525;0.71949;0.77047;0.82049;0.86906;0.91059;0.94508;0.97347;0.99557;1.00642;1.01013;1.00449;0.98989;0.96507;0.92836;0.88541;0.83205;0.76951;0.70567;0.63955;0.56225;0.49024;0.41837;0.35078;0.28331;0.22170;0.16127;0.10655;0.057270;0.010150;-0.031160;-0.070780;-0.10476;-0.13739;-0.16615;-0.19095;-0.21488;-0.23516;-0.25351;-0.26961;-0.28518;-0.29697;-0.30846;-0.31764;-0.32693;-0.33405;-0.33937;-0.34447;-0.34779;-0.35051;-0.35251;-0.35281;-0.35290;-0.35224;-0.35076;-0.34797;-0.34490;-0.34127;-0.33766;-0.33269;-0.32798;-0.32211;-0.31712;-0.31079;-0.30491;-0.29879;-0.29259;-0.28606;-0.27990;-0.27354;-0.26730;-0.26086;-0.25482;-0.24833;-0.24236;-0.23621;-0.23024;-0.22433;-0.21844;-0.21277;-0.20709;-0.20154;-0.19604;-0.19075;-0.18552;-0.18034;-0.17533;-0.17038;-0.16560;-0.16083;-0.15633;-0.15182;-0.14764;-0.14339;-0.13926;-0.13543;-0.13165;-0.12809;-0.12460;-0.12131;-0.11832;-0.11558;-0.11299;-0.11081;-0.10855;-0.10617;-0.10361;-0.10110;-0.098460;-0.095670;-0.093020;-0.090140;-0.087430;-0.084570;-0.081800;-0.078920;-0.076080;-0.073260;-0.070460;-0.067650;-0.064900;-0.062160;-0.059450;-0.056730;-0.054090;-0.051510;-0.048960;-0.046480;-0.044070;-0.041770;-0.039420;-0.037340;-0.035300;-0.033470;-0.031810;-0.030510;-0.029620;-0.029450;-0.025170;-0.016260;-0.0057200;0.0046000;0.013320;0.020010;0.024580;0.028040;0.030650;0.032520;0.034920;0.036710;0.038550;0.040480;0.042760;0.044940;0.047030;0.049680;0.052200;0.054650;0.057430;0.060490;0.063410;0.066640;0.069610;0.073400;0.076700;0.080600;0.084460;0.088810;0.093110;0.097780;0.10292;0.10808;0.11419;0.12007;0.12651;0.13388;0.14154;0.14985;0.15870;0.16815;0.17826;0.18890;0.20002;0.21219;0.21481];

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Now ready to go....
% If dx = x2-x1 and dy = y2-y1, then normals are (-dy,dx) and (dy,-dx).

dx = gradient(x); dy = gradient(y);

% Normalise both dx and dy by ds
ds = sqrt(dx.^2+dy.^2);
dx = dx./ds ; dy = dy./ds;

% Now We got Unit Normal Vectors all over the Airfoil Surface
% Scale the Vectors using Cp to represent the Pressure Distribution
dx = abs(cp).*dx ; dy = abs(cp).*dy ;

% We can use a Scaling Factor for the length of Arrow Vector
% Typically, I prefer 0.5
scale = 0.5;

% Determine the point x1,y1 representing the other end of Arrow Vector
x1 = x + scale*dy ;
y1 = y - scale*dx ;

% Now plot the Airfoil
plot(x,y,'*-');
hold on;

% Plot all negative cp value Arrow pointing outwards and vice versa

% Find indices of cp less than 0
ind1 = cp<0;

% Set a broader limit for axis, to avoid any warning/error by arrow command
axis([-5 5 -5 5]);

% Plot all negative cp using blue color
arrow([x(ind1) y(ind1)],[x1(ind1),y1(ind1)],'Length',.5,'Width',0.01,'EdgeColor','b','FaceColor','b');

% Plot all positive cp using red color
arrow([x1(~ind1) y1(~ind1)],[x(~ind1),y(~ind1)],'Length',.5,'Width',0.01,'EdgeColor','r','FaceColor','r');

% Make axis equal to visualise the Airfoil Shape properly
axis equal;
% Make axis tight to remove unwanted space set earlier
axis tight;

% Plot a Boundary to Beautify the Cp Vectors!!!
plot([x x1],[y y1],'k','linewidth',.1);

% Remove all unwanted axis and grid lines
set(gca,'xtick',[],'ytick',[],'Box','off','Color','None');
axis off;
saveas(gcf,'Cp_Distribution.png');

