# (PART) Das ganze Spiel in R {-}

# Regressionsoutput

::: {.rmdwarning}
Dieses Kapitel ist gerade in Bearbeitung. &#128119;
:::

<div class="yt-container">
  <iframe class="responsive-iframe" src="https://www.youtube.com/embed/NEfjirpOj7s?rel=0&autoplay=0&showinfo=0" frameborder="0"></iframe>
</div>



1. Datengrundlage


```r
str(data)
```

```
## 'data.frame':	88 obs. of  4 variables:
##  $ preis       : num  300000 370000 191000 195000 373000 ...
##  $ wohnflaeche : num  226 193 128 135 234 ...
##  $ schlafzimmer: int  4 3 3 3 4 5 3 3 3 3 ...
##  $ grundstueck : num  569 920 483 427 566 ...
```

2. Modellformel definieren


```r
formula <- preis ~ wohnflaeche + I(schlafzimmer > 4) + grundstueck
```

3. Die R Funktion `lm()` mit den Daten und der Modellformel aufrufen


```r
model <- lm(formula = formula, data = data)
```

4. Die `summary()` Funktion liefert das Ergebnis


```r
summary(model)
```

```
## 
## Call:
## lm(formula = formula, data = data)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -149356  -27653   -3891   24175  202625 
## 
## Coefficients:
##                          Estimate Std. Error t value Pr(>|t|)    
## (Intercept)             5.384e+04  2.339e+04   2.302  0.02380 *  
## wohnflaeche             1.134e+03  1.272e+02   8.909 9.03e-14 ***
## I(schlafzimmer > 4)TRUE 1.049e+05  2.233e+04   4.699 1.01e-05 ***
## grundstueck             2.019e+01  6.253e+00   3.229  0.00177 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 53990 on 84 degrees of freedom
## Multiple R-squared:  0.7333,	Adjusted R-squared:  0.7237 
## F-statistic: 76.97 on 3 and 84 DF,  p-value: < 2.2e-16
```

