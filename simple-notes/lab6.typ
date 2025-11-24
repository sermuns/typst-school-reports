#set text(font: "New Computer Modern")

= TSBB08 lab6 questions

== Question 1

$
S_N (u,v) &= cal(F){r_n (x,y)} = sigma_n^2
$

$
  S_F (u,v) &= cal(F){r_f (x,y)} \
  &= cal(F){sigma_f^2 e^(-(-|x|ln rho))} \
  &= (-2 sigma_f^2 ln rho) / (ln(rho)^2 + (2 pi u)^2)
$

== Question 2

$
r=0 \
=>
W(u,v) = (H^*(u,v)) / (|H(u,v)|^2) = (cancel(H^*(u,v))) / (H(u,v) dot cancel(H^*(u,v))) = 1 / H(u,v)
$

== Question 3

Made it a little better, but introduced weird artifacts in background.

== Question 4

With SNR = 10, the image looks pretty good, the background has some artifacts though.
With SNR = 5, it is still good, even though the text looks a little more blurred than before and the background has even more artifacts.

== Question 5
 
The result of the inverse filtering is really good. Using `h2` makes the degraded image still legible, but `h3` makes the degraded image illegible, yet both restored images look quite good.

== Question 6

Because if $r=0$, then only inverse filtering is performed (see Question 2), no de-noising.

== Question 7

when snr_db < 10, it becomes really hard to read text on the restored image.

== Question 8
Humans are good at picking out patterns, so the noise doesn't bother us too much. Having low noise suppression (i.e. low $r$) makes the image sharper. $r=0.2$ seems good.

== Question 9


$
mat(1, 1, ..., 1) \/ 15
$

== Question 10

$
rho_x = (r_f (1,0)) / (r_f (0,0)) = frac(sigma_f² rho^(sqrt(1²)),sigma_f²) = rho\

rho_y = (r_f (0,1)) / (r_f (0,0)) = frac(sigma_f² rho^(sqrt(1²)),sigma_f²) = rho \

rho = frac(rho_x + rho_y,2)
$ 

== Question 11
Yes, brightest in the middle. The borders are strange because doing it in the Fourier domain makes the correlation circular.

== Question 12
Baboon :
$
rho = 0.9813
$

== Question 13

It is not possible because if we want to preserve the chimney, we have to decrease the Threshold (to T=12), but to get rid of the roof tiles details, we have to increase it (to T=30).

== Question 14

T = 15

== Question 15

The canny edge detector does a better job of preserving connectivity in lines that are moving in the same direction. It also has a lower error rate : instead of depending on a raw threshold, it is based on derivative. It allows to detect edges independently of the raw brightness of the image,
 using its variations.

== Question 16

Using hysteresis makes strong lines with small gaps survive more than weak lines.


== Question 17

It chooses [0.0188, 0.0469]


== Question 18

A good threshold we found is T = 0.2.

== Question 19

More and more lines seem to be broken because of aliasing. The monitor doesn't have enough pixels to represent all the image's pixels if we make the figure small.

== Question 20

#figure(
  image("desmos-graph.svg", width: 80%),
)

the blue line crosses the function on -a, the purple one on a.


== Question 21

By sampling the values of the curve in the Hough transform, a line has been created in the real domain for each sample. These lines cross each other on the location of the point that is described by the Hough's curve.

== Question 22

We see only one straight line connecting all the points.