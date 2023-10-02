
%adding noise by gaussian inbuilt function
%meanNoise = 0;
%varianceNoise = 0.05;
%noise_im = imnoise(org_im, 'gaussian', meanNoise, varianceNoise);

%showing noised image



%applying Gaussian smoothing to filter the current noised image
%cleaned_im = imgaussfilt(noise_im, sigma);
%showing the cleaned image
%subplot(1,2,2);
%imshow(cleaned_im);
%title(['filter by LD with sigma = ' num2str(sigma)]); %for showing corresponding sigma at each image
%calculating PSNR

org_im = imread('bw.jpg');
sigma = 2; %taking diifferent aalues of sigma
%psnr_value
%noisyim=imnoise(org_im,'gaussian',0.05);  % adding Gaussian noise of mean zero and variance 0.01
%noisyim=imnoise(org_im,'salt & pepper',0.05);
noisyim=imnoise(org_im,'speckle',0.05);
%noisyim=imnoise(org_im,'poisson');
subplot(1, 2, 1);
imshow(noisyim);
title('NoisedIm(speckle)');
cleaned_im = imgaussfilt(noisyim, sigma);
psnr_value = psnr(cleaned_im, noisyim);
subplot(1,2,2);
imshow(cleaned_im);
combined_title = ['LD sigma:' num2str(sigma) ', PSNR:' num2str(psnr_value)];
title(combined_title);