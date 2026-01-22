class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        res = sum(nums[:k])
        left, right = 0, k
        cur = res
        while right < len(nums):
            cur = cur - nums[left] + nums[right]
            res = max(res, cur)
            left+=1
            right+=1
        return res/k