using CITIfile: rdciti
using Test

s,f = rdciti("hfss_terret_inner_perp.cit")
@testset "RI-style file" begin
    @test size(s) == (2,2,13)
    @test size(f) == (13,)
    @test s[1,1,1] ≈ -0.07517356 - 0.2106189im
    @test s[1,2,4] ≈ 0.9124461 - 0.3167198im
    @test s[end,end,end] ≈ -0.1570225 - 0.3573307im
end
