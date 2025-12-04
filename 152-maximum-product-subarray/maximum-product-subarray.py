class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        pre, surr, res = 1, 1, float('-inf')
        for i in range(len(nums)):
            pre *= nums[i]
            surr *= nums[len(nums)-i-1]
            res = max(res, surr, pre)
            if pre == 0: pre = 1
            if surr == 0: surr = 1
        return res