import Foundation

class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        return find(nums, S, 0)
    }

    var memo: [[Int: Int] :Int] = [:]

    private func find(_ nums: [Int], _ S: Int, _ index: Int) -> Int {
        if index == nums.count {
            return S == 0 ? 1 : 0
        }

        if let r = memo[[index: S]] {
            return r
        }

        let ret = find(nums, S + nums[index], index + 1) + find(nums, S - nums[index], index + 1)
        memo[[index: S]] = ret

        return ret
    }
}

let s = Solution()
s.findTargetSumWays([1, 1, 1, 1, 1], 3)
print(s.memo)
