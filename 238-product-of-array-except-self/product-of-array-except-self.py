class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        zero = 0
        res = []
        pro = 1
        for i in nums: 
            if i == 0: 
                zero+=1
        if zero > 1: return [0]*len(nums)
        for i in nums: 
            if i != 0: 
                pro*=i
        if zero == 0:
            for i in nums:
                res.append(pro//i)
        else:
            for i in nums:
                if i==0:
                    res.append(pro)
                else: res.append(0)
        return res
