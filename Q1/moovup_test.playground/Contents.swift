import Foundation

class Graph {
    var adjacencyList: [Character: [Character]]

    init() {
        self.adjacencyList = [:]
    }

    func addEdge(_ at: Character, _ node: Character) {
        if adjacencyList[at] == nil {
            adjacencyList[at] = []
        }
        adjacencyList[at]?.append(node)

        if adjacencyList[node] == nil {
            adjacencyList[node] = []
        }
        adjacencyList[node]?.append(at)
    }

    func dfsAllPaths(from source: Character, to destination: Character) -> [[Character]] {
        var result: [[Character]] = []
        var visited: Set<Character> = []
        var path: [Character] = []

        func dfs(_ node: Character) {
            // add the node to current path, and visited set
            path.append(node)
            visited.insert(node)

            // if the destination is reached, add the path to the result if not exist
            if node == destination {
                if !result.contains(path) {
                    result.append(Array(path))
                }
            } else {
                // continue to search the neighbors
                if let neighbors = adjacencyList[node] {
                    for neighbor in neighbors {
                        if !visited.contains(neighbor) {
                            dfs(neighbor)
                        }
                    }
                }
            }

            // backtrack: remove the node from the current path and visited set
            path.removeLast()
            visited.remove(node)
        }

        // use DFS to find all possible paths from the source node
        dfs(source)
        
        return result
    }
    
    func findShortestPath(from source: Character, to destination: Character) -> [Character]? {
        // initilal the queue with the source node
        var queue: [(node: Character, path: [Character])] = [(source, [source])]
        var visited: Set<Character> = [source]
        
        while !queue.isEmpty {
            let (currentNode, currentPath) = queue.removeFirst()
            
            if currentNode == destination {
                return currentPath
            }
            
            if let neighbors = adjacencyList[currentNode] {
                for neighbor in neighbors {
                    if !visited.contains(neighbor) {
                        visited.insert(neighbor)
                        queue.append((neighbor, currentPath + [neighbor]))
                    }
                }
            }
        }
        
        // return nil if no path found
        return nil
    }
}

// Construct the graph
let graph = Graph()
graph.addEdge("A", "B")
graph.addEdge("A", "D")
graph.addEdge("A", "H")

graph.addEdge("B", "A")
graph.addEdge("B", "C")
graph.addEdge("B", "D")

graph.addEdge("C", "B")
graph.addEdge("C", "D")
graph.addEdge("C", "F")

graph.addEdge("D", "A")
graph.addEdge("D", "B")
graph.addEdge("D", "C")
graph.addEdge("D", "E")

graph.addEdge("E", "D")
graph.addEdge("E", "F")
graph.addEdge("E", "H")

graph.addEdge("F", "C")
graph.addEdge("F", "E")
graph.addEdge("F", "G")

graph.addEdge("G", "F")
graph.addEdge("G", "H")

graph.addEdge("H", "A")
graph.addEdge("H", "E")
graph.addEdge("H", "G")

let from: Character = "A"
let to: Character = "H"

// Q1a
let allPaths = graph.dfsAllPaths(from:from, to: to)
print("All paths from \(from) to \(to):")
for path in allPaths {
    print(path)
}

// Q1b
let shortestPath = graph.findShortestPath(from: from, to: to)
print("shortest path from \(from) to \(to):")
print(shortestPath ?? [])
