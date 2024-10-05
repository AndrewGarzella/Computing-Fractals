using Plots, LinearAlgebra

function w1(x,y)
    # w1(x) = Ax +b
    # A = [0.5 0; 0 0.5]
    # b = [0 0.5]
    nx = []
    ny = []
    for i in 1:3
        push!(nx ,0.5*x[i])
        push!(ny ,0.5*y[i]+0.5 )
    end
    return (nx,ny)
end
 
function w2(x,y)
    # w2(x) = Ax +b
    # A = [0.5 0; 0 0.5]
    # b = [0 0]
    nx = []
    ny = []
    for i in 1:3
        push!(nx ,0.5*x[i])
        push!(ny ,0.5*y[i])
    end
    return (nx,ny)
end
function w3(x,y)
    # w2(x) = Ax +b
    # A = [0.5 0; 0 0.5]
    # b = [0.5 0]
    nx = []
    ny = []
    for i in 1:3
        push!(nx ,0.5*x[i]+0.5)
        push!(ny ,0.5*y[i])
    end
    return (nx,ny)
end
function W(x,y)
    a = w1(x,y)
    b = w2(x,y)
    c = w3(x,y)
    return (a, b, c)
end
function ComputeTri(x, y, Iters)
    (a,b,c) = W(x,y)
    AddTooScat(a[1],a[2],1)
    AddTooScat(b[1],b[2],2)
    AddTooScat(c[1],c[2],3)
    if Iters >= 1
        ComputeTri(a[1],a[2], Iters-1)
        ComputeTri(b[1],b[2], Iters-1)
        ComputeTri(c[1],c[2], Iters-1)
    end
    AddTooScat(1,1,1)
    # for i in 1:Iters
        

    #     # scatter!(a[1], a[2], label = false,mc=:green)
    #     # scatter!(b[1], b[2], label = false, mc=:yellow)
    #     # scatter!(c[1], c[2], label = false, mc=:red)
    # end
    # AddTooScat(0,0,1)

end
function AddTooScat(x, y, Color)
    if Color == 1
        scatter!(x,y, label = false, mc=:blue)
    elseif Color == 2
        scatter!(x,y, label = false, mc=:yellow)
    elseif Color == 3
        scatter!(x,y, label = false, mc=:red)
    end

end

x0 = [0 0 1]
y0 = [1 0 0]
x = [0.5 0.5 0.0]
y = [0.5 0.0 0.5]
# a = w1(x,y)
# b = w2(x,y)
# c = w3(x,y)
# (a,b,c) = W(x,y)
scatter(x, y, xaxis =("Sierpinski Triangle",(-0.1,1),  0:0.25:1, font(5, "Courier")),label = false, mc=:blue, yaxis =((-0.1,1),  0:0.25:1, font(5, "Courier")))
scatter!(x0, y0, label = false, mc=:black)
ComputeTri(x, y, 5)

#   git config --global user.email "you@example.com"
#   git config --global user.name "Your Name"

