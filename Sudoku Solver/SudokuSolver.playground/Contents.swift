import Foundation

class Solution {
    var stack: [(Int, Int)] = []

    func solveSudoku(_ board: inout [[Character]]) {
        for i in 0..<9 {
            for j in 0..<9 {

                if board[i][j] == "." {
                    let optns = options(board, i, j)

                    //print(i, j, optns)

                    for op in optns {
                        board[i][j] = op
                        stack.append((i, j))

                        print(isFinished(board))

//                        print_map(board)
//                        print("")

                        solveSudoku(&board)
                    }

                    if let prev = stack.last {
                        //print("prev ", prev)
                        board[prev.0][prev.1] = "."
                        stack.removeLast()
                    }

                    return
                }
            }
        }
    }

    func options(_ board: [[Character]], _ row: Int, _ col: Int) -> Set<Character> {
        let row_numbers = board[row].filter({ $0 != "." })
        let col_numbers = board.map({ $0[col] }).filter({ $0 != "." })

        var sub_set: Set<Character> = Set()
        for i in 0..<3 {
            for j in 0..<3 {
                let num = board[row / 3 * 3 + i][col / 3 * 3 + j]
                if num != "." {
                    sub_set.insert(num)
                }
            }
        }

        let all: Set<Character> = Set("123456789".map({ $0 }))

        return all
            .subtracting(row_numbers)
            .subtracting(col_numbers)
            .subtracting(sub_set)
    }

    func isFinished(_ board: [[Character]]) -> Int {
        var count = 0
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    count += 1
                }
            }
        }

        return count
    }

    func print_map(_ map: [[Character]]) {
        map.forEach({ print($0) })
    }

}

let map: [String] = [
    "53..7....",
    "6..195...",
    ".98....6.",

    "8...6...3",
    "4..8.3..1",
    "7...2...6",

    ".6....28.",
    "...419..5",
    "....8..79"
]

func convert(map: [String]) -> [[Character]] {
    return map.map { $0.map({ $0 }) }
}

func print_map(_ map: [[Character]]) {
    map.forEach({ print($0) })
}

var char_map = convert(map: map)

let s = Solution()
s.options(char_map, 0, 5)
s.solveSudoku(&char_map)
print_map(char_map)
