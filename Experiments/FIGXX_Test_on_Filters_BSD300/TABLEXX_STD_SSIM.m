%% Standard deviation 

close all
clear all

limit = 200
Filters = {'RGF','GS','LoG','AMF','RTV','ILS','L0','BF','Disk','Motion','GF','GF+GS'}';
%% TDA

load(['OutPutSSIM/TDA_Filters_bsd300_gamma100.mat']);



% Select the filters. 
SSIM = squeeze(GT_SSIM_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_SSIM = round(squeeze(std(SSIM(:, 200, :))),2);
avg_SSIM= round(squeeze(mean(SSIM(:, 200, :), 1)),2);

TDA_1 = table( avg_SSIM, Std_SSIM)

%% TDA

load(['OutPutSSIM/TDA_Filters_bsd300_gamma50.mat']);

% Select the filters. 
SSIM = squeeze(GT_SSIM_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_SSIM = round(squeeze(std(SSIM(:, 200, :))),2);
avg_SSIM= round(squeeze(mean(SSIM(:, 200, :), 1)),2);

TDA_2 = table( Filters, avg_SSIM, Std_SSIM)

%% T

load(['OutPutSSIM/T_Filters_bsd300_gamma100.mat']);

% Select the filters. 
SSIM = squeeze(GT_SSIM_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_SSIM = round(squeeze(std(SSIM(:, 200, :))),2);
avg_SSIM= round(squeeze(mean(SSIM(:, 200, :), 1)),2);

T_1 = table( avg_SSIM, Std_SSIM)

%% P

load(['OutPutSSIM/TDA_Filters_bsd300_gamma100.mat']);

% Select the filters. 
SSIM = squeeze(GT_SSIM_filter(:,1:limit,[1,2,3,4,5,6,7,8,11,12,13,14]));

Std_SSIM = round(squeeze(std(SSIM(:, 200, :))),2);
avg_SSIM= round(squeeze(mean(SSIM(:, 200, :), 1)),2);

P = table( avg_SSIM, Std_SSIM)

table(TDA_2, TDA_1, T_1, P)