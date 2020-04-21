import Foundation

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }

        var a = 1

        for j in 1..<nums.count {
            if nums[a-1] != nums[j] {
                nums[a] = nums[j]
                a += 1
            }
        }

        return a
    }
}

let s = Solution()
var nums = [0,0,1,1,1,2,2,3,3,4]
s.removeDuplicates(&nums)
nums
