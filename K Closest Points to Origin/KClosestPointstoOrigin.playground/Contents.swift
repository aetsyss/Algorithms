import Foundation

class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        return Array(points
            .sorted(by: { dist($0) < dist($1) })
            .prefix(K))
    }

    private func dist(_ points: [Int]) -> Double {
        return sqrt(pow(Double(points[0]), 2) + pow(Double(points[1]), 2))
    }
}

let s = Solution()
s.kClosest([[3,3], [5,-1], [-2,4]], 2)
