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

"A good implementation from community
    https://exercism.io/tracks/julia/exercises/hamming/solutions/c1c9440f9be54416adc7dbdd6b96057a

    julia also own 'zip' function.
    for a_i, b_i in zip(a, b)
        ans += (a_i != b_i)
    end
    might be better from my perspective
"
function distance_well(a, b)
    if length(a) != length(b)
        throw(ArgumentError(""))
    end
    ans = 0

    for p in zip(a, b)
        ans += (p[1] != p[2])
    end
    return ans
end

"A much better solution from community
    https://exercism.io/tracks/julia/exercises/hamming/solutions/2f48bcb2a0e344a1b4a4520d2b206761

    if a is 'asdjadsj', b is 'akdjaksj'
    collect(a) generate ['a','s','d','j','a','d','s','j']
    collect(b) is balabala

    and collect(a) != collect(b) only return false

    but with '.', computation go by element.
    collect(a) .!= collect(b) return an array:
    Bool[0, 1, 0, 0, 0, 1, 0, 0]

    and sum(this array) is 2.
"
function distance_better(a, b)
    if length(a) != length(b)
        throw(ArgumentError("Length differ"))
    end
    return sum(collect(a) .!= collect(b))
end

"so i know the WORST one is mine."