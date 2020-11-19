function to_rna(dna)
    trans = Dict(
        'A' => "U", 'T' => "A",
        'C' => "G", 'G' => "C"
    )
    to_ret = ""
    for to_trans in dna
        if !(to_trans  in ['A', 'C', 'G', 'T'])
            throw(ErrorException("sb"))
        end
        # in julia, * means concat
        # while + in python, cpp balabala...
        to_ret *= trans[to_trans]
    end
    return to_ret
end

"A better function than mine from community
    https://exercism.io/tracks/julia/exercises/rna-transcription/solutions/bad99269197342bf9138de3b08cadc42

    he use y for x in z to generate an array, and then use join function to concat, well
    try-catch emm, i know julia have try-catch the first time
"
function to_rna(dna)
    m = Dict('G' => 'C',
             'C' => 'G',
             'T' => 'A',
             'A' => 'U')
    try
        return join([m[s] for s in dna])
    catch
        throw(ErrorException("bad input"))
    end
end