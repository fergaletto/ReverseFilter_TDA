%% Standard deviation 

close all
clear all

limit = 200
Filters = {'RGF','GS','LoG','AMF','RTV','ILS','L0','BF','Disk','Motion','GF','GF+GS'}';
%% TDA

load(['OutPutSSIM/TDA_Filters_bsd300_gamma100.mat']);

PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));


% Select the filters. 
PSNR_Increments = squeeze(PSNR_Increments(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_PSNR_Increments = round(squeeze(std(PSNR_Increments(:, 200, :))),1);
avg_PSNR_Increments= round(squeeze(mean(PSNR_Increments(:, 200, :), 1)),1);

TDA_1 = table( avg_PSNR_Increments, Std_PSNR_Increments)

%% TDA

load(['OutPutSSIM/TDA_Filters_bsd300_gamma50.mat']);

PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));


% Select the filters. 
PSNR_Increments = squeeze(PSNR_Increments(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_PSNR_Increments = round(squeeze(std(PSNR_Increments(:, 200, :))),1);
avg_PSNR_Increments= round(squeeze(mean(PSNR_Increments(:, 200, :), 1)),1);

TDA_2 = table( avg_PSNR_Increments, Std_PSNR_Increments)

%% T

load(['OutPutSSIM/T_Filters_bsd300_gamma100.mat']);

PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));


% Select the filters. 
PSNR_Increments = squeeze(PSNR_Increments(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_PSNR_Increments = round(squeeze(std(PSNR_Increments(:, 200, :))),1);
avg_PSNR_Increments= round(squeeze(mean(PSNR_Increments(:, 200, :), 1)),1);

T_1 = table( avg_PSNR_Increments, Std_PSNR_Increments)

%% P

load(['OutPutSSIM/P_Filters_bsd300_gamma100.mat']);

PSNR_Increments = 100*((GT_PSNR_filter-GT_PSNR_filter(:,1,:))./GT_PSNR_filter(:,1,:));


% Select the filters. 
PSNR_Increments = squeeze(PSNR_Increments(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_PSNR_Increments = round(squeeze(std(PSNR_Increments(:, 200, :))),1);
avg_PSNR_Increments= round(squeeze(mean(PSNR_Increments(:, 200, :), 1)),1);

P = table( avg_PSNR_Increments, Std_PSNR_Increments)

table(TDA_2, TDA_1, T_1, P)
