"Your optional docstring here"
function distance(a, b)
    hamming_dist = 0
    if length(a) != length(b)
        throw(ArgumentError("len a not eqaul len b"))
    end

    for i in 1:length(a)
        if a[i] != b[i]
            hamming_dist += 1
        end
    end
    return hamming_dist
end