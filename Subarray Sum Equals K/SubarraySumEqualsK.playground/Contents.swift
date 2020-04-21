import Foundation

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var map: [Int: Int] = [0:1]

        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]

            if let x = map[sum - k] {
                count += x
            }

            map[sum] = map[sum, default: 0] + 1
        }

        return count
    }
}

let s = Solution()
s.subarraySum([3, 4, 7, 2, -3, 1, 4, 2], 7)
