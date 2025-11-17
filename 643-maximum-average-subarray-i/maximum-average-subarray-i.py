class Solution:
    def findMaxAverage(self, nums: List[int], k: int) -> float:
        max_s = 0
        for i in range(k):
            max_s+=nums[i] 
        n = len(nums)
        if len(nums) == k: return max_s / k
        head = 0
        c_sum = max_s
        for i in range(k, n):
            c_sum = c_sum+nums[i]-nums[head]
            max_s = max(max_s, c_sum)
            head+=1
        return max_s / k