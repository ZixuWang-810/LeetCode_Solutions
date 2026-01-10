class Solution:
    def climbStairs(self, n: int) -> int:
        res = [0] * (n+1)
        return self.helper(0, n, res)
    def helper(self, i, n, memo):
        if i == n: return 1
        if i > n: return 0
        if memo[i] > 0: return memo[i]
        memo[i] = self.helper(i+1, n, memo) + self.helper(i+2, n, memo)
        return memo[i]