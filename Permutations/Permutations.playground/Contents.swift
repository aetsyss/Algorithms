import Foundation

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return []
        }

        if nums.count == 1 {
            return [nums]
        }

        var ret: [[Int]] = []

        for n in nums {
            var s = Set(nums)
            s.remove(n)

            let sub: [[Int]] = permute(Array(s)).map {
                var arr = [n]
                arr.append(contentsOf: $0)
                return arr
            }

            ret.append(contentsOf: sub)
        }

        return ret
    }
}

let s = Solution()
s.permute([1, 2, 3])
