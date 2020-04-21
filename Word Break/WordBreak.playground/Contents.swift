import Foundation

class Solution {
    private var res = false

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        res = false
        ff(s, wordDict)
        return res
    }

    private func ff(_ s: String, _ wordDict: [String]) {
        if res == false {
            if s.isEmpty {
                res = true
            } else {
                for word in wordDict {
                    if s.hasPrefix(word) {
                        ff(String(s.suffix(s.count - word.count)), wordDict)
                    }
                }
            }
        }
    }
}

let s = Solution()
s.wordBreak("abcd", ["a","abc","b","cd"])
