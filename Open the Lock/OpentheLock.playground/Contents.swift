import Foundation

class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        var ret = 0

        let d = Set(deadends.map({ $0.compactMap({ Int("\($0)") }) }))
        let t = target.compactMap({ Int("\($0)") })
        var q = [[0, 0, 0, 0]]
        var v = Set([[0, 0, 0, 0]])

        if d.contains([0, 0, 0, 0]) {
            return -1
        }

        while !q.isEmpty {
            let count = q.count

            for _ in 0..<count {
                let element = q.removeFirst()

                if element == t {
                    return ret
                }

                for i in 0..<4 {
                    for j in stride(from: -1, to: 2, by: 2) {
                        var x = element

                        let new_val = x[i] + j < 0
                            ? 9
                            : x[i] + j > 9
                                ? 0
                                : x[i] + j

                        x[i] = new_val

                        if !d.contains(x) && !v.contains(x) {
                            v.insert(x)
                            q.append(x)
                        }
                    }
                }

            }

            ret += 1
        }

        return -1
    }
}

let s = Solution()
let deadends = ["0000"], target = "8888"
s.openLock(deadends, target)
