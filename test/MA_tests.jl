using CITIfile: rdciti
using Test

s,f = rdciti("Wire_mesh_knit1_scan_th045deg_ph345deg.cit")
@testset "MA-style file" begin
    @test size(s) == (4,4,12)
    @test size(f) == (12,)
    @test abs(s[1,1,1]) ≈ 9.993692243725852E-01
    @test rad2deg(angle(s[1,1,1])) ≈  1.776698273015162E+02
    @test abs(s[1,1,end]) ≈ 9.869994561177106E-01
    @test rad2deg(angle(s[1,1,end])) ≈ 1.517921770116529E+02
    @test abs(s[1,3,3]) ≈ 3.261798828943794E-02
    @test rad2deg(angle(s[1,3,3])) ≈ 8.669814811044907E+01
    @test abs(s[3,1,3]) ≈ 3.263875888744300E-02
    @test rad2deg(angle(s[3,1,3])) ≈ 8.703675893037459E+01
    @test abs(s[end,end,end]) ≈ 8.073910702105189E-01
    @test rad2deg(angle(s[end,end,end])) ≈ 1.474292363421648E+02
end
