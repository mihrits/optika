# Moorits Mihkel Muru 2020 Tartu Ülikool
# Skript difraktsioonivõre mustri joonistamiseks ühes dimensioonis

using Plots

u(b,λ,sϕ) = π*b*sϕ/λ

I(I0,b,d,λ,N,sϕ) = I0 * (sin(u(b,λ,sϕ)) / u(b,λ,sϕ))^2 * (sin(N*u(d,λ,sϕ)) / sin(u(d,λ,sϕ)))^2

I_mod(I0,b,d,λ,N,sϕ) = N^2 * I0 * (sin(u(b,λ,sϕ)) / u(b,λ,sϕ))^2

sϕ = -0.005:0.000001:0.005
I0 = 1
b = 200e-6
d = 600e-6
λ = 550e-9
N = 8

I1 = I.(I0, b, d, λ, N, sϕ)
I1_mod = I_mod.(I0, b, d, λ, N, sϕ)


plot(sϕ, I1, leg=false)
plot!(sϕ, I1_mod, leg=false, s=:dash)
savefig("difraction_N8_b200_d600.pdf")
