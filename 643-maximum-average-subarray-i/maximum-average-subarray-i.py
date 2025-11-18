class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        max_s = sum(nums[:k])
        n = len(nums)
        if len(nums) == k: return max_s / k
        c_sum = max_s
        for i in range(k, n):
            c_sum += nums[i] - nums[i-k]
            max_s = max(max_s, c_sum)
        return max_s / k