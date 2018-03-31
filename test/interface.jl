mutable struct DummyGraph <: AbstractGraph{Int} end
mutable struct DummyDiGraph <: AbstractGraph{Int} end
mutable struct DummyEdge <: AbstractEdge{Int} end

@testset "Interface" begin
    dummygraph = DummyGraph()
    dummydigraph = DummyDiGraph()
    dummyedge = DummyEdge()

    @test_throws MethodError is_directed(DummyGraph)

    for edgefun in [src, dst, Pair, Tuple, reverse]
        @test_throws MethodError edgefun(dummyedge)
    end

    for edgefun2edges in [==]
        @test_throws MethodError edgefun2edges(dummyedge, dummyedge)
     end

    for graphfunbasic in [
        nv, ne, vertices, edges, is_directed,
        edgetype, eltype, zero
    ]
        @test_throws MethodError graphfunbasic(dummygraph)
    end

    for graphfun1int in [
        has_vertex, inneighbors, outneighbors
    ]
        @test_throws MethodError graphfun1int(dummygraph, 1)
    end
    for graphfunedge in [
        has_edge,
      ]
        @test_throws MethodError graphfunedge(dummygraph, dummyedge)
    end

end # testset
