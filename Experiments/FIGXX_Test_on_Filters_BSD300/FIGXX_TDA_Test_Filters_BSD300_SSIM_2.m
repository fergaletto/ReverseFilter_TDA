% TDA method test on BSD300 dataset using 14 different filters. 
% Code by Fernando J. Galetto
% Date Created: 09/11/21
% Last modified: 09/11/21

clear all
close all
% Set the directories. 
DIR = 'all/';
OUTPUT_DIR = './OutPutSSIM/';


if ~exist(OUTPUT_DIR, 'dir')
   mkdir(OUTPUT_DIR)
end


% Set the number of iterations:
ITER = 200;

% set the momentum 
gamma = 1;

% Set mu
eta = 1;
imagefiles = dir([DIR,'*.jpg']);      
nfiles = length(imagefiles);    % Number of files found

PSNR = [];
MSE = [];

%             @(x) wlsFilter(x),, '../WLS/'
% Filter directories: 
FILTER_PATH = {'../RGF/','./','./','../AMF/','../RTV/','../ILS/', '../L0Smooth/', './', '../LLF/','./', './', './', './', './' };
FILTER = {  @(x) RollingGuidanceFilter(x,3,0.05,4),
            @(x) imgaussfilt(x,5), 
            @(x) imfilter(x, fspecial('log', 7, 0.4)), 
            @(x) adaptive_manifold_filter(x,20,0.4),
            @(x) tsmooth(x),
            @(x) double(ILS_LNorm(x,1,0.8,0.0001,4)),
            @(x) L0Smoothing(x,0.01),
            @(x) imbilatfilt(x,0.05,3),
            @(x) double(locallapfilt(im2uint8(x),0.2,10.0))/255,
            %@(x) localExtrema(x,x,7),
            @(x) wiener2(x,[5,5],0.1),
            @(x) imfilter(x,fspecial('disk',3)),
            @(x) imfilter(x,fspecial('motion',20,45)),
            @(x) imguidedfilter(x),
            @(x) imguidedfilter(x,imgaussfilt(x,5))
            
            };

GT_MSE_filter = [];
GT_PSNR_filter = [];
GT_SSIM_filter = [];

for k = 1 : length(FILTER_PATH) % Select the filter 
    addpath(FILTER_PATH{k});            
    f = FILTER{k};
    disp(FILTER_PATH{k})
    
    GT_MSE_image = [];
    GT_PSNR_image = [];
    GT_SSIM_image = [];
        
    % Read the image
    parfor ii=1:nfiles
        currentfilename = imagefiles(ii).name;
        disp(currentfilename);
        I = rgb2gray(double(imread([DIR,currentfilename]))/255);   

        y = f(I);            % Filter the image (input image)
        x = y;               % initialize x
        lmd = 0;
        GT_MSE = immse(x, I);
        GT_PSNR =psnr(x, I);
        GT_SSIM = ssim(x, I); 
        tic
        % The method
        for n=1 : ITER
            fx = f(x);
            h = y - fx;
            d = f(x+h) - fx;  
            x = x + eta*d;
            
   % calculate data and ground truth MSE and PSNR per iteration
            GT_MSE = [GT_MSE, immse(x, I)]; 
            GT_PSNR = [GT_PSNR,psnr(x, I)]; 
            GT_SSIM = [GT_SSIM, ssim(x, I)];

        end
        toc
        % concatenate MSE and PSNR at image level
        GT_MSE_image = [GT_MSE_image;GT_MSE];
        GT_PSNR_image = [GT_PSNR_image;GT_PSNR];
        GT_SSIM_image = [GT_SSIM_image;GT_SSIM];
    end
    % concatenate at filter level 3rd dimension
    % concatenate at filter level 3rd dimension
    GT_MSE_filter = cat(3, GT_MSE_filter, GT_MSE_image);
    GT_PSNR_filter = cat(3, GT_PSNR_filter, GT_PSNR_image);
    GT_SSIM_filter = cat(3, GT_SSIM_filter, GT_SSIM_image);
end

save([OUTPUT_DIR, 'TDA_Filters_bsd300_gamma100.mat'])

