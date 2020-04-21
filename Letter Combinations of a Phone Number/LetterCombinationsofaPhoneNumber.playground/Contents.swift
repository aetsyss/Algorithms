import Foundation

class Solution {
    private static let data: [Character: String] = [
        "2": "abc",
        "3": "def",
        "4": "ghi",
        "5": "jkl",
        "6": "mno",
        "7": "pqrs",
        "8": "tuv",
        "9": "wxyz"
    ]

    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }

        if digits.count == 1 {
            if let str = Solution.data[digits.first!] {
                return str.map { "\($0)" }
            } else {
                return []
            }
        }

        let a = letterCombinations(String(digits.prefix(1)))
        let b = letterCombinations(String(digits.suffix(digits.count - 1)))

        var ret: [String] = []

        for aa in a {
            for bb in b {
                ret.append(aa + bb)
            }
        }

        return ret
    }
}

let s = Solution()
print(s.letterCombinations("234"))
