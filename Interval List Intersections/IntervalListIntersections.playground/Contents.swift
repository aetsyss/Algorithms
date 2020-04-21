import Foundation

class Solution {
    func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
        var ret: [[Int]] = []

        for a in A {
            for b in B {
                if b[1] < a[0] {
                    continue
                }

                if (b[1] >= a[0] && b[1] <= a[1]) || (b[0] >= a[0] && b[0] <= a[1]) || (a[0] >= b[0] && a[1] <= b[1]) {
                    let x = max(a[0], b[0])
                    let y = min(a[1], b[1])

                    ret.append([x, y])
                }

                if b[0] > a[1] {
                    break
                }
            }
        }

        return ret
    }
}

let s = Solution()
let A = [[0,2],[5,10],[13,23],[24,25]], B = [[1,5],[8,12],[15,24],[25,26]]
s.intervalIntersection(A, B)
