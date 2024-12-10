function [steps,totaldis] = total_dist_and_steps_calc(running_flag, walking_flag, data)
if running_flag == true || walking_flag == true
    %load position data
    all_data = load(data);
    position_data = all_data.Position;
    lat = position_data(:,1);
    lon = position_data(:,2);
    alt = position_data(:,3);


    lat = timetable2table(lat, "ConvertRowTimes", false);
    lon = timetable2table(lon, "ConvertRowTimes", false);
    alt = timetable2table(alt, "ConvertRowTimes", false);


    lat = table2array(lat);
    lon = table2array(lon);


    figure
    plot(lat, lon, "Color", "blue", "LineWidth", 1)
    title("Track")
    xlabel("lat")
    ylabel("lon")


    earthCirc = 24901;
    totaldis = 0;

    for i = 1: (length(lat)-1)
        lat1 = lat(i);
        lat2 = lat(i+1);
        lon1 = lon(i);
        lon2 = lon(i+1);
        [diff,az] = distance(lat1,lon1,lat2,lon2);
        dis = (diff/360)*earthCirc;
        totaldis = totaldis +dis;
    end

    stride_walk = 2.5;
    stride_run = 3;
    totaldis_ft = totaldis*5280;
    if walking_flag == true
        steps = totaldis_ft/stride_walk;
    elseif running_flag == true
        steps = totaldis_ft/stride_run;
    end
end
end