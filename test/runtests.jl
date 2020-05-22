using SafeTestsets
@safetestset "MA Tests" begin include("MA_tests.jl") end
@safetestset "RI Tests" begin include("RI_tests.jl") end
