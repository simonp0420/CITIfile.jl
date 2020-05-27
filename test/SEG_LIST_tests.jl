using CITIfile: rdciti
using Test

s,f = rdciti("seg_list.cit")
@testset "SEG_LIST-style file" begin
    @test size(s) == (1,1,10)
    @test size(f) == (10,)
    @test f == range(1, 4, length=10)
    @test s[1,1,1] ≈ complex(0.86303E-1,-8.98651E-1)
    @test s[1,1,end] ≈ complex(-7.78350E-1,5.72082E-1)
end
