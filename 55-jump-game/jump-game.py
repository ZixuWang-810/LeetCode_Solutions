class Solution:
    def canJump(self, nums: List[int]) -> bool:
        temp = 1
        if len(nums) == 1: return True
        for i in range(len(nums)-2, -1, -1):
            if nums[i] >= temp:
                temp = 1
            else:
                temp+=1
        return temp <= nums[0]