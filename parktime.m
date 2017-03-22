function [ time ] = parktime()
x= rand();
x=x*10000;
x=mod(x,10);
if(x<4)
    time=5;
      elseif(x>3 && x<8)
        x= rand();
        x=x*10000;
        x=mod(x,55);
        time=x+5;
elseif(x>7)
    x= rand();
    x=x*10000;
    x=mod(x,60);
    time=60+x;
end


end

