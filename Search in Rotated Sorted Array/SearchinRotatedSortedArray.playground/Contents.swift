import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var start = 0, end = nums.count - 1

        while start <= end {
            let mid = start + (end - start) / 2

            if nums[mid] == target {
                return mid
            }

            if nums[start] <= nums[mid] {
                if target >= nums[start] && target < nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else {
                if target > nums[mid] && target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }

        return -1
    }
}

let s = Solution()
s.search([5, 1, 3], 1)
