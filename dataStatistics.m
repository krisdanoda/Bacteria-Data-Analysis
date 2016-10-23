function result = dataStatistics(data, statistic)

statistic = upper (statistic);

    switch statistic

        case 'MEAN TEMPERATURE'

    result = mean ( data{:,1} ) ;

        case 'MEAN GROWTH'

    result = mean ( data{:,2} ) ;

        case 'STD TEMPERATURE'

    result = std ( data {:, 1} ) ;

        case 'ROWS'

    result = height ( data );

        case 'MEAN COLD GROWTH RATE'

    ind = data{:,1} < 20;
    disp ( data (ind, :) )
    result = mean( data {ind, 2} ) ;

        case 'MEAN HOT GROWTH RATE'

    ind = data{:,1} > 20;
    disp ( data (ind, :) );
    result = mean( data {ind, 2} ) ;

    end
end