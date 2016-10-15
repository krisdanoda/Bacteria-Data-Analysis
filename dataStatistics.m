function result = dataStatistics(data, statistic)


statistic = upper (statistic);

    switch statistic

        case 'MEAN TEMPERATURE'


        case 'MEAN GROWTH'


        case 'STD TEMPERATURE'


        case 'ROWS'


        case 'MEAN COLD GROWTH RATE'

    ind = data{:,1} < 20;

        case 'MEAN HOT GROWTH RATE'

    ind = data{:,1} > 20;

    end
end
