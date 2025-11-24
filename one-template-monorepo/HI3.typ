#import "report_template.typ": *
#show: report.with(
  title: [
    TSFS12 Hand-in 3:\
    Vehicle Motion Control
  ],
)

= Introduction
The objective of this hand-in was to explore and implement two approaches to control of a ground vehicle.

= Results
== Exercise 5.1

#pseudocode-list[
  + $s_"projected" <- "arc length of closest point in path"$
  + *$p_p <- "path"(s_"projected" + l)$*
]

== Exercise 5.2

#pseudocode-list[
  + $Delta <- p_p - p_"car"$
  + $h = vec(cos(theta), sin(theta))$
  + $h_x <- h^perp = vec(sin(theta), -cos(theta))$
  + *$x <- Delta dot h_x$*
]

Where $theta$ is the heading of the car, and $h^perp$ denotes the orthogonal complement to $h$.

$Delta_x$ is not the same as $x$, because it is in the global coordinate system, not in vehicle coordinate system. By computing the dot product between $Delta$ and $h_x$, we project $Delta$ onto the vehicle's coordinate system.

== Exercise 5.3

#figure(
  image("figures/pure_pursuit.svg", width: 70%),
  caption: [Pure-pursuit with $K=1$.],
)

If the vehicle is placed further from the path than the look-ahead horizon, the controller will suffer from the same problems discussed in #link(<ex5.7>)[Exercise 5.7].

Increasing the look-ahead horizon makes the vehicle "cut corners" much more, and not following the exact shape of the path.

The result with $K=1$ is overall acceptable, only slightly cutting the corners.

== Exercise 5.4

#figure(
  image("figures/state_feedback.svg", width: 70%),
)

Setting the parameter $K$ to a low value, around 0.1, causes the controller to steer very weakly and "lagging behind" in the curvature.

Setting $K$ to an excessively high value, around 100, causes the vehicle to stick very close to the path, but it does so in a high-frequency oscillating pattern.

#box[
  == Exercise 5.5
  Projection onto a general path is difficult because it is an optimization problem that could have multiple possible solutions. Since the projection operation wants to find the closest point, it does not take in consideration where on the path that point is. However, there can be two or more points that are of the same distance but where the second point is further down the path.

  @non-unique-projection shows a situation where there are two possible points on the path to be projected onto.
  #figure(
    image("figures/non-unique.svg"),
    caption: [A point which can be projected to two parts of the path.],
  )<non-unique-projection>
]

== Exercise 5.6
When varying the feedback gains or alternatively adjusting the weights in the LQ-controller the tracking varies. When the feedback gains is low the tracking is smooth but unresponsive and when higher the tracking is faster but can result in overshooting and oscillatory tracking.

#colbreak()
== Exercise 5.7<ex5.7>
@linear-state-feedback shows the simulation from a point far from the path.

#figure(
  image("figures/simulation_far.svg"),
  caption: [Using linear state feedback on initial conditions far from the path.],
)<linear-state-feedback>

The reason this controller is unable to recover from being started far away from the path, is that the control signal $u$ is tied to the distance to the path. When the distance is high, the controller then makes the vehicle turn sharply, but this only results in spinning in a circle forever.

#box[
  == Exercise 5.8
  The non linear controller introduces the factor $sin(theta_e) / (theta_e)$. For small values of $theta_e$ this factor is roughly equal to 1 and therefore behaves similarly to the linear controller.

  The path using the non linear state feedback controller is shown in @non-linear-state-feedback.

  #figure(
    image("figures/non-linear-state-feedback.svg", width: 70%),
    caption: [Using non-linear state feedback on initial conditions far from the path.],
  )<non-linear-state-feedback>
]


== Exercise 5.9
Below in @all-controllers the path for all three controllers are shown. The linear and non linear state feedback controller both follow the path the closely, whereas the pure pursuit deviates the most from the path. The pure pursuit controllers look ahead prioritizes smooth steering and therefore is the one to deviate the most. The non linear controller has the most accurate tracking due to the factor $sin(theta_e) / (theta_e)$ that scales the heading error.

#figure(
  image("figures/all-controllers.svg"),
  caption: [All three controllers overlayed in the same world.],
)<all-controllers>

The path following errors for every controller are plotted in @path-following-error.

#figure(
  image("figures/path-error.svg"),
  caption: [The controllers performance- distance to the path, plotted over time.],
)<path-following-error>

= Discussion
The results show that the non linear state feedback controller gives the most accurate tracking. However, all three controllers have different strengths. Pure pursuit gives a smooth steering. Linear state feedback generates more accurate tracking but can have a hard time when at a significant distance from the path, as well as can generate oscillatory steering. The non linear state feedback provides the most balanced tracking.

