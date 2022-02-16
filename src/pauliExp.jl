using LinearAlgebra
using SymPy

@vars t 

const sigma_x = [complex(0) 1; 1 0]
const sigma_y = [0 complex(0, -1); complex(0, 1) 0]
const sigma_z = [complex(1) 0; 0 -1]

const pauliMatrices = [sigma_x, sigma_y, sigma_z]

sigma_x_exp = eigvecs(sigma_x) * diagm(exp.((t*im) .* eigvals(sigma_x))) * inv(eigvecs(sigma_x))
sigma_y_exp = eigvecs(sigma_y) * diagm(exp.((t*im) .* eigvals(sigma_y))) * inv(eigvecs(sigma_y))
sigma_z_exp = eigvecs(sigma_z) * diagm(exp.((t*im) .* eigvals(sigma_z))) * inv(eigvecs(sigma_z))

println(simplify(sigma_x_exp))
println(simplify(sigma_y_exp))
println(simplify(sigma_z_exp))

