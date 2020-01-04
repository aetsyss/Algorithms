import Foundation

// recursive
func findMinRecursive(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    return findMin(nums, l: 0, h: nums.count - 1)
}

func findMin(_ nums: [Int], l: Int, h: Int) -> Int {
    if nums[l] <= nums[h] { return nums[l] }

    let mid = l + (h - l) / 2
    return min(findMin(nums, l: l, h: mid), findMin(nums, l: mid + 1, h: h))
}

findMinRecursive([4,5,6,7,0,1,2])


// iterative
func findMin(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
//    if nums.count == 1 { return nums[0] }

    var l = 0, h = nums.count - 1
    var ret = Int.max

    while l <= h {
        let mid = l + (h - l) / 2

        if nums[l] <= nums[mid] {
            ret = min(ret, nums[l])
            l = mid + 1
        } else {
            h = mid
        }
    }

    return ret
}

findMin([4,5,6,7,0,1,2])
