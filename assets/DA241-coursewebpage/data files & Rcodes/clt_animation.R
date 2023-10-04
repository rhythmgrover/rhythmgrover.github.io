#libraries
library(viridis)
library(scales)
library(animation)

clt.ani = function(
  obs = 300, FUN = rexp, mean = 1, sd = 1, col = viridis(4),
  mat = matrix(1:2, 2), widths = rep(1, ncol(mat)), heights = rep(1, nrow(mat)), xlim, ...
) {
  nmax = ani.options('nmax')
  x = matrix(nrow = nmax, ncol = obs)
  for (i in 1:nmax) x[i, ] = apply(matrix(replicate(obs, FUN(i)), i), 2, mean)
  layout(mat, widths, heights)
  if (missing(xlim)) xlim = quantile(x, c(.005, .995))
  if (is.null(mean)) mean = NA
  if (is.null(sd)) sd = NA
  for (i in 1:nmax) {
    dev.hold()
    hist(x[i, ], freq = FALSE, main = '',
         xlab = substitute(italic(bar(x)[i]), list(i = i)), col = col[1], xlim = xlim)
    lines(density(x[i, ]), col = col[2])
    if (!is.na(mean) && !is.na(sd))
      curve(dnorm(x, mean, sd/sqrt(i)), col = col[3], lty = 2, add = TRUE)
    ani.pause()
    }
  }

#calling the function
clt.ani()