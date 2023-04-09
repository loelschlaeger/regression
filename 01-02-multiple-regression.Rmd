# Multiple Regression

::: {.rmdwarning}
Dieses Kapitel ist gerade in Bearbeitung. &#128119;
:::

Bei der einfachen Regression haben wir uns nur den Zusammenhang zwischen zwei Variablen angesehen, zum Beispiel zwischen dem Wert eines Hauses und der Wohnfläche. Der Hauspreis kann aber noch von anderen Faktoren abhängen: Grundstücksfläche, Anzahl an Schlafzimmern, etc. 

Unsere Modellgleichung \@ref(eq:slr) können wir auf $K$ erklärende Variablen verallgemeinern:

$$\textbf{y}_i = \beta_0 + \beta_1 \textbf{x}_{i,1} + \beta_2 \textbf{x}_{i,2} + \dots + \beta_K \textbf{x}_{i,K} + \textbf{u}_i,\quad i = 1,\dots,n$$
