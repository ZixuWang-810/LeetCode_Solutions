class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        index = {}
        n = len(s)
        res = 0
        i = 0
        for j in range(n):
            if s[j] in index:
                i = max(index[s[j]], i)
            res = max(res, j - i + 1)
            index[s[j]] = j+1
        return res