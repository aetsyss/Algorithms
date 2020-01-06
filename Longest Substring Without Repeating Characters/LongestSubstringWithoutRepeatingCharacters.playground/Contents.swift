import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var dict: [Character: Int] = [:]
    var ret = 0

    var i = 0

    for (offset, ch) in s.enumerated() {
        if let index = dict[ch] {
            i = max(i, index + 1)
        }

        dict[ch] = offset

        print(ch, ret, i, offset)
        ret = max(ret, offset-i+1)
        print(ret)
    }

    return ret
}

lengthOfLongestSubstring("pwwkew")


