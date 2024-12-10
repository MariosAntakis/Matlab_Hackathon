function [calories] = calories_burned(weight, duration, activity)

if(activity=="running")
    met_value=9.0; %Mean Metabolic equivalent
elseif(activity=="walking")
    met_value=3.3; %Metabolic equivalent for moderate speed
elseif(activity=="sitting")
    met_value=1.5; %mean Metabolic equivalent for resting and light tasks or during sleep
end

calories = (met_value * 3.5 * weight * duration) / 200;
end