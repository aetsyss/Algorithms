import Foundation

class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        if heights.isEmpty {
            return 0
        }

        if heights.count == 1 {
            return heights[0]
        }

        var min = Int.max
        var m = 0

        for j in 0..<heights.count {
            if heights[j] < min {
                min = heights[j]
                m = j
            }
        }

        let left = Array(heights.prefix(m))
        let right = Array(heights.suffix(heights.count - m - 1))

        return max(min * heights.count, max(largestRectangleArea(left), largestRectangleArea(right)))
    }
}

let s = Solution()
s.largestRectangleArea([2,1,5,6,2,3])
