var documenterSearchIndex = {"docs":
[{"location":"#CITIfile.jl-1","page":"CITIfile.jl","title":"CITIfile.jl","text":"","category":"section"},{"location":"#","page":"CITIfile.jl","title":"CITIfile.jl","text":"Tools for reading CITI files. The CITI file format is commonly used in microwave engineering, for storing measured or computed scattering parameters of multiport networks.  ","category":"page"},{"location":"#","page":"CITIfile.jl","title":"CITIfile.jl","text":"rdciti(fname)","category":"page"},{"location":"#CITIfile.rdciti-Tuple{Any}","page":"CITIfile.jl","title":"CITIfile.rdciti","text":"s,f = rdciti(fname)\n\nRead the scattering matrix and frequency list from a CITI file. s is a Complex{Float64} array of dimension (n,n,nf) where n is the number of electrical ports of the scattering matrix, and nf is the number of frequencies.  f is a Float{64} vector (or range object) of length nf containing the frequencies in GHz.\n\n\n\n\n\n","category":"method"}]
}
