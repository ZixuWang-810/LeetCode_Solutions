class Solution:
    def numDecodings(self, s: str) -> int:
        memo = {}
        
        def backtrack(index):
            if index == len(s):
                return 1
            # Check memo
            if index in memo:
                return memo[index]
            
            if s[index] == '0':
                return 0   
            res = backtrack(index + 1)
            if (index + 1 < len(s) and int(s[index:index+2]) <= 26):
                res += backtrack(index + 2)
            
            memo[index] = res
            return res
        
        return backtrack(0)