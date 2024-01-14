library(lattice)

xyplot(Sepal.Width ~ Sepal.Length | Species,
       data = iris,
       panel = function(...) {
         panel.xyplot(...)
         panel.text(x = 7.5,
                    y = 4.5,
                    labels = "iris data")
         panel.grid()
       }
)

xyplot(Sepal.Width ~ Sepal.Length | Species,
       data = iris,
       panel = function(x, y, ...) {
         panel.xyplot(x, y, ...)
         panel.loess(x, y, ...)
       }
       )

library(effects)

mod <- lm(Sepal.Width ~ Sepal.Length * Species,
          data = iris)

eff <- effect("Sepal.Length * Species", mod)
plot(eff, ci.style = "lines")


