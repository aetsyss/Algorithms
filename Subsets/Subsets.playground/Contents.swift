import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var ret = (1...nums.count).flatMap({ subsets(nums, $0) })
        ret.append([])
        return ret
    }

    func subsets(_ nums: [Int], _ n: Int) -> [[Int]] {
        if n == 1 {
            return nums.map({ [$0] })
        }

        if n == nums.count {
            return [nums]
        }

        var ret: [[Int]] = []
        for j in 0..<nums.count - n + 1 {
            let r: [[Int]] = subsets(Array(nums.suffix(nums.count - j - 1)), n - 1).map {
                var s = [nums[j]]
                s.append(contentsOf: $0)
                return s
            }

            ret.append(contentsOf: r)
        }

        return ret
    }
}

let s = Solution()
s.subsets([1, 2, 3])
s.subsets([1, 2, 3], 1)
