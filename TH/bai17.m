function day = bai17(month, year)
switch month
    case {1, 3, 5, 7, 8, 10, 12}
        day = 31;
    case {4, 6, 9, 11}
        day = 30;
    otherwise
        if mod(year,4) == 0
            day = 29;
        else
            day = 28;
        end
end