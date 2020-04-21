import Foundation

class Solution {
    func kthGrammar(_ N: Int, _ K: Int) -> Int {
        if N < 2 {
            return 0
        }

        let ret = kthGrammar(N - 1, (K + 1) / 2)

        if (ret == 1 && K % 2 == 0) || (ret == 0 && K % 2 == 1) {
            return 0
        } else {
            return 1
        }
    }
}

let s = Solution()
s.kthGrammar(4, 5)
