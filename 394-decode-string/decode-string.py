class Solution:
    def decodeString(self, s: str) -> str:
        res = []
        for ss in s:
            if ss != ']':
                res.append(ss)
            else:
                temp = ''
                while res and res[-1] != '[':
                    temp = res.pop() + temp
                res.pop()
                num = ''
                while res and res[-1].isdigit():
                    num = res.pop() + num
                res+=int(num)*temp
        return ''.join(res)