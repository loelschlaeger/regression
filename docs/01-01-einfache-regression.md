# (PART) Das Modell {-}

# Einfache Regression

::: {.rmdwarning}
Dieses Kapitel ist gerade in Bearbeitung. &#128119;
:::

## Was ist die Idee?

Wir möchten die Beziehung zwischen zwei Merkmalen verstehen. Zum Beispiel: Welchen Einfluss hat die Wohnfläche auf den Wert eines Hauses? Dafür brauchen wir Daten. Zum Glück haben wir einen Datensatz vorliegen mit Verkaufspreisen von Häusern in Boston 1990:^[Zugegeben, die Daten sind alt und wahrscheinlich nicht repräsentativ für Deutschland, aber für eine Demonstration genügen sie.] **preis** ist im Datensatz der Verkaufspreis in Dollar, **wohnflaeche** die Wohnfläche in Quadratmetern, **schlafzimmer** die Anzahl an Schlafzimmern und **grundstueck** die Grundstücksfläche in Quadratmetern.



<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["preis"],"name":[1],"type":["dbl"],"align":["right"]},{"label":["wohnflaeche"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["schlafzimmer"],"name":[3],"type":["int"],"align":["right"]},{"label":["grundstueck"],"name":[4],"type":["dbl"],"align":["right"]}],"data":[{"1":"300000","2":"226.4976","3":"4","4":"569.12402"},{"1":"370000","2":"192.8667","3":"3","4":"920.01881"},{"1":"191000","2":"127.6488","3":"3","4":"483.09581"},{"1":"195000","2":"134.5236","3":"3","4":"427.35398"},{"1":"373000","2":"233.5582","3":"4","4":"566.24403"},{"1":"466275","2":"255.8550","3":"5","4":"795.80744"},{"1":"332500","2":"192.0306","3":"3","4":"836.12736"},{"1":"315000","2":"160.8152","3":"3","4":"576.92788"},{"1":"206000","2":"164.1597","3":"3","4":"557.41824"},{"1":"240000","2":"175.5867","3":"3","4":"268.67559"},{"1":"285000","2":"217.0215","3":"4","4":"557.41824"},{"1":"300000","2":"244.7066","3":"5","4":"654.68772"},{"1":"405000","2":"313.5478","3":"3","4":"1136.85450"},{"1":"212000","2":"176.4229","3":"3","4":"600.15364"},{"1":"265000","2":"214.7918","3":"3","4":"605.63492"},{"1":"227400","2":"163.5094","3":"4","4":"334.17223"},{"1":"240000","2":"185.8061","3":"4","4":"550.17180"},{"1":"285000","2":"164.8100","3":"3","4":"661.74835"},{"1":"268000","2":"127.8346","3":"3","4":"524.15895"},{"1":"310000","2":"170.4771","3":"4","4":"799.15195"},{"1":"266000","2":"190.2654","3":"3","4":"510.40930"},{"1":"270000","2":"197.3261","3":"3","4":"724.64371"},{"1":"225000","2":"164.2526","3":"3","4":"557.69695"},{"1":"150000","2":"160.9081","3":"4","4":"484.76806"},{"1":"247000","2":"133.7804","3":"3","4":"875.61115"},{"1":"275000","2":"179.4887","3":"3","4":"568.00919"},{"1":"230000","2":"179.4887","3":"3","4":"623.37940"},{"1":"343000","2":"195.6538","3":"3","4":"796.82937"},{"1":"477500","2":"327.8548","3":"7","4":"780.38554"},{"1":"350000","2":"190.5441","3":"4","4":"907.94141"},{"1":"230000","2":"146.1365","3":"4","4":"446.49201"},{"1":"335000","2":"262.8227","3":"4","4":"1401.53526"},{"1":"251000","2":"151.4320","3":"3","4":"535.40022"},{"1":"235000","2":"170.9416","3":"4","4":"593.00010"},{"1":"361000","2":"191.9377","3":"4","4":"836.12736"},{"1":"190000","2":"158.1210","3":"4","4":"325.16064"},{"1":"360000","2":"255.4834","3":"4","4":"1011.89991"},{"1":"575000","2":"360.4638","3":"5","4":"1452.44613"},{"1":"209001","2":"172.2422","3":"4","4":"594.57946"},{"1":"225000","2":"132.0152","3":"2","4":"824.97900"},{"1":"246000","2":"154.4049","3":"3","4":"586.58979"},{"1":"713500","2":"309.4600","3":"5","4":"2622.74572"},{"1":"248000","2":"153.8474","3":"4","4":"654.96643"},{"1":"230000","2":"108.7895","3":"3","4":"492.85063"},{"1":"375000","2":"213.0267","3":"5","4":"616.59748"},{"1":"265000","2":"163.8810","3":"3","4":"727.80242"},{"1":"313000","2":"257.1556","3":"3","4":"92.90304"},{"1":"417500","2":"346.8070","3":"4","4":"753.62946"},{"1":"253000","2":"142.6991","3":"3","4":"543.48278"},{"1":"315000","2":"152.1752","3":"4","4":"618.73425"},{"1":"264000","2":"183.2048","3":"3","4":"616.59748"},{"1":"255000","2":"137.3107","3":"2","4":"1418.35071"},{"1":"210000","2":"130.8075","3":"3","4":"478.07904"},{"1":"180000","2":"168.3403","3":"3","4":"558.99759"},{"1":"250000","2":"159.9790","3":"3","4":"781.31457"},{"1":"250000","2":"165.3674","3":"4","4":"522.57960"},{"1":"209000","2":"155.5197","3":"4","4":"520.25702"},{"1":"258000","2":"171.8706","3":"4","4":"606.19234"},{"1":"289000","2":"178.8384","3":"3","4":"562.99242"},{"1":"316000","2":"217.6718","3":"4","4":"514.58994"},{"1":"225000","2":"145.5791","3":"3","4":"702.90440"},{"1":"266000","2":"154.5907","3":"4","4":"509.48027"},{"1":"310000","2":"128.7636","3":"6","4":"496.84546"},{"1":"471250","2":"243.1273","3":"5","4":"1471.02674"},{"1":"335000","2":"215.6280","3":"4","4":"745.26819"},{"1":"495000","2":"245.0782","3":"4","4":"1111.67778"},{"1":"279500","2":"177.9093","3":"4","4":"785.95972"},{"1":"380000","2":"240.5260","3":"4","4":"1403.30042"},{"1":"325000","2":"251.6743","3":"4","4":"1008.83411"},{"1":"220000","2":"147.4371","3":"3","4":"585.28915"},{"1":"215000","2":"157.3777","3":"3","4":"1073.40172"},{"1":"240000","2":"142.6991","3":"3","4":"557.41824"},{"1":"725000","2":"340.2109","3":"5","4":"2879.99424"},{"1":"230000","2":"161.2797","3":"3","4":"376.62892"},{"1":"306000","2":"204.8512","3":"2","4":"1923.09293"},{"1":"425000","2":"139.5404","3":"3","4":"513.28930"},{"1":"318000","2":"157.5636","3":"4","4":"8610.34665"},{"1":"330000","2":"203.0860","3":"3","4":"759.76106"},{"1":"246000","2":"179.1171","3":"4","4":"552.21567"},{"1":"225000","2":"120.2165","3":"3","4":"1750.10747"},{"1":"111000","2":"142.6062","3":"4","4":"400.87662"},{"1":"268125","2":"183.9480","3":"3","4":"480.03001"},{"1":"244000","2":"194.1674","3":"4","4":"733.28369"},{"1":"295000","2":"170.6629","3":"3","4":"562.62081"},{"1":"236000","2":"159.3287","3":"3","4":"541.43892"},{"1":"202500","2":"146.2294","3":"3","4":"589.09818"},{"1":"219000","2":"110.0901","3":"2","4":"591.04914"},{"1":"242000","2":"164.8100","3":"4","4":"459.87005"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

Wir konzentrieren uns zunächst nur auf die Wohnfläche und die damit verbundenen Verkaufspreise. Ein Streudiagramm der Daten sieht so aus:

<img src="01-01-einfache-regression_files/figure-html/unnamed-chunk-3-1.png" width="672" />

Da scheint es einen Zusammenhang zu geben: Wenig überraschened haben Häuser mit einer größeren Wohnfläche einen höheren Verkaufspreis erzielt. Wir fragen uns jetzt: 

1. Um wie viel Euro steigt der Wert eines Haus mit einem zusätzlichen Quadratmeter an Wohnfläche? 

2. Und was ist wohl der Wert unseres eigenen Hauses mit einer Wohnfläche von $x$ Quadratmetern? 

Die Antworten kann uns ein Modell liefern.

## Was für ein Modell?

Da gibt es verschiedene Möglichkeiten, aber eine naheliegende Idee für den Anfang ist ein lineares Modell der Form

\begin{equation}
\text{Verkaufspreis} = \beta_0 + \beta_1 \text{Wohnfläche}.
(\#eq:slr)
\end{equation}

Das Modell berechnet also den Verkaufspreis, indem die Wohnfläche mit einem Koeffizienten $\beta_1$ multipliziert und der Koeffizient $\beta_0$ addiert wird - eine klassische, lineare Funktion. Grafisch sieht das zum Beispiel so aus:

<img src="01-01-einfache-regression_files/figure-html/unnamed-chunk-4-1.png" width="672" />

Ich habe $\beta_0 = 11000$ und $\beta_1 = 1500$ gewählt, damit die blaue Linie möglichst gut durch die Punkte führt. Wir bekommen hier schon die erste Vorstellung, dass ein zusätzlicher Quadratmeter an Wohnfläche den Wert des Hauses um $1500$ Dollar anhebt, und dass ein Haus mit $300m^2$ Wohnfläche circa $11000 + 1500 \cdot 300 = 461000$ Dollar Wert sein könnte.

Es gibt aber noch etwas zu beachten:

1. Die Werte für $\beta_0$ und $\beta_1$ habe ich geraten. Das ist ungenau, wir wünschen uns ein Verfahren mit denen diese Werte aus den Daten berechnet werden können.

2. Die Datenpunkte weichen von unserer linearen Funktion ab, der Verkaufspreis kann also nicht exakt durch die Wohnfläche bestimmt werden. Unser Modell braucht also noch eine Ergänzung, die mit Messfehlern umgehen kann.

