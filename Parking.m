x=[0,100,100,0];
y=[0,0,100,100];
fill(x,y,'w');
hold on;
d=20;
for i= 0:1
    for j=0:8
x1=[37+(i*d),43+(i*d),43+(i*d),37+(i*d)];
x2=[8+(j*10),8+(j*10),12+(j*10),12+(j*10)];
fill(x1,x2,'w');
    end
end
prk=zeros(9,2);
car=zeros(25,9);
t= input('enter the time for which simulation should run in hours');
inputtime=input('Enter the current time in HHMMSS fomat');
csec=mod(inputtime,10)+(mod(floor(inputtime/10),10));
cmin=mod(floor(inputtime/100),10)+ mod(floor(inputtime/1000),10);
chrs=mod(floor(inputtime/10000),10)+ mod(floor(inputtime/100000),10);
sp=input('enter the speed in units/sec');

for hrs=0:t
    for min=0:60
        for sec=0:60
    x=[0,100,100,0];
    y=[0,0,100,100];
    fill(x,y,'w');
    hold on;
    d=20;
for i= 0:1
    for j=0:8
x1=[37+(i*d),43+(i*d),43+(i*d),37+(i*d)];
x2=[8+(j*10),8+(j*10),12+(j*10),12+(j*10)];
if(prk(j+1,i+1)==1)
    fill(x1,x2,'r');
else
    fill(x1,x2,'w');
end
    end
end
for i=1:25
    if(car(i,1)~=0)
         x1=[car(i,2)-2,car(i,2)+2,car(i,2)+2,car(i,2)-2];
         x2=[car(i,3)-2,car(i,3)-2,car(i,3)+2,car(i,3)+2];
         fill(x1,x2,'r');
    end
end
prb=rand()*10000;
prb=mod(prb,60*30);
if(prb <dn)
    for i= 1:25
        if(car(i,1)==0)
            car(i,1)=1;
            car(i,2)=50;
            car(i,3)=2;
            car(i,4)=parktime();
            car(i,5)=0;
            car(i,6)=0;
            car(i,7)=0;
            car(i,8)=0;
            car(i,9)=0;
          break;       
        end
    end
end
for i=1:25
flag1=1;
flag2=1;
flag3=1;
if(car(i,1)==1)
    for j=0:8
    if(car(i,3)>((10*j)+9.8) && car(i,3)<(10*j)+10.2 &&car (i,2)==50)
        if(prk(j+1,2)==0)
            car(i,9)=2;
	    car(i,3)=(j*10)+10;	
        prk(j+1,2)=1;  
        break;
        elseif(prk(j+1,1)==0)
            car(i,9)=1;         
		car(i,3)=(j*10)+10;	
         prk(j+1,1)=1;  
        break;
        end
    end
    end
   if(car(i,9)==0)
       if(car(i,3)<97) 
       for x=1:25
           if(car(x,1)~=0)
           if((car(x,3)-car(i,3))<5 && ((car(x,3)-car(i,3))>0) && ((car(x,2)-car(i,2))<5)&&((car(x,2)-car(i,2))> -5)&& x~=i)
           flag1=0;
           break;
           end
           if((car(x,3)-car(i,3))<5 && ((car(x,3)-car(i,3))>0) && ((car(x,2)-car(i,2))<8)&&((car(x,2)-car(i,2))> -8)&& x~=i && car(x,1)==2)
           flag1=0;
           break;
           end
           end
           
       end
       if(flag1==1)
               car(i,3)=car(i,3)+sp;
       end
       else
        car(i,1)=0;
       end    
    elseif(car(i,9)==1)
    if(car(i,2)>40)
	car(i,2)=car(i,2)-sp;
	else
	car(i,2)=40;
	car(i,1)=2;
    end
   elseif(car(i,9)==2)
	if(car(i,2)<60)
	car(i,2)=car(i,2)+ sp;
	else
	car(i,2)=60;
	car(i,1)=2;
	end
   end
elseif(car(i,1)==2)
	if(car(i,5)<car(i,4))
	car(i,5)=car(i,5)+1;
	else
	car(i,1)=3;
	end
elseif(car(i,1)==3)
    for x=1:25
           if(car(x,1)~=0)
            if((car(x,3)-car(i,3))<5 && ((car(x,3)-car(i,3))>0) && ((car(x,2)-car(i,2)))<5 &&((car(x,2)-car(i,2)))>-5 && x~=i)
           flag2=0;
           end
           if((car(x,3)-car(i,3))<5 && ((car(x,3)-car(i,3))>0) && ((car(x,2)-car(i,2)))<5 &&((car(x,2)-car(i,2)))>-5 && x~=i)
           flag2=0;
           end
           end
    end
    if(car(i,9)==1)
        if(car(i,2)<50)
        if(flag2==1)   
            car(i,2)=car(i,2)+sp;
        end
        else
        a=car(i,3)/10;    
        car(i,2)=50;
        car(i,9)=0;
        prk(a,1)=0;
        end
    elseif(car(i,9)==2)
        if(car(i,2)>50)
            if(flag2==1)
               if(flag3==1)
                car(i,2)=car(i,2)-sp;
               end
            end
        else
            a=car(i,3)/10;
            car(i,2)=50;
            car(i,9)=0;
            prk(a,2)=0;
        end
    elseif(car(i,9)==0)
     if(car(i,3)<97)
             if(flag2==1)
            car(i,3)=car(i,3)+sp;
             end
       else
            car(i,1)=0;    
     end
     end
end
end
mvi((hrs*60)+(min*60)+sec+1)=getframe;
hold off;
        end
    end
end
movie(mvi,1,30);