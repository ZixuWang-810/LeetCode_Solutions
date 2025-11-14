class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        zero, pro, n = 0, 1, len(nums)
        for i in nums: 
            if i != 0: 
                pro*=i
            else: zero+=1
        if zero > 1: return [0]*n
        for i in range(n):
            if zero == 0:
                nums[i] = pro//nums[i]
            else:
                if nums[i] == 0:
                    nums[i] = pro
                else: nums[i] = 0
        return nums
