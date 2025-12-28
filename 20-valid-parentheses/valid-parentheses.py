class Solution:
    def isValid(self, s: str) -> bool:
        res = []
        dic = {')':'(',']':'[','}':'{'}
        for i in s:
            if i == '(' or i == '[' or i == '{':
                res.append(i)
            else:
                if not res or res.pop() != dic[i]:
                    return False
        return len(res) == 0