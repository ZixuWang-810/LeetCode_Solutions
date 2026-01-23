class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        pre, sur = 1, 1
        n = len(nums)
        res = float('-inf')
        for i in range(n):
            pre *= nums[i]
            sur*= nums[n-i-1]
            res = max(res, pre, sur)
            if pre == 0: pre = 1
            if sur == 0: sur = 1
        return res