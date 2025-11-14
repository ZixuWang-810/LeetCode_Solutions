class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        zero, pro, n = 0, 1, len(nums)
        for i in nums: 
            if i != 0: 
                pro*=i
            else: zero+=1
        if zero > 1: return [0]*n
        res = []
        if zero == 0:
            for i in nums:
                res.append(pro//i)
        else:
            for i in nums:
                if i==0:
                    res.append(pro)
                else: res.append(0)
        return res
