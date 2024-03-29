function [xvect,xdif,fx,it_cnt]=secant(a,b,eps,fun)
    xvect = [];
    xdif = [];
    fx = [];
    it_cnt = 0;
    
    x_k_previous = a;
    x_k = b;
    
    for i = 1:1000
        f_x_k = feval(fun,x_k);
        f_x_k_previous = feval(fun,x_k_previous);
        x_k_next = x_k-(f_x_k*(x_k-x_k_previous))/(f_x_k-f_x_k_previous);
        
        xvect(i) = x_k_next;
        fx(i) = feval(fun,x_k_next);
        if i > 1
            xdif(i-1) = abs(xvect(i)-xvect(i-1));
        end
        
        if abs(fx(i)) < eps
            it_cnt = i;
            return;
        end
        
        x_k_previous = x_k;
        x_k = x_k_next;
    end
end

