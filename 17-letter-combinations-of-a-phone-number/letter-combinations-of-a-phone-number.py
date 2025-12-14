class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        res = []
        dic = {
            '2': 'abc',
            '3': 'def',
            '4': 'ghi',
            '5': 'jkl',
            '6': 'mno',
            '7': 'pqrs',
            '8': 'tuv',
            '9': 'wxyz',
        }
        def backtrack(index, path):
            if len(path) == len(digits):
                res.append("".join(path))
                return
            for letter in dic[digits[index]]:
                backtrack(index+1, path+letter)
        backtrack(0, '')
        return res