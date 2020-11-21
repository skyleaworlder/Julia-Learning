"yells do not contain lowercase char
    but contain an uppercase char at least
"
function test_yell(input)
    lst1 = ['a' <= ch <= 'z' for ch in input]
    lst2 = ['A' <= ch <= 'Z' for ch in input]
    return sum(lst1) == 0 && sum(lst2) > 0
end

"question must be finished with '?'
    trim is need!!!
"
function test_question(input)
    input = rstrip(input)
    return length(input) != 0 && input[length(input)] == '?'
end

"sorry, i don't know
    how to express unvisible char in julia
"
function test_silences(input)
    flag = true
    for ch in input
        !(ch in ['\n', '\r', '\t', ' ']) && (flag = false)
    end
    return flag
end

function bob(stimulus)
    "this is the first, cos i don't store test_xxx function return value."
    (test_question(stimulus) & test_yell(stimulus)) && return "Calm down, I know what I'm doing!"
    test_question(stimulus) && return "Sure."
    test_yell(stimulus) && return "Whoa, chill out!"
    test_silences(stimulus) && return "Fine. Be that way!"
    return "Whatever."
end



"some awesome function used in community
    f*ck!
    such as filter, endswith, all, isuppercase, isletter, isspace
"
function bob_func(stimulus)
    despaced = filter(!isspace, stimulus)
    if length(despaced) == 0
        return "Fine. Be that way!"
    else
        query = endswith(despaced, "?")
        letters = filter(isletter, stimulus)
        upper = length(letters) > 0 && all(isuppercase, letters)

        if upper && query
            return "Calm down, I know what I'm doing!"
        elseif upper
            return "Whoa, chill out!"
        elseif query
            return "Sure."
        else
            return "Whatever."
        end
    end
end

"the most star.
    really a good job...
    f*ck! isempty.
"
function bob_most_star(stimulus::AbstractString)::AbstractString
    s = strip(stimulus)
    silence = isempty(s)
    question = endswith(s, '?')
    yelling = s == uppercase(s) && any(isuppercase, s)

    if yelling && question
        "Calm down, I know what I'm doing!"
    elseif yelling
        "Whoa, chill out!"
    elseif question
        "Sure."
    elseif silence
        "Fine. Be that way!"
    else
        "Whatever."
    end
end