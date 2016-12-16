n = 148;
ave = zeros((n-1),1);
list = dir();
for k=1:(n-1)
    sum = 0;
    for i=1:(n-k)
        imgA = im2double(rgb2gray(imread(list(i+2).name)));
        imgB = im2double(rgb2gray(imread(list(i+k+2).name)));
        sub = imgA - imgB;
        sum = sum + norm(sub,'fro');
    end
    ave(k) = sum / (n-k);
end