import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty {
            return []
        }

        let sorted = intervals.sorted(by: { $0[0] < $1[0] })

        var ret: [[Int]] = []
        var cur: [Int] = []

        for int in sorted {
            if cur.isEmpty {
                cur = int
            } else {
                // if overlapp
                if int[0] <= cur[1] {
                    cur[1] = max(int[1], cur[1])
                } else {
                    ret.append(cur)
                    cur = int
                }
            }
        }

        ret.append(cur)

        return ret
    }
}

let s = Solution()
s.merge([[1,3], [15,18], [2,6], [8,10]])
