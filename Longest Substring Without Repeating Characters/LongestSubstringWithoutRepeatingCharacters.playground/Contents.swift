import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.isEmpty {
        return 0
    }

    var dict: [Character: Int] = [:]
    var ret = Int.min

    var i = 0

    for (offset, ch) in s.enumerated() {
        if let index = dict[ch] {
            i = max(i, index + 1)
        }

        dict[ch] = offset

        ret = max(ret, offset-i+1)
    }

    return ret
}

lengthOfLongestSubstring("pwwkew")


