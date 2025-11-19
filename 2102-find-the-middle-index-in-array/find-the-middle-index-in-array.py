class Solution:
    def findMiddleIndex(self, nums: List[int]) -> int:
        pre = sur = 0
        for i in range(1,len(nums)):
            sur+=nums[i]
        if pre == sur: return 0
        for i in range(1, len(nums)):
            pre+=nums[i-1]
            sur-=nums[i]
            if pre == sur: return i
        return -1