import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    var ret: [[Int]] = []

    if intervals.isEmpty {
        return []
    }

    let sorted = intervals.sorted(by: { $0[0] < $1[0] })

    var cur: [Int]? = nil

    for int in sorted {
        if cur == nil {
            cur = int
        } else {
            if cur![1] >= int[0] {
                cur![1] = max(cur![1], int[1])
            } else {
                ret.append(cur!)
                cur = int
            }
        }
    }

    ret.append(cur!)

    return ret
}

merge([[1,4],[2,3]])
