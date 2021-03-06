factorAxis <- function(x, w, new.args) {
  K <- length(levels(x))
  len <- K*(1-w)+(K-1)*w
  axis.args <- list(side=1, at=(0:(K-1))/len+(1-w)/(2*len), labels=levels(x))
  if (length(new.args)) axis.args[names(new.args)] <- new.args
  do.call("axis", axis.args)
}
factorAxis2d <- function(xx, w, nn) {
  l <- levels(xx)
  K <- length(levels(xx))
  len <- K*(1-w)+(K-1)*w
  m <- ((0:(K-1))/len+(1-w)/(2*len))
  ind <- integer(nn)
  for(k in 1:K) {
    i1 <- ceiling(nn*(k-1)/len)
    i2 <- ceiling(nn*((k-1)/len + (1-w)/len))
    i3 <- ceiling(nn*k/len)
    ind[i1:i2] <- k
    if (k!=K) ind[(i2+1):i3] <- NA
  }
  list(x=seq(0, 1, length=nn), m=m, l=l, ind=ind)
}
