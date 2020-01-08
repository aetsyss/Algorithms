import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
    var rows = Set<Int>()
    var cols = Set<Int>()

    for i in 0..<matrix.count {
        for j in 0..<matrix[i].count {
            if matrix[i][j] == 0 {
                rows.insert(i)
                cols.insert(j)
            }
        }
    }

    for r in rows {
        for i in 0..<matrix[r].count {
            matrix[r][i] = 0
        }
    }

    for c in cols {
        for i in 0..<matrix.count {
            matrix[i][c] = 0
        }
    }
}

var m = [
  [0,1,2,0],
  [3,4,5,2],
  [1,3,1,5]
]

setZeroes(&m)
