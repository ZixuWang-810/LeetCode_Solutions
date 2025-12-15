class Solution:
    def combinationSum3(self, k: int, n: int) -> List[List[int]]:
        def backtrack(index, num, tar):
            if tar == 0 and len(num) == k: 
                res.append(num.copy())
                return
            elif len(num) == k or tar < 0: return

            for i in range(index, 9):
                num.append(i+1)
                backtrack(i+1, num, tar-i-1)
                num.pop()
        res = []
        backtrack(0, [], n)
        return res
            