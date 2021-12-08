% Created 18/06/2021
% Fernando J. Galetto


close all
clear all

% Filter to reverse
f= @(in) imfilter(in,fspecial('motion',20,45))

% number of iteration
max_iter = 500;

% load image
imgname = 'emma_small.png';
I = im2double(imread(imgname));
I=imresize(I, 0.7);
I= max(min(I, 1),0);
[H, W, C] = size(I);

 
   
PSNR = zeros(max_iter,1);

data = zeros(6,max_iter);      

% Input image. 
y=f(I);

% set learning rate    
alpha = 1;
        
%% Method GD (Vanilla TDA)
x= y;
for n=1 : max_iter
    fx = f(x);
    h = y - fx;
    g = f(x+h) - fx;  
    x = x + alpha .* g;         
    PSNR(n) = psnr(x, I); 
end

data(1,:) = PSNR;
x_GD = x;    
%% Method GD with momentum.         
x= y;
v = 0;
beta = 0.9;

for n=1 : max_iter
    fx = f(x);
    h = y - fx;
    g = (f(x+h) - fx);  
    v = beta.*v+alpha.*g;
    x = x + v;
    PSNR(n) = psnr(x, I); 
end
data(2,:) = PSNR;   
x_MGD = x;        
%% Method Nesterov acceleration. 
x= y;
v = 0;
beta = 0.9;

for n=1 : max_iter
    xhat = x + beta .* v;
    fxhat = f(xhat);
    h = y - fxhat;
    g = (f(xhat+h) - fxhat);  
    v = beta.*v+alpha.*g;
    x = x + v;

    PSNR(n) = psnr(x, I); 

end
data(3, :) = PSNR;
x_NAG = x;    

%% RMSProp        
x= y;
v = 0;
beta = 0.9;

for n=1 : max_iter
    fx = f(x);
    h = y - fx;
    g = f(x+h) - fx; 
    v = beta.*v+(1-beta).*(g.^2); % running average. 
    x = x + alpha/100./((v+eps).^(0.5)).*g;  
    PSNR(n) = psnr(x, I); 
end
data(4,:) = PSNR;   
x_RMSProp = x; 
%% ADAM
x= y;
v = 0;
M=0;
beta1 = 0.9;
beta2= 0.999;

for n=1 : max_iter
    fx = f(x);
    h = y - fx;
    g = f(x+h) - fx;

    M = beta1*M+(1-beta1)*g;
    v = beta2.*v+(1-beta2).*(g.^2);

    Mhat = M./(1-beta1);
    vhat = v./(1-beta2);     
    x = x + alpha/10./(vhat.^(0.5)+10^-8).*Mhat;
    PSNR(n) = psnr(x, I); 
end

data(5,:) = PSNR;
x_ADAM = x; 

%% Adadelta
x= y;
v = 0;
beta = 0.9;
Edx = 0;
Eg2 = 0;
Edx=0;
rmsdx = 0;
update = 0;
for n=1 : max_iter
    fx = f(x);
    h = y - fx;
    g = f(x+h) - fx;

    Eg2 = beta.*Eg2+(1-beta).*(g.^2); % running average. 
    rmsg = sqrt(Eg2+eps);

    update = rmsdx./rmsg.*g;

    dx = h;

    Edx = beta.*Edx+(1-beta).*(dx.^2); % running average. 

    rmsdx=sqrt(Edx+eps);

    x = x +update;

    PSNR(n) = psnr(x, I); 

end

data(6,:) = PSNR;
x_Adadelta = x; 

figure(1)
imshow([I, y, x_GD, x_MGD; x_NAG, x_RMSProp, x_ADAM, x_Adadelta])

%%%% PLOT PSNR %%%%

METHODS = {'GD', 'MGD', 'NAG', 'RMSprop', 'ADAM', 'Adadelta'};

   

    figure(2)
    minMSE = 0;
    for method=1:6
            PSNR = squeeze(data(method,:));
            plot(PSNR, 'linewidth', 1)
%             if(minMSE<max(PSNR, [], 'all'))
%                 minMSE = max(PSNR, [], 'all');
%             end
            hold on
    end




%         ylim( [PSNR(1), minMSE+(minMSE-SSIM(1))*0.05])
        xlim([0, max_iter])
        xlabel('Iterations', 'Interpreter', 'latex',  'FontSize', 12);
        ylabel( 'PSNR [db]', 'Interpreter', 'latex', 'FontSize', 12); 
        legend('GD', 'MGD', 'NAG', 'RMSprop', 'ADAM', 'Adadelta','FontSize', 10,'Interpreter', 'Latex','NumColumns',1, 'Location', 'northwest'); 

        grid on


        