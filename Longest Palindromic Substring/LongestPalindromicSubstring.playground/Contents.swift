import Foundation

class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }

        var low = 0
        var maxL = 0
        let word = Array(s)
        for i in 0..<word.count - 1 {
            checkSubString(i, i, word, &low,&maxL)
            checkSubString(i, i+1, word, &low, &maxL)
        }
        return String(word[low..<low + maxL])
    }

    func checkSubString(_ i:Int, _ j:Int, _ s:[Character],_ low:inout Int, _ maxL:inout Int) {
        var x = i
        var y = j
        while (x >= 0 && y < s.count && s[x] == s[y] ) {
            x -= 1
            y += 1
        }

        if (maxL < y - x - 1) {
            low = x + 1
            maxL = y - x - 1
        }
    }
}

let s = Solution()
s.longestPalindrome("ac")
// cbbd
// babad
// ac
//s.expand("deabcbaabghhg", 4, 4)
//s.expand("deabcbaabghhg", 10, 11)
