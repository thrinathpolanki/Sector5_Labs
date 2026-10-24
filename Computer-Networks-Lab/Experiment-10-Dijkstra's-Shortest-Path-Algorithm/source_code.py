import heapq


def dijkstra(graph, source):
    # graph: adjacency list {node: [(neighbor, weight), ...]}
    dist = {node: float('inf') for node in graph}
    dist[source] = 0

    pq = [(0, source)]  # (distance, node)

    while pq:
        current_dist, u = heapq.heappop(pq)

        if current_dist > dist[u]:
            continue

        for v, weight in graph[u]:
            if dist[u] + weight < dist[v]:
                dist[v] = dist[u] + weight
                heapq.heappush(pq, (dist[v], v))

    return dist


# Example graph
graph = {
    'A': [('B', 4), ('C', 1)],
    'B': [('A', 4), ('C', 2), ('D', 5)],
    'C': [('A', 1), ('B', 2), ('D', 8), ('E', 10)],
    'D': [('B', 5), ('C', 8), ('E', 2), ('Z', 6)],
    'E': [('C', 10), ('D', 2), ('Z', 3)],
    'Z': [('D', 6), ('E', 3)]
}

print(dijkstra(graph, 'A'))
