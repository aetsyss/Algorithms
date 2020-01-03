import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    if nums.count == 1 { return nums[0] }

    var local_max = nums[0]
    var global_max = nums[0]

    for n in nums.dropFirst() {
        local_max = max(local_max + n, n)
        global_max = max(global_max, local_max)
    }

    return global_max
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
