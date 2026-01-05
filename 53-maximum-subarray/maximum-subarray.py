class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        res = curr = nums[0]
        for i in range(1, len(nums)):
            curr += nums[i]
            if curr < nums[i]:
                curr = nums[i]
            res = max(res, curr)
        return res