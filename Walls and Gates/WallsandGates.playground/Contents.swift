import Foundation

let INF = 2147483647

class Solution {
    let INF = 2147483647

    func wallsAndGates(_ rooms: inout [[Int]]) {
        if rooms.isEmpty { return }
        let m = rooms.count
        let n = rooms[0].count

        var poinst: [Point] = []
        for i in 0..<m {
            for j in 0..<n {
                if rooms[i][j] == 0 {
                    poinst.append(Point(i: i, j: j))
                }
            }
        }

        setShortestWay(points: poinst, rooms: &rooms)
    }

    struct Point: Hashable {
        let i: Int
        let j: Int

        var right: Point {
            return Point(i: i, j: j + 1)
        }

        var left: Point {
            return Point(i: i, j: j - 1)
        }

        var up: Point {
            return Point(i: i - 1, j: j)
        }

        var down: Point {
            return Point(i: i + 1, j: j)
        }
    }

    private func setShortestWay(points: [Point], rooms: inout [[Int]]) {
        let m = rooms.count
        let n = rooms[0].count

        var q = points
        var visited: Set<Point> = Set(points)

        var step = 0
        while !q.isEmpty {
            let count = q.count

            for _ in 0..<count {
                let p = q.removeFirst()
                rooms[p.i][p.j] = min(step, rooms[p.i][p.j])

                if p.j < n - 1 && rooms[p.i][p.j + 1] != -1 && !visited.contains(p.right) {
                    q.append(p.right)
                    visited.insert(p.right)
                }

                if p.j > 0 && rooms[p.i][p.j - 1] != -1 && !visited.contains(p.left) {
                    q.append(p.left)
                    visited.insert(p.left)
                }

                if p.i < m - 1 && rooms[p.i + 1][p.j] != -1 && !visited.contains(p.down) {
                    q.append(p.down)
                    visited.insert(p.down)
                }

                if p.i > 0 && rooms[p.i - 1][p.j] != -1 && !visited.contains(p.up) {
                    q.append(p.up)
                    visited.insert(p.up)
                }
            }

            step += 1
        }
    }
}

var arr = [
    [INF,  -1,   0,  INF],
    [INF, INF, INF,   -1],
    [INF,  -1, INF,   -1],
    [0,    -1, INF,  INF]
]

let s = Solution()
s.wallsAndGates(&arr)
arr

