import Foundation

func productExceptSelf(_ nums: [Int]) -> [Int] {
    if nums.count < 2 {
        return []
    }

    let N = nums.count
    var L = Array(repeating: 0, count: N)
    var R = Array(repeating: 0, count: N)
    var ret = Array(repeating: 0, count: N)

    for j in 0..<nums.count {
        if j == 0 {
            L[j] = 1
            R[N-1-j] = 1
        } else {
            L[j] = nums[j-1] * L[j-1]
            R[N-1-j] = nums[N-j] * R[N-j]
        }
    }

    for j in 0..<nums.count {
        ret[j] = L[j] * R[j]
    }

    return ret
}

productExceptSelf([1, 2, 3, 4, 5])
