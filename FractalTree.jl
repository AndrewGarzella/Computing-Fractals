using Plots, LinearAlgebra

# Theta is how much we rotate by each iteration, and r is how much we scale by each iteration.
theta = pi*0.25
r = 0.75

function w1(x,y, rot, size)
    
    nx = [x + size*(-sin(rot))]
    ny = [y + size*(cos(rot))]
    rot = rot + theta
    size = size * r
    return( nx,ny,rot,size)
end 
function w2(x,y, rot, size)
    nx = [x + size*(-sin(rot))]
    ny = [y + size*(cos(rot))]
    nrot = rot + 7*theta
    nsize = size * r   
    return( nx,ny,nrot,nsize)
end 
function W(x,y,vrot,vsize)
    a = w1(x,y,vrot,vsize)
    b = w2(x,y,vrot,vsize)
    return (a,b)
end
function ComputeFractalTree(x, y, vrot,vsize,color ,Iters)
    (a,b) = W(x, y, vrot,vsize)
    AddTooScat(a[1],a[2],color)
    if Iters >= 1
        ComputeFractalTree(a[1][1],a[2][1],a[3],a[4],1, Iters-1)
        ComputeFractalTree(b[1][1],b[2][1],b[3],b[4],3, Iters-1)
    end
    AddTooScat(0,0,4)
end
function AddTooScat(x, y, Color)
    if Color == 1
        scatter!(x,y, label = false, mc=:blue)
    elseif Color == 2
        scatter!(x,y, label = false, mc=:yellow)
    elseif Color == 3
        scatter!(x,y, label = false, mc=:red)
    elseif Color == 4
        scatter!(x,y, label = false, mc=:black)
    end
end

x = [0.0]
y = [0.0]

scatter(x, y, xaxis =("Fractal Tree",(-3.5,3.5),  -3.5:0.5:3.5, font(5, "Courier")),label = false, mc=:black, yaxis =((-0.1,3.5),  0:0.5:5, font(5, "Courier")))
vrot = 0
vsize = 1
ComputeFractalTree(x[1],y[1],vrot,vsize,4,7)
