class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        res =  float('-inf')
        surf = pre = 1
        n = len(nums)
        for i in range(n):
            pre *=nums[i]
            surf *= nums[n-i-1]
            res = max(res, pre, surf)
            if pre == 0: pre = 1
            if surf == 0: surf = 1
        return res