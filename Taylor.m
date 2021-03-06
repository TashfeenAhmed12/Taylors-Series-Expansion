clear all
clc
format long
tolerance=0.0001;
f1=1;		% f1 is Taylor expansion for cosx
f2=0;		% f2 is Taylor expansion for -lnx
x=0.305;    % define the X value 
exact=cos(x)-log(x) %determine the exact value of the function
result=[]           %define an empty variable to store the results

for i=1:100             % ith order approximation
	if mod(i,2)==0		% odd values of i results in sin0*...
	   f1=f1+(-1)^(i/2)*x^i/factorial(i); 
	end
	f2=f2+(1-x)^i/i;
	f=f1+f2;
	error=abs(f-exact);
 	result=[result; f1+f2 error];
    if error<tolerance; break; end	
end
result
