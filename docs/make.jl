push!(LOAD_PATH,"../src/")
using Documenter
using CITIfile

makedocs(
    sitename = "CITIfile",
    format = Documenter.HTML(),
    modules = [CITIfile]
)

deploydocs(
    repo = "github.com/simonp0420/CITIfile.jl.git"
)
