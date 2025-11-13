class Solution:
    def reverseWords(self, s: str) -> str:
        res = []
        res_s = ''
        temp = ''
        for i in range(len(s)):
            if s[i] == ' ':
                if temp != '':
                    res.append(temp)
                temp = ''
            else:
                temp+=s[i]
        if temp!='': res.append(temp)
        for i in range(len(res)-1, -1, -1):
            res_s = res_s + res[i]
            if i != 0:
                res_s = res_s+' '
        return res_s