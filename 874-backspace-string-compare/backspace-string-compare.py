class Solution:
    def backspaceCompare(self, s: str, t: str) -> bool:
        def build(s):
            ans = []
            for i in s:
                if i != '#':
                    ans.append(i)
                elif len(ans) > 0 : ans.pop()
                else:continue
            return ans
        return build(s) == build(t)