import Foundation

class Solution {
    var count = 0

    func totalNQueens(_ n: Int) -> Int {
        var m = create_matrix(n)
        count = 0
        iterate_row(&m, 0)
        return count
    }

    func iterate_row(_ m: inout [[Int]], _ row: Int) {
        let N = m.count

        if row >= N {
            return
        }

        for col in 0..<N {
            if m[row][col] == 0 {
                matrix_set(&m, row, col, 0, row + 1)

//                print_matrix(m)
//                print("")

                if row == N - 1 {
                    count += 1
                } else {
                    iterate_row(&m, row + 1)
                }
            }

            matrix_set(&m, row, col, row + 1, 0)
        }
    }

    func create_matrix(_ n: Int) -> [[Int]] {
        return Array(repeating: Array(repeating: 0, count: n), count: n)
    }

    func print_matrix(_ m: [[Int]]) {
        for row in m {
            print(row)
        }
    }

    func matrix_set(_ m: inout [[Int]], _ row: Int, _ col: Int, _ prev: Int, _ val: Int) {
        let N = m.count
        for j in 0..<N {
            if m[row][j] == prev {
                m[row][j] = val
            }

            if m[j][col] == prev {
                m[j][col] = val
            }

            if row + j < N && col + j < N {
                if m[row + j][col + j] == prev {
                    m[row + j][col + j] = val
                }
            }

            if row - j >= 0 && col - j >= 0 {
                if m[row - j][col - j] == prev {
                    m[row - j][col - j] = val
                }
            }

            if row - j >= 0 && col + j < N {
                if m[row - j][col + j] == prev {
                    m[row - j][col + j] = val
                }
            }

            if row + j < N && col - j >= 0 {
                if m[row + j][col - j] == prev {
                    m[row + j][col - j] = val
                }
            }
        }
    }
}

let s = Solution()
s.totalNQueens(5)

var m = s.create_matrix(5)
s.matrix_set(&m, 0, 0, 0, 1)
s.print_matrix(m)

print("")
s.matrix_set(&m, 1, 2, 0, 2)
s.print_matrix(m)

print("")
s.matrix_set(&m, 1, 2, 2, 0)
s.print_matrix(m)
