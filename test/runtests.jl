using SafeTestsets
@safetestset "MA Tests" begin include("MA_tests.jl") end
@safetestset "RI Tests" begin include("RI_tests.jl") end
@safetestset "SEG_LIST Tests" begin include("SEG_LIST_tests.jl") end
