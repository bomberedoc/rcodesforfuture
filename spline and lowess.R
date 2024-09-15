
library(lattice)
library(latticeExtra)

data(UN,package = "carData")

xyplot(pctUrban ~ log(ppgdp), data = UN, col.line = "black",
       type = c("p","smooth"), span = 0.27, degree = 1, family = "gaussian")
xyplot(pctUrban ~ log(ppgdp), data = UN, type = c("p", "smooth"),
       span = 0.27, degree = 1, family = "gaussian")
xyplot(pctUrban ~ log(ppgdp), data = UN, type = c("p", "smooth"),
       span = 2/3, degree = 2, family = "gaussian")
xyplot(pctUrban ~ log(ppgdp), data = UN, type = c("p", "smooth"),
       span = 2/3, degree = 2, family = "symmetric")
xyplot(pctUrban ~ log(ppgdp), data = UN, type = c("p", "smooth"),
       span = 2/3, degree = 0, family = "symmetric")

UN.sub <- subset(UN, !is.na(ppgdp) & !is.na(pctUrban)) # cannot handle NA
(fm.ss <- with(UN.sub, smooth.spline(log(ppgdp), pctUrban, df = 6))) # lambda controlled by df

(fm.ss.gcv <- with(UN.sub, smooth.spline(log(ppgdp), pctUrban))) # lambda chosen by GCV

xyplot(pctUrban ~ log(ppgdp), data = UN) + layer(panel.lines(predict(fm.ss)))

xyplot(pctUrban ~ log(ppgdp), data = UN) + layer(panel.lines(predict(fm.ss.gcv)))

fm <- lm(pctUrban ~ log(ppgdp), data = UN)
xyplot(abs(residuals(fm)) ~ fitted(fm)) + layer(panel.smoother(x, y, method = "loess"))
