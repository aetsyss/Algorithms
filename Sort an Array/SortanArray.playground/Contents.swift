import Foundation

// Merge sort
class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return nums
        }

        let left = Array(nums.prefix(nums.count / 2))
        let right = Array(nums.suffix(nums.count - nums.count / 2))

        let left_sorted = sortArray(left)
        let right_sorted = sortArray(right)

        var ret: [Int] = []
        var i = 0, j = 0

        while i < left_sorted.count && j < right_sorted.count {
            if left_sorted[i] <= right_sorted[j] {
                ret.append(left_sorted[i])
                i += 1
            } else {
                ret.append(right_sorted[j])
                j += 1
            }
        }

        while i < left_sorted.count {
            ret.append(left_sorted[i])
            i += 1
        }

        while j < right_sorted.count {
            ret.append(right_sorted[j])
            j += 1
        }

        return ret
    }
}

let s = Solution()
s.sortArray([5,2,3,1])
