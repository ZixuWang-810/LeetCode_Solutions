class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        res = []
        letters = {
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz",
        }
        def helper(remain, comb):
            if len(remain) == 0:
                res.append(comb)
                return
            for i in letters[remain[0]]:
                helper(remain[1:], comb+i)
        helper(digits, '')
        return res