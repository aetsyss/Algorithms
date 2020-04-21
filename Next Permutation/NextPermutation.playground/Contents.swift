import Foundation

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }

        for j in stride(from: nums.count - 1, to: 0, by: -1) {
            if nums[j] > nums[j - 1] {

                var k = j
                while k < nums.count {
                    if nums[k] < nums[j - 1] {
                        break
                    }
                    k += 1
                }

                k -= 1

                nums.swapAt(k, j - 1)

                for k in 0..<(nums.count - j) / 2 {
                    nums.swapAt(j + k, nums.count - 1 - k)
                }

                return
            }
        }

        for j in 0..<nums.count / 2 {
            nums.swapAt(j, nums.count - 1 - j)
        }
    }
}

var nums = [1, 2, 3]//[1, 5, 8, 4, 7, 6, 5, 3, 1]
let s = Solution()
s.nextPermutation(&nums)
nums
