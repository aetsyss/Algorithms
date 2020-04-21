import Foundation

class Solution {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
        var res: [(Int, Int)] = []

        if nums.isEmpty {
            res.append((lower, upper))
        }

        if let first = nums.first, first != lower {
            res.append((lower, first - 1))
        }

        if nums.count > 1 {
            for j in 0..<nums.count - 1 {
                let l = nums[j] + 1
                let r = nums[j + 1] - 1

                if l <= r {
                    res.append((l, r))
                }
            }
        }

        if let last = nums.last, last != upper {
            res.append((last + 1, upper))
        }

        return res.map({
            $0.0 == $0.1 ? "\($0.0)" : "\($0.0)->\($0.1)"
        })
    }
}

let s = Solution()
s.findMissingRanges([], 1, 1)
