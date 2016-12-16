%h = 480;
%w = 854;
n = 148;
N = n*(n-1)/2;
frmDiff = zeros(N,1);
%A = zeros(h,w,N);
list = dir();
c = 0; %index count
% dis-smilarity matrix
Z = zeros(n,n);
for i=1:n
    imgA = im2double(rgb2gray(imread(list(i+2).name)));
    for j=(i+1):n
        imgB = im2double(rgb2gray(imread(list(j+2).name)));
        c = c+1;
        sub = imgA-imgB;
        frmDiff(c) = norm(sub,'fro');
%        A(:,:,c) = sub;
        Z(i,j) = frmDiff(c);
        Z(j,i) = frmDiff(c);
    end
end