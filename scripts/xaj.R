names = c("month", "day", "hour_start", "hour_end", "P")

d1 = fread("G:/Github/MATLAB/hydroModel/XAJ_kong/data/P8901.DAT") %>% set_colnames(names)
d2 = fread("G:/Github/MATLAB/hydroModel/XAJ_kong/data/P8902.DAT") %>% set_colnames(names)
d3 = fread("G:/Github/MATLAB/hydroModel/XAJ_kong/data/P8903.DAT") %>% set_colnames(names)

Ep = fread("G:/Github/MATLAB/hydroModel/XAJ_kong/Ep.txt")
q = fread("G:/Github/MATLAB/hydroModel/XAJ_kong/data/Q89.DAT")
d = cbind(d1[,1:4], P =round((d1$P + d2$P + d3$P)/3, 2), Qobs = q$V4, ETpot = Ep$V1)
rm(d1, d2, d3, q)

library(hydroTools)
library(rtop)

{ 
  r = XAJ(d$P, d$ETpot, opt, area = 686, dt = 6)
  -hydroGOF::NSE(d$Qobs, r$Q)
}

# 尚需汇流模块需要补充
library(latticeGrob)
write_fig({
  plot(d$Qobs, pch = 16, col = "grey60", cex = 0.5)
  lines(r$Q)
}, "a.pdf")
