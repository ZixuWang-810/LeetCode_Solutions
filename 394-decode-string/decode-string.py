class Solution:
    def decodeString(self, s: str) -> str:
        res = []
        for i in s:
            temp = ''
            if i == ']':
                while res[-1] != '[':
                    temp = res.pop()+temp
                res.pop()
                count = ''
                while res and res[-1].isdigit():
                    count = res.pop() + count
                res.append(int(count)*temp)
            else:
                res.append(i)
        return ''.join(res)
