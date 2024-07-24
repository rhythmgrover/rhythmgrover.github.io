#libraries
library(viridis)
library(scales)    
library(animation)

lln.ani = function(

 FUN = rbinom, p = 0.5, np = 30, pch = 30, col.poly = viridis(20)[10], col.p = viridis(20)[1], ...
) {
  n = ani.options('nmax')
  m = x = NULL
  for (i in 1:n) {
    d = colMeans(matrix(replicate(np, FUN(i, 1, p)), i))
    m = c(m, d)
    x = rbind(x, range(d))
  }
  rg = range(m)
  xax = pretty(1:n)
  for (i in 1:n) {
    dev.hold()
    plot(1:n, ylim = rg, type = 'n', xlab = paste('n =', i), ylab = expression(bar(x)), xaxt = 'n')
    axis(1, xax[xax <= i])
    polygon(c(1:i, i:1), c(x[1:i, 1], x[i:1, 2]), border = NA, col = col.poly)
    points(rep(1:i, each = np), m[1:(i * np)], pch = pch, ...)
    abline(h = p, col = col.p)
    ani.pause()
  }
}


ani.options(interval = 0.01, nmax = 300)

lln.ani(pch = ".")