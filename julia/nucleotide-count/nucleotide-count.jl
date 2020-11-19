"""
    count_nucleotides(strand)

The frequency of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    store = Dict(
        'A' => 0, 'C' => 0,
        'G' => 0, 'T' => 0
    )
    print(strand)
    for ch in strand
        if ch == 'A' || ch == 'C' || ch == 'G' || ch == 'T'
            store[ch] += 1
        else
            throw(DomainError("DomainError","not in ACGT"))
        end
    end
    return store
end
