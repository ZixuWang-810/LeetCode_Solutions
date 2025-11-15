class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        pre = surf = 1
        max_p = float('-inf')
        n = len(nums)
        for i in range(n):
            pre *= nums[i]
            surf *= nums[n-i-1]
            max_p = max(max_p, pre, surf)

            if pre == 0: pre = 1
            if surf == 0: surf = 1
        return max_p