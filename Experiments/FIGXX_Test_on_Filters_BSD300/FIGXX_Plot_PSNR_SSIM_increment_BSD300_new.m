%% Plot results: 
close all
clear all
limit  =200

%% Plot TDA method

load('OutPutSSIM/TDA_Filters_bsd300_gamma100.mat');
%calculate the average
% Normalize

PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));
GT_PSNR_avg2= mean(PSNR_Increments, 1);

% Select the filters. 
Matrix = squeeze(GT_PSNR_avg2(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));
figure(1)
subplot(1, 4, 2)
createfigure(Matrix, [-10 70])
title('b) TDA-Method $\lambda=1$', 'Interpreter', 'latex','FontSize',18)

% SSIM
% Select the filters. 
GT_SSIM_avg = mean(GT_SSIM_filter, 1);
Matrix = squeeze(GT_SSIM_avg(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

figure(2)
subplot(1, 4, 2)
 createfigure_SSIM(Matrix, [0.5 1])
 title('b) TDA-Method $\lambda=1$', 'Interpreter', 'latex','FontSize',18)
% 
% 
% Variance = squeeze(std(GT_PSNR_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]), 0, 1 ));
% figure(3)
% subplot(1, 4, 2)
% createfigure(Variance, [1 4.5])
% title('b) TDA-Method $\lambda=1$', 'Interpreter', 'latex','FontSize',18)
%%
load('OutPutSSIM/TDA_Filters_bsd300_gamma50.mat');
%calculate the average
% Normalize
PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));
GT_PSNR_avg2= mean(PSNR_Increments, 1);

% Select the filters. 
Matrix = squeeze(GT_PSNR_avg2(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));
figure(1)
subplot(1, 4, 1)
createfigure(Matrix, [-10 70])
title('a) TDA-Method $\lambda=0.5$', 'Interpreter', 'latex','FontSize',18)

% SSIM
% Select the filters. 
GT_SSIM_avg = mean(GT_SSIM_filter, 1);
Matrix = squeeze(GT_SSIM_avg(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

figure(2)
subplot(1, 4, 1)
createfigure_SSIM(Matrix, [0.5 1])
title('a) TDA-Method $\lambda=0.5$', 'Interpreter', 'latex','FontSize',18)

% Variance = squeeze(std(GT_PSNR_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]), 0, 1 ));
% figure(3)
% subplot(1, 4, 1)
% createfigure(Variance, [1 4.5])
% title('a) TDA-Method $\lambda=0.5$', 'Interpreter', 'latex','FontSize',18)

%% Plot T-method

load('OutPutSSIM/T_Filters_bsd300_gamma100.mat');
%calculate the average
% Normalize
PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));
GT_PSNR_avg2= mean(PSNR_Increments, 1);

% Select the filters. 
Matrix = squeeze(GT_PSNR_avg2(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));
figure(1)
subplot(1, 4, 3)
createfigure(Matrix, [-10 150])
title('c) T-Method', 'Interpreter', 'latex','FontSize',18)

% SSIM
% Select the filters. 
GT_SSIM_avg = mean(GT_SSIM_filter, 1);
Matrix = squeeze(GT_SSIM_avg(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

figure(2)
subplot(1, 4, 3)
createfigure_SSIM(Matrix, [0.5 1])
title('c) T-Method', 'Interpreter', 'latex','FontSize',18)

Variance = squeeze(std(GT_PSNR_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]), 0, 1 ));
% figure(3)
% subplot(1, 4, 3)
% createfigure(Variance, [1 4.5])
% title('c) T-Method', 'Interpreter', 'latex','FontSize',18)

%% Plot P-method

load('OutPutSSIM/P_Filters_bsd300_gamma100.mat');
%calculate the average
% Normalize
PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));
GT_PSNR_avg2= mean(PSNR_Increments, 1);

% Select the filters. 
Matrix = squeeze(GT_PSNR_avg2(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));
figure(1)
subplot(1, 4, 4)



createfigure(Matrix, [-10 100])
title('d) P-Method', 'Interpreter', 'latex','FontSize',18)
legend('RGF','GS','LoG','AMF','RTV','ILS','L0','BF','Disk','Motion','GF','GF+GS', 'NumColumns',5, 'FontSize', 12,'Interpreter', 'Latex')

% SSIM
% Select the filters. 
GT_SSIM_avg = mean(GT_SSIM_filter, 1);
Matrix = squeeze(GT_SSIM_avg(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

figure(2)
subplot(1, 4, 4)
createfigure_SSIM(Matrix, [0.5 1])
title('d) P-Method', 'Interpreter', 'latex','FontSize',18)
legend('RGF','GS','LoG','AMF','RTV','ILS','L0','BF','Disk','Motion','GF','GF+GS', 'NumColumns',5, 'FontSize', 12,'Interpreter', 'Latex')

% Variance = squeeze(std(GT_PSNR_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]), 0, 1 ));
% figure(3)
% subplot(1, 4, 4)
% createfigure(Variance, [1 4.5])
% title('d) P-Method', 'Interpreter', 'latex','FontSize',18)
% legend('RGF','GS','LoG','AMF','RTV','ILS','L0','BF','Disk','Motion','GF','GF+GS', 'NumColumns',5, 'FontSize', 12,'Interpreter', 'Latex')

function createfigure(YMatrix1, Ylimits)

plot(YMatrix1,'LineWidth',1);
% Create ylabel
ylabel('Avg PSNR increment [\%]','FontSize',16,'Interpreter','latex');
% Create xlabel
xlabel('Iterations','FontSize',16,'Interpreter','latex');
set(gca,'linestyleorder',{'-', '--',':','-.'},'nextplot','add','FontSize',12);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(Ylimits);
grid('on');
hold('off');
end

function createfigure_SSIM(YMatrix1, Ylimits)

plot(YMatrix1,'LineWidth',1);
% Create ylabel
ylabel('Avg SSIM','FontSize',16,'Interpreter','latex');
% Create xlabel
xlabel('Iterations','FontSize',16,'Interpreter','latex');
set(gca,'linestyleorder',{'-', '--',':','-.'},'nextplot','add','FontSize',12);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(Ylimits);
grid('on');
hold('off');
end

function createfigure_new(YMatrix1, YMatrix2, YMatrix3, YMatrix4)
%CREATEFIGURE(YMatrix1, YMatrix2, YMatrix3, YMatrix4)
%  YMATRIX1:  matrix of y data
%  YMATRIX2:  matrix of y data
%  YMATRIX3:  matrix of y data
%  YMATRIX4:  matrix of y data

%  Auto-generated by MATLAB on 24-Nov-2021 15:41:54

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.336117021276596 0.11 0.156487639687734 0.64578947368421]);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot(YMatrix1,'Parent',axes1,'LineWidth',1);

% Create ylabel
ylabel('Avg PSNR increment [\%]','FontSize',14,'Interpreter','latex');

% Create xlabel
xlabel('Iterations','FontSize',14,'Interpreter','latex');

% Create title
title('TDA-Method $\lambda=1$','FontSize',18,'Interpreter','latex');

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[-10 100]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontSize',12,'LineStyleOrder',{'-','--',':','-.'});
% Create axes
axes2 = axes('Parent',figure1,...
    'Position',[0.13 0.11 0.156487639687734 0.64578947368421]);
hold(axes2,'on');

% Create multiple lines using matrix input to plot
plot(YMatrix2,'Parent',axes2,'LineWidth',1);

% Create ylabel
ylabel('Avg PSNR increment [\%]','FontSize',14,'Interpreter','latex');

% Create xlabel
xlabel('Iterations','FontSize',14,'Interpreter','latex');

% Create title
title('TDA-Method $\lambda=0.5$','FontWeight','bold','FontSize',18,...
    'Interpreter','latex');

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes2,[-10 70]);
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'off');
% Set the remaining axes properties
set(axes2,'FontSize',12,'LineStyleOrder',{'-','--',':','-.'});
% Create axes
axes3 = axes('Parent',figure1,...
    'Position',[0.542234042553192 0.11 0.156487639687734 0.64578947368421]);
hold(axes3,'on');

% Create multiple lines using matrix input to plot
plot(YMatrix3,'Parent',axes3,'LineWidth',1);

% Create ylabel
ylabel('Avg PSNR increment [\%]','FontSize',14,'Interpreter','latex');

% Create xlabel
xlabel('Iterations','FontSize',14,'Interpreter','latex');

% Create title
title('T-Method','FontSize',18,'Interpreter','latex');

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes3,[-10 150]);
box(axes3,'on');
grid(axes3,'on');
hold(axes3,'off');
% Set the remaining axes properties
set(axes3,'FontSize',12,'LineStyleOrder',{'-','--',':','-.'});
% Create axes
axes4 = axes('Parent',figure1,...
    'Position',[0.748351063829787 0.11 0.156648936170213 0.64578947368421]);
hold(axes4,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(YMatrix4,'Parent',axes4,'LineWidth',1);
set(plot1(1),'DisplayName','RGF');
set(plot1(2),'DisplayName','GS');
set(plot1(3),'DisplayName','LoG');
set(plot1(4),'DisplayName','AMF');
set(plot1(5),'DisplayName','RTV');
set(plot1(6),'DisplayName','ILS');
set(plot1(7),'DisplayName','L0');
set(plot1(8),'DisplayName','BF');
set(plot1(9),'DisplayName','Disk');
set(plot1(10),'DisplayName','Motion');
set(plot1(11),'DisplayName','GF');
set(plot1(12),'DisplayName','GF+GS');

% Create ylabel
ylabel('Avg PSNR increment [\%]','FontSize',14,'Interpreter','latex');

% Create xlabel
xlabel('Iterations','FontSize',14,'Interpreter','latex');

% Create title
title('P-Method','FontSize',18,'Interpreter','latex');

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes4,[-10 100]);
box(axes4,'on');
grid(axes4,'on');
hold(axes4,'off');
% Set the remaining axes properties
set(axes4,'FontSize',12,'LineStyleOrder',{'-','--',':','-.'});
% Create legend
legend1 = legend(axes4,'show');
set(legend1,...
    'Position',[0.30654661917289 0.867799687095632 0.420254009580118 0.106716416487053],...
    'NumColumns',6,...
    'Interpreter','latex',...
    'FontSize',12);



end

