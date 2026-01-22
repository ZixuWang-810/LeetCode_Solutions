class Solution:
    def decodeString(self, s: str) -> str:
        res = []
        for i in s:
            if i == ']':
                temp = ''
                while res and res[-1] != '[':
                    temp = res.pop() + temp
                res.pop()
                nums = ''
                while res and res[-1].isdigit():
                    nums = res.pop()+nums
                temp = int(nums)*temp
                res.append(temp)
            else: res.append(i)
        return ''.join(res)