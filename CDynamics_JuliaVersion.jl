#Libraries
using Plots

#Constants
i = complex(0,1);
pi = 3.141

#User Define-ables
##Function (this is probably the only thing you need to change)

f = z->z^5+(0.8+0.8*i)*z^4+z;
#f = z->z^2+i
#f = z->(4*z^3 - z^4)/(4*z - 1)
#f = z->z^2-2

##Depth Of Orbit
depth = 25

##Bail-Out Value
bail = 10^3

##Evaluation Grid ([a,b]x[c,d] with step-length r across each axis)
a = -1
b = 1
c = -1
d = 1
r= 0.005;

#Plot
function plot(f)
    function orb(z)
        o = []
        for i in 1:depth
            try
                z = f(z)
                if abs(z)<bail
                    push!(o,z)
                else
                    break
                end
            catch e
                break
            end
        end
        return(length(o))
    end
    A = [orb(complex(j,i)) for i in c:r:d, j in a:r:b];
    
    heatmap(A; c = cgrad([:black, :white]), aspect_ratio=:equal, axis=([], false), colorbar=false)
end;

plot(f)


