class Solution:
    def countSubstrings(self, s: str) -> int:
        n = len(s)
        res = 0

        def expand(i, j):
            nonlocal res
            while i >= 0 and j < n and s[i] == s[j]:
                res += 1
                i -= 1
                j += 1

        for k in range(n):
            expand(k, k)  # Odd length
            expand(k, k+1)  # Even length
        return res