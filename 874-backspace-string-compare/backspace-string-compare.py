class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        def build(st):
            res = []
            for i in st:
                if len(res) > 0 and i == '#':
                    res.pop()
                if i != '#':
                    res.append(i)
            return res
        return build(s) == build(t)