function score(x, y)
    dist = sqrt(x^2 + y^2)
    if dist <= 1
        return 10
    elseif dist <= 5
        return 5
    elseif dist <= 10
        return 1
    else
        return 0
    end
end

" A better way to illustrate condition from community:
    https://exercism.io/tracks/julia/exercises/darts/solutions/d779c302e1a942fb9505620cb9de7034

    if x <= 1 ...
    elseif 1 < x <= 5 ...
    elseif 5 < x <= 10

    julia support it.
"
function score_better(x, y)
    r = sqrt((x)^2 + (y)^2)
    if r <= 1 return 10
    elseif 1 < r <= 5 return 5
    elseif 5 < r <= 10 return 1
    else return 0
    end
end

" In fact, hypot function means sqrt(x^2 + y^2)
    e.g. hypot(3, 4) = 5.0

    and can use pipe (called as this maybe):
    [statement_1] && [statement_2]
    [statement_1] || [statement_2]

    the following function from community:
        https://exercism.io/tracks/julia/exercises/darts/solutions/f2efeef4fb3742e485a961cfa1d42701
    which has the most stars.

    while the first means:
        if statement_1 is true, then statement_2
        else nothing, return boolean value of statement_1
    the second means:
        if statement_1 is true, return true
        else statement_2

    '&&' is about condition, while '||' execute at least one statement.
"
function score(x, y)
    r = hypot(x, y)
    r > 10 && return 0
    r > 5  && return 1
    r > 1  && return 5
    return 10
end