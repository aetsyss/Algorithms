import Foundation

func reorder(_ nums: inout [Int]) -> Int {
    if nums.count < 2 {
        return 0
    }

    var a = 0, b = nums.count - 1
    var count = 0
    while a < b {
        if nums[a] != 0 {
            a += 1
            continue
        }

        if nums[b] == 0 {
            b -= 1
            continue
        }

        nums.swapAt(a, b)

        a += 1
        b -= 1
    }

    for n in nums {
        if n == 0 {
            count += 1
        }
    }

    return count
}

var nums = [3, 0, 2, 0, 0, 4, 1, 0]
nums
reorder(&nums)
nums
