import Foundation

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var ret: Set<[Int]> = Set()
        var visited: Set<Int> = Set()

        for j in 0..<nums.count {
            if visited.contains(nums[j]) {
                continue
            }

            visited.insert(nums[j])

            var t = nums
            let x = t.remove(at: j)
            let yz: [[Int]] = twoSum(t, 0 - x).map {
                var ret = $0
                ret.append(x)
                return ret.sorted()
            }

            if !yz.isEmpty {
                print(x, yz)
                yz.forEach({ ret.insert($0) })
            }
        }

        return Array(ret)
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var ret: [[Int]] = []
        var s: Set<Int> = Set()

        for n in nums {
            if s.contains(target - n) {
                ret.append([n, target - n])
            } else {
                s.insert(n)
            }
        }

        return ret
    }
}

let s = Solution()
let nums = [-1, 0, 1, 2, -1, -4]
s.threeSum(nums)

