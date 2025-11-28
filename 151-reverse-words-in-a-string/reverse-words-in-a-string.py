class Solution:
    def reverseWords(self, s: str) -> str:
        s = str(s)
        res = s.split()
        res.reverse()
        return ' '.join(res)