class Solution(object):
    def removeStars(self, s: str) -> str:
        l = []
        for i in s:
            if i != '*':
                l.append(i)
            else:
                l.pop()
        return ''.join(l)
            