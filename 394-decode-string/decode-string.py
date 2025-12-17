class Solution:
    def decodeString(self, s: str) -> str:
        res = []
        for char in s:
            if char != ']': res.append(char)
            else:
                temp = ''
                while res[-1] != '[':
                    temp = res.pop() + temp
                nums = ''
                res.pop()
                while res and res[-1].isdigit():
                    nums = res.pop()+nums
                temp = int(nums) * temp
                res.append(temp)
        return ''.join(res)