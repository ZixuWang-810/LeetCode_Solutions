class Solution:
    def isSubsequence(self, s: str, t: str) -> bool:
        slow, fast = 0, 0
        while slow < len(s):
            if fast == len(t): return False
            else:
                if s[slow] == t[fast]:
                    slow+=1
                    fast+=1
                else: fast+=1
        return True
