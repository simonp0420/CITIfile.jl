"""
   s,f = rdciti(fname)

Read the scattering matrix and frequency list from a CITI file. `s` is a
`Complex{Float64}` array of dimension `(n,n,nf)` where `n` is the number of
electrical ports of the scattering matrix, and `nf` is the number of
frequencies.  `f` is a `Float{64}` vector (or range object) of length `nf`
containing the frequencies in GHz.
"""
function rdciti(fname)
    open(fname,"r") do fid

        line = ""
        while isempty(line)
            line = readline(fid)
        end
        occursin("CITIFILE", line) || error("$fname is not a CITI file")

        k = nothing
        while k==nothing
            line = readline(fid)
            k = findfirst("var freq mag", lowercase(line))
        end
        nf = parse(Int, line[1+k[end]:end]) # Number of frequencies in the file

        # Locate first data descriptor:
        search_str = "DATA S["; k = nothing
        while k==nothing
            line = readline(fid)
            k = findfirst(search_str, line)
        end
        data_format = split(line)[end]

        # Count square of the number of ports
        nsq = 0
        while k != nothing
            nsq += 1
            line = readline(fid)
            k = findfirst(search_str, line)
        end
        n = isqrt(nsq) # Number of ports
        n*n == nsq || error("Bad count of S-parameters in $fname")

        s1 = zeros(n,n,nf) # Pre-allocation
        s2 = zeros(n,n,nf)  # Pre-allocation
        f = zeros(nf)  # Pre-allocation

        # Find the frequencies.  There are two types of possible structures:
        # VAR_LIST_BEGIN and SEG_LIST_BEGIN
        while true
            k = findfirst("VAR_LIST_BEGIN", line)
            if k != nothing # gobble up frequencies
                for j = 1:nf
                    f[j] = parse(Float64, readline(fid)) / 1e9
                end
                break
            end

            k = findfirst("SEG_LIST_BEGIN", line)
            if k != nothing # gobble up frequencies
                line = readline(fid)  # Contains "SEG  f1  f2  Nf"
                flims = map(x -> parse(Int,x),split(str[4:end]))
                f = range(flims[1]/1e9, flims[2]/1e9, length=flims[3])
                break
            end

            line = readline(fid)
        end

        # Now loop over the row and column indices of the scattering matrix.
        for irow = 1:n, icol = 1:n
            # Find start of next data block:
            search_str = "BEGIN"; k = nothing
            while k == nothing
                line = readline(fid)
                k = findfirst(search_str, line)
            end
            for ifreq = 1:nf
                line = readline(fid)
                s1[irow,icol,ifreq], s2[irow,icol,ifreq] =
                    map(x->parse(Float64,x),split(line,','))
            end
        end

        if data_format == "RI"
            s = complex.(s1,s2)
        elseif data_format == "MA"
            s = s1 .* cis.(deg2rad.(s2))
        else
            error("Unknown data format $data_format")
        end
        return s, f
    end
end
