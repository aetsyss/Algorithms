import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]

        for str in strs {
            let s = String(str.sorted())

            if dict[s] != nil {
                dict[s]!.append(str)
            } else {
                dict[s] = [str]
            }
        }

        return Array(dict.values)
    }

}

let s = Solution()
s.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
