
x = runif(1000,2,10)

# sigmoid function
f1 = function(x,a=0.3,b=0.7,c=4,d=2){
  return(a + (b - a)/(1 + exp(-d * (x - c))))
}

f1(5)
1 - f1(3)

# 4PL function
f2 = function(x,a=0.3,b=0.7,c=4,d=4){
  return(b + (a - b)/(1 + (x / c)^(d)))
}

f2(5)
f2(6)
1 - f2(3)

# plot 1
plot(sort(x),f1(sort(x)),type = "l")
lines(sort(x),f2(sort(x),d=4),col='red')
lines(sort(x),f2(sort(x),d=5),col='green')
lines(sort(x),f2(sort(x),d=6),col='blue')
lines(sort(x),f2(sort(x),d=7),col='orange')
lines(sort(x),f2(sort(x),d=8),col='yellow')

# plot 2
plot(sort(x),f1(sort(x),d = 3),type = "l")
lines(sort(x),f2(sort(x),d=8),col='red')
lines(sort(x),f2(sort(x),d=9),col='green')
lines(sort(x),f2(sort(x),d=10),col='blue')
lines(sort(x),f2(sort(x),d=11),col='orange')
lines(sort(x),f2(sort(x),d=12),col='yellow')
