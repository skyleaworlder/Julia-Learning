function encode(s)
    arr = []
    tmp = Dict("ch" => "", "cnt" => 0)
    for ch in collect(s)
        if ch != tmp["ch"] && tmp["cnt"] == 0
            tmp["ch"], tmp["cnt"] = ch, tmp["cnt"]+1
        elseif ch != tmp["ch"]
            push!(arr, deepcopy(tmp))
            tmp["ch"], tmp["cnt"] = ch, 1
        else
            tmp["cnt"] += 1
        end
    end
    push!(arr, deepcopy(tmp))

    str = ""
    for elem in arr
        if elem["cnt"] != 0 && elem["cnt"] != 1
            str *= string(elem["cnt"])
        end
        str *= string(elem["ch"])
    end
    return str
end



function decode(s)
    arr = []
    tmp = Dict("cnt" => 0, "ch" => "")
    for ch in collect(s)
        if tmp["ch"] == "" && tmp["cnt"] == 0 && (ch > '9' || ch < '0')
            push!(arr, deepcopy(Dict("cnt" => 1, "ch" => ch)))
        elseif '0' <= ch <= '9'
            tmp["cnt"] = tmp["cnt"]*10 + Int64(ch - '0')
        else
            tmp["ch"] = ch
            push!(arr, deepcopy(tmp))
            tmp = Dict("cnt" => 0, "ch" => "")
        end
    end

    str = ""
    for elem in arr
        str *= repeat(elem["ch"], elem["cnt"])
    end
    return str
end