class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        res = curr = nums[0]
        for i in range(1, len(nums)):
            curr += nums[i]
            curr = max(nums[i], curr)
            res = max(res, curr)
        return res