using Plots, LinearAlgebra

# Need to rotate by theta and scale by r
theta = pi*0.25
r = 0.75

function w1(x,y)
    nx = []
    ny = []
    for i in 1:2
        push!(nx, )
end


x = [0.0 0.0]
y = [0.0 1.0]
scatter(x, y, xaxis =("Fractal Tree",(-5,5),  -5:0.5:5, font(5, "Courier")),label = false, mc=:blue, yaxis =((-0.1,5),  0:0.5:5, font(5, "Courier")))
