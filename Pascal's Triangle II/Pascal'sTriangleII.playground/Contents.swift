import Foundation

class Solution {
    private var memo: [[Int: Int]: Int] = [:]

    func getRow(_ rowIndex: Int) -> [Int] {
        return (0...rowIndex).map({ pas(rowIndex, $0) })
    }

    private func pas(_ i: Int, _ j: Int) -> Int {
        if j == 0 || i == j {
            return 1
        }

        if let ret = memo[[i: j]] {
            return ret
        }

        let ret = pas(i - 1, j - 1) + pas(i - 1, j)
        memo[[i: j]] = ret

        return ret
    }
}

let s = Solution()
s.getRow(27)
