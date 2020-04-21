import Foundation

class Solution {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        if nums.count < 3 {
            return false
        }

        var small = Int.max
        var big = Int.max

        for n in nums {
            if n <= small { small = n }
            else if n <= big { big = n }
            else { return true }
        }

        return false
    }
}

let s = Solution()
s.increasingTriplet([5,1,5,5,2,5,4,0])
