function nb = neighbor(im, pos)
% 计算采样点的标准差               %
% im = 图像， pos = 采样点位置坐标 %
[x, y] = size(im);
[xt, yt] = size(im);
N = length(pos(1,:));
% std_c = zeros(N,1); % 标准差
nb = zeros(25,N);
neighbor = zeros(25,1);
for r = 1:N 
    neighbor = 0;
    % 四个角上的点，邻域取为5*5
    if pos(2,r) <= 2 && pos(1,r) <= 2
        neighbor = reshape(im(1:5, 1:5), 25, 1);
    elseif pos(2,r) <= 2 && pos(1,r) >= x-1
        neighbor = reshape(im(x-4:x, 1:5), 25, 1);
    elseif pos(2,r) >= y-1 && pos(1,r) >= x-1
        neighbor = reshape(im(x-4:x, y-4:y), 25, 1);
    elseif pos(2,r) >= y-1 && pos(1,r) <= 2
        neighbor = reshape(im(1:5, y-4:y), 25, 1);
    % 宽为2pixel的边上，邻域取为5*5
    elseif pos(1,r)<=2
        neighbor = reshape(im(1:5, pos(2,r)-2:pos(2,r)+2), 25, 1);
    elseif pos(1,r)>=x-1
        neighbor = reshape(im(x-4:x, pos(2,r)-2:pos(2,r)+2), 25, 1); 
    elseif pos(2,r)<=2
        neighbor = reshape(im(pos(1,r)-2:pos(1,r)+2, 1:5), 25, 1);
    elseif pos(2,r)>=y-1
        neighbor = reshape(im(pos(1,r)-2:pos(1,r)+2, y-4:y), 25, 1);
    else % 非边缘点，邻域为5*5
        neighbor = reshape(im(pos(1,r)-2:pos(1,r)+2, pos(2,r)-2: pos(2,r)+2), 25, 1);
    end
    nb(:,r) = neighbor;
end