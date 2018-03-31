# This file contains the common interface for LightGraphs.

"""
    AbstractEdge

An abstract type representing a single edge between two vertices of a graph.
"""
abstract type AbstractEdge{T} end

"""
    AbstractEdgeIter

An abstract type representing an edge iterator.
"""
abstract type AbstractEdgeIter end

"""
    AbstractGraph

An abstract type representing a graph.
"""
abstract type AbstractGraph{T} end


@traitdef IsDirected{G<:AbstractGraph}
@traitimpl IsDirected{G} <- is_directed(G)


#
# Interface for AbstractEdges
#

"""
    src(e)

Return the source vertex of edge `e`.
"""
src(e::AbstractEdge) = throw(MethodError(src, (e,)))

"""
    dst(e)

Return the destination vertex of edge `e`.
"""
dst(e::AbstractEdge) = throw(MethodError(dst, (e,)))

Pair(e::AbstractEdge) = throw(MethodError(Pair, (e,)))
Tuple(e::AbstractEdge) = throw(MethodError(Tuple, (e,)))

"""
    reverse(e)

Create a new edge from `e` with source and destination vertices reversed.
"""
reverse(e::AbstractEdge) = throw(MethodError(reverse, (e,)))

==(e1::AbstractEdge, e2::AbstractEdge) = throw(MethodError(==, (e1, e2)))


#
# Interface for AbstractGraphs
#
"""
    edgetype(g)

Return the type of graph `g`'s edge
"""
edgetype(g::AbstractGraph) = throw(MethodError(edgetype, (g,)))

"""
    eltype(g)

Return the type of the graph's vertices (must be <: Integer)
"""
eltype(g::AbstractGraph) = throw(MethodError(eltype, (g,)))

"""
    nv(g)

Return the number of vertices in `g`.
"""
nv(g::AbstractGraph) = throw(MethodError(nv, (g,)))

"""
    ne(g)

Return the number of edges in `g`.
"""
ne(g::AbstractGraph) = throw(MethodError(ne, (g,)))

"""
    vertices(g)

Return (an iterator to or collection of) the vertices of a graph.

### Implementation Notes
A returned iterator is valid for one pass over the edges, and
is invalidated by changes to `g`.

"""
vertices(g::AbstractGraph) = throw(MethodError(vertices, (g,)))

"""
    edges(g)

Return (an iterator to or collection of) the edges of a graph.
For `AbstractSimpleGraph`s it returns a `SimpleEdgeIter`.
The expressions `e in edges(g)` and `e ∈ edges(ga)` evaluate as
calls to [`has_edge`](@ref).

### Implementation Notes
A returned iterator is valid for one pass over the edges, and
is invalidated by changes to `g`.
"""
edges(g) = throw(MethodError(edges, (g,)))

"""
    is_directed(g)

Return true if the graph is a directed graph; false otherwise.
"""
is_directed(g) = throw(MethodError(is_directed, (g,)))

"""
    has_vertex(g, v)

Return true if `v` is a vertex of `g`.
"""
has_vertex(x, v) = throw(MethodError(has_vertex, (x, v)))

"""
    has_edge(g, e)
    e ∈ edges(g)

Return true if the graph `g` has an edge `e`.
The expressions `e in edges(g)` and `e ∈ edges(ga)` evaluate as
calls to `has_edge`, c.f. [`edges`](@ref).
"""
has_edge(x, e) = throw(MethodError(has_edge, (x, e)))

"""
    inneighbors(g, v)

Return a list of all neighbors connected to vertex `v` by an incoming edge.

### Implementation Notes
Returns a reference, not a copy. Do not modify result.
"""
inneighbors(x, v) = throw(MethodError(inneighbors, (x, v)))

"""
    outneighbors(g, v)

Return a list of all neighbors connected to vertex `v` by an outgoing edge.

# Implementation Notes
Returns a reference, not a copy. Do not modify result.
"""
outneighbors(x, v) = throw(MethodError(outneighbors, (x, v)))

"""
    zero(g)

Return a zero-vertex, zero-edge version of the same type of graph as `g`.
"""
zero(g::AbstractGraph) = throw(MethodError(zero, (g,)))
