class Solution:
    def tribonacci(self, n: int) -> int:
        i = 2
        res = [0, 1, 1]
        while i < 38:
            res.append(res[i-2] + res[i-1] + res[i])
            i+=1
        return res[n]