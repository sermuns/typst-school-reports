#import "report_template.typ": report

#show: report.with(
  title: [
    TSFS12 Hand-in 1:\
    Discrete Path Planning in a Structured Road Network
  ],
)


= Introduction <intro>

This hand-in exercise is to implement and explore properties of common search algorithms in the scenario of finding travel routes in a map of Linköping.

= Results <results>

== Exercise 3.1

The state space $chi$ contains all intersections in the given map of Linköping.

$f(x, u)$ moves from $x$ to $x'$, where $x$ and $x'$ always are adjacent intersections in the map.

$U(x)$ contains all possible movements toward intersections adjacent to current one.

`f_next` returns three vectors where same indices correspond to same neighbor (neighbor, action, cost).

== Exercise 3.2

More complex missions require visiting more nodes and therefore are more time-consuming.

A city full of irregularly located intersections could be approximated with a  grid of regularly spaced intersections. One can assume that in this map, a longer euclidean distance between the start and goal node is undeniably tied to the number of intersections between these two nodes.

Four classic search algorithms were implemented to find a path between any given start and goal node in the Linköping map:
- Best first
- Dijkstra
- Breadth first
- A\*

The results of these algorithms are presented in the figures below. @plan-lengths shows the plan length and @expanded-nodes shows the number of expanded nodes.

#figure(
  image("figures/paths_3987_to_4724.svg"),
  caption: [Plan length for four algorithms.],
)<plan-lengths>

#figure(
  image("figures/nodes_3987_to_4724.svg"),
  caption: [Number of expanded nodes for four algorithms.],
)<expanded-nodes>


A\* is an optimized version of Dijkstra's. Both algorithms produce the same path in the end, but A\* does so in a more efficient way, visiting fewer nodes in the process.

A few missions were performed, to compare A\* and Dijkstra's against each other. The result is visualized as a scatter plot with Planning time VS. mission length in @dijkstra-vs-astar.

#figure(
  image("figures/length-vs-time.svg"),
  caption: [Comparing the performance of Dijkstra vs A\*],
)<dijkstra-vs-astar>

== Exercise 3.3
The best first planner is a very fast planner however would not be a good fit if the path requires backtracking. Whereas breadth is a rather dull planner, it searches in all directions and picks the first path which is not necessarily the most optimal.

Dijkstra always finds the optimal path but is quite slow compared to A\* that also always finds the optimal path but is noticeably faster.

The best option would be to always pick the A\* planner over Dijkstra. Breadth first would be a good option if for some reason the heuristic function can not be used since breadth first is the only planner that does not require the heuristic function.

#box[
  == Exercise 3.4

  If $h(x) > h^*(x)$ (admissibility), the solution is not guaranteed to be optimal.

  If $h(x) > d(x,y) + h(y)$ (consistency), the solution will not be found in an efficient manner.

  If a heuristic function is admissible, but not consistent, the planner will find the optimal solution, but not in an efficient manner. With a non admissible heuristic a solution will be found but it will not be the optimal solution. However, it may be faster. A both admissible and a consistent heuristic function will find the optimal solution and in an efficient manner.
]

#box[
  == Exercise 3.5

  Euclidean distance would probably be a bad heuristic function for navigating a labyrinth-like environment. The reason for this is that progress toward the goal is not at all guaranteed to be tied to the distance to it, as progressing often involves moving through winding paths that could result in _increasing_ euclidean distance to goal node, a "backtracking problem". This is illustrated in @backtracking.

  #figure(
    image("figures/maze.png", width: 60%),
    caption: [Illustrating the backtracking problem.],
  )<backtracking>
]

#box[
  == Exercise 3.6

  A simple way to create the inflated heuristic function $h_c (x)$ is to scale the heuristic function $h(x)$ by a constant $c$.

  $
    h_c (x) = c dot h(x)
  $<scaled>

  By inflating, we risk making the heuristic inadmissible, which makes solutions found using it no longer be guaranteed to be optimal.

  40 randomly generated missions were performed, with inflation factor $c = 2^i$ for $i=-4,-3, ..., 11, 13$. The results are presented in @inflation-results, with each colored line representing a different inflation factor $c$.

  #figure(
    image("figures/astar_inflated_0.0625_to_4096.svg"),
    caption: [Comparing the effect of different inflation factors on A\*.],
  )<inflation-results>

  Two notes on the extremes:

  - Deflating the heuristic ($c<1$), we move further away from the efficient A\* algorithm, and eventually fall into Dijkstra's at $c=0$.
  - Inflating towards infinity, the algorithm essentially becomes a best-first algorithm, since the heuristic becomes so much more favored than the cost function. This however, makes the algorithm faster.

]

= Discussion <discussion>

Choosing the right search algorithm for the job boils down to a few aspects. In most cases, you want to pick A\*, since it finds the optimal path in an efficient manner. However, if the planning is time-limited, you need to perform an inflated search, possibly to the point where you're better off just choosing best-first search. On the other hand, if there is no way to construct a heuristic function, neither A\* nor best-first is on the table. Your only bet is depth- or breadth-first search. Which one to choose depends on the structure of the state-space.
