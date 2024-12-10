function [cnt_stress, cnt_calm] = definemood(path)
min = 0.1;
max = 1.3;
cnt_calm = 1;
cnt_stress = 1;
mood_data = load(path);
velocity = mood_data.Position.speed';
splitSize = 10;
%Calculate the number of smaller arrays
numArrays = ceil(length(velocity) / splitSize);

% Initialize a cell array to hold the smaller arrays
smallerArrays = cell(1, numArrays);

% Split the array
mean_vel = zeros(1,10);
for i = 1:numArrays
    startIdx = (i-1) * splitSize + 1;
    if i * splitSize <= length(velocity)
        endIdx = i * splitSize;
    else
        endIdx = length(velocity);
    end
    smallerArrays{i} = velocity(startIdx:endIdx);
end

% Display the smaller arraysdisp(smallerArrays);
for i=1:numArrays
     mean_vel(i)=mean(smallerArrays{i});
     if abs(mean_vel(i))>= min && abs(mean_vel(i))< max
         cnt_calm = cnt_calm + 1;
     else
         cnt_stress = cnt_stress + 1;
     end
end
end
 