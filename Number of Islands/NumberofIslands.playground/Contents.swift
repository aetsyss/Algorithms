import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.isEmpty { return 0 }

        let m = grid.count
        let n = grid[0].count

        var count = 0
        var g = grid

        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == "1" {
                    count += 1
                    dfs(i: i, j: j, g: &g)
                }
            }
        }

        return count
    }

    private static let directions: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    private func dfs(i: Int, j: Int, g: inout [[Character]]) {
        if g[i][j] == "0" { return }

        g[i][j] = "0"

        let m = g.count
        let n = g[0].count

        for d in Solution.directions {
            let ii = i + d.0
            let jj = j + d.1

            if !(ii < 0 || ii > m - 1 || jj < 0 || jj > n - 1) {
                dfs(i: ii, j: jj, g: &g)
            }
        }
    }
}

let grid: [[Character]] = [
    ["1", "1", "0", "0", "0"],
    ["1", "1", "0", "0", "0"],
    ["0", "0", "1", "0", "0"],
    ["0", "0", "0", "1", "1"]
]

let s = Solution()
s.numIslands(grid)
