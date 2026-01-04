class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        res = ''
        n1, n2 = len(word1), len(word2)
        if n1>= n2:
            for i in range(n2):
                res+=word1[i]
                res+=word2[i]
            res+=word1[n2:]
        else:
            for i in range(n1):
                res+=word1[i]
                res+=word2[i]
            res+=word2[n1:]
        return ''.join(res)
