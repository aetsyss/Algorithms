import Foundation

class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: max(n + 1, 3))

        dp[0] = 0
        dp[1] = 1
        dp[2] = 2

        if n > 2 {
            for j in 3..<n + 1 {
                dp[j] = dp[j - 2] + dp[j - 1]
            }
        }

        return dp[n]
    }
}

let s = Solution()
s.climbStairs(1)
