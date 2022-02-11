using Latexify
using LinearAlgebra
using Symbolics

const sigma_x = [complex(0) 1; 1 0]
const sigma_y = [0 complex(0, -1); complex(0, 1) 0]
const sigma_z = [complex(1) 0; 0 -1]

const pauliMatrices = [sigma_x, sigma_y, sigma_z]

println(pauliMatrices)

# get all tensor products
for (j, sigma_j) in enumerate(pauliMatrices)
    for (k, sigma_k) in enumerate(pauliMatrices)
        println("$j, $k: ", latexify(kron(sigma_j, sigma_k)))
    end # for
end # for