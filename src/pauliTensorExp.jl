using LinearAlgebra
using SymPy
using Latexify

@vars t 

const sigma_x = [complex(0) 1; 1 0]
const sigma_y = [0 complex(0, -1); complex(0, 1) 0]
const sigma_z = [complex(1) 0; 0 -1]

const pauliMatrices = [sigma_x, sigma_y, sigma_z]

# for (j, sigma_j) in enumerate(pauliMatrices)
#     for (k, sigma_k) in enumerate(pauliMatrices)
#         println("$j, $k:")
#         tensorProduct = kron(sigma_j, sigma_k)
#         expr = eigvecs(tensorProduct) * diagm( exp.((t*im) .* eigvals(tensorProduct)) ) * inv(eigvecs(tensorProduct))
#         println(replace(replace(replace(replace(replace(replace(String(latexify(expr)), "exp"=>"e^"), "("=>"{"), ")"=>"}"), "1.0*I*"=>"i"), "I"=>"i"), "*"=>""))
#     end 
# end

const sigma_x_exp = eigvecs(sigma_x) * diagm(exp.((t*im) .* eigvals(sigma_x))) * inv(eigvecs(sigma_x))
const sigma_y_exp = eigvecs(sigma_y) * diagm(exp.((t*im) .* eigvals(sigma_y))) * inv(eigvecs(sigma_y))
const sigma_z_exp = eigvecs(sigma_z) * diagm(exp.((t*im) .* eigvals(sigma_z))) * inv(eigvecs(sigma_z))

const pauliExp = [sigma_x_exp, sigma_y_exp, sigma_z_exp]

for (j, sigma_j) in enumerate(pauliMatrices)
    for (k, sigma_k) in enumerate(pauliMatrices)
        println("$j, $k:")
        expr = simplify(kron(pauliExp[j], pauliExp[k]))
        println(replace(replace(replace(replace(replace(replace(String(latexify(expr)), "exp"=>"e^"), "("=>"{"), ")"=>"}"), "1.0*I*"=>"i"), "I"=>"i"), "*"=>""))
    end
end