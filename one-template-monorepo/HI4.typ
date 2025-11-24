#import "report_template.typ": *
#show: report.with(
  title: [
    TSFS12 Hand-in 4:\
    Collaborative Control
  ],
)

= Introduction
The objective of this hand in was to explore and implement position-based formation control, displacement-based formation control and distance-based formation control.
= Results

== Exercise 5.1
@wind_zero and @wind_two shows the trajectories of the four agents with zero wind respectively wind at two. The added wind is in positive x direction which is clearly shown in @wind_two where the whole trajectories are moved slightly to the right. The difference in these figures is also how the animation differs.

#figure(
  image("figures/ex5_1_wind_0.svg"),
  caption: [Trajectories of all agents with wind at zero.],
)<wind_zero>

#figure(
  image("figures/ex5_1_wind_2.svg"),
  caption: [Trajectories of all agents with wind at two.],
)<wind_two>

#colbreak()
== Exercise 5.2
The animations with angular frequency 1 rad/s and 2 rad/s are different. In @harmonic_1rad, every agent's disturbance is compounded with the agent's above it. The final agent is oscillating with around 3x the amplitude of the original agent 0. This system is resonant!

In @harmanic_2rad, every agent is only disturbed by the same amount as the one above it, and so every agent seems to be oscillating with the same amplitude.

#figure(
  image("figures/ex5_2_2_f_1.svg", width: 75%),
  caption: [Y-positions of all the agents with angular frequency 1 rad/s.],
)<harmonic_1rad>

#figure(
  image("figures/ex5_2_2_f_2.svg", width: 75%),
  caption: [Y-positions of all the agents with angular frequency 2 rad/s.],
)<harmanic_2rad>

By changing the signs of the control law for the first agent to state minus state reference and the control law for the rest of the agents to state reference minus state, the controller performs maximally bad. It tries to steer the agent further from the desired state, instead of towards it. Visually what happens is all agents explode outward, trying to keep maximal distance.

#colbreak()
== Exercise 5.3

*(1)* @5_3_1_k_1 and @5_3_1_k_5 shows the distance between agent 0, which is the top node, and agent 1, where $k_p = 1 #[and] 5$, respectively.

#figure(
  image("figures/ex5_3_1_k_1.svg"),
  caption: [Distance between the top node and the neighbor agent 1 at $k_p$ = 1.],
)<5_3_1_k_1>

#figure(
  image("figures/ex5_3_1_k_5.svg"),
  caption: [Distance between the top node and the neighbor agent 1 at K$p$ = 5.],
)<5_3_1_k_5>

Ideally the distance should be constant, but the reason for the jumps in different positions is that there are multiple "stable" ways for the two nodes to have a constant distance. Since agent 0 is rocking in a circular motion, it disrupts the system so that it can enter another of these stable constellations.

By having a higher $k_p$, we decrease the risk of this happening. Increasing $k_p$ further would probably result in a constant plot.

#colbreak()
*(2)*
@5_3_2 shows the path for all the agents when the orientation of the formation is preserved, where both the first and last agent measure the absolute position.

#figure(
  image("figures/ex5_2_2_f_1.svg"),
  caption: [The paths of all eight agents when the orientation of the formation is preserved.],
)<5_3_2>

= Discussion

The three different ways of maintaining formation with agents have different down- and upsides.

Position-based formation control is a simple control method that is easy to implement but it can struggle in more complex environments. It is not so flexible since the agents do not dynamically adjust their distance to each other, as with the two later methods.

In the displacement-based formation control, the agents try to maintain the same distance and orientation to a set of neighbors. This method of formation control is quite good in most scenarios, but requires that the agents have aligned coordinate systems, which might not be feasible in every scenario.

Distance-based formation control is perhaps the simplest for the agents to perform, and each agent can use their own local coordinate system. The agents only need to keep their desired distance to a set of neighbors. The set of edges for every agent must however be picked with care-- the constructed graph formed by neighbors must be _rigid_, otherwise the formation will not keep its shape.

