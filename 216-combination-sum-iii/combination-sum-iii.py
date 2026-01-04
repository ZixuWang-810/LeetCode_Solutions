class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        res = []
        def backtrack(comb, remain, start):
            if remain == 0 and len(comb) == k:
                res.append(list(comb))
                return
            if remain < 0: return
            if len(comb) > k: return
            for i in range(start+1, 10):
                comb.append(i)
                backtrack(comb, remain - i, i)
                comb.pop()
        backtrack([], n, 0)
        return res
