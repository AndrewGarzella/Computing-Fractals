using Plots, LinearAlgebra



function CompCantor(x)
    nx = []
    
    for i in 1:size(x)[1]
        push!(nx, w1(x[i]))
        push!(nx, w2(x[i]))        
    end
    return nx
end
function w1(a)
    return 1/3*a
end
function w2(a)
    return 1/3*a + 2/3
end

function addtoScat(C,T)
    scatter!(C, T,label = false)
end

function CPlot(C,T,Iters)
    for i in 0:Iters-1
        T[1] = T[1]+1
        C = CompCantor(C)
        addtoScat(C,T)
    end
    T[1] = T[1]+1
    C = CompCantor(C)
    addtoScat(C,T)
end

C = [0.0,1.0]
T = [0]
Iters = 10
scatter(C, T, xaxis = ("Cantor Set",(0,1),  0:1/9:1, font(5, "Courier")),label = false)
CPlot(C,T,Iters - 1)
