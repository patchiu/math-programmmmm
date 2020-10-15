###numerical integration




#############################################
library(pracma)


fun <- function(x) 1/(x^4+x^2+0.9)




for (m in c("Kron", "Clen", "Simp")) {
  Q <- integral(fun, -1, 1, reltol = 1e-12, method = m)
  cat(m, Q, "\n")}