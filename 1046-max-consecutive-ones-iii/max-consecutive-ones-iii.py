class Solution:
    def longestOnes(self, nums, k):
        left = 0
        zeroCount = 0
        for right in range(len(nums)):
            if nums[right] == 0:
                zeroCount += 1
            
            if zeroCount > k:
                if nums[left] == 0:
                    zeroCount -= 1
                left += 1
        
        # At the end, right - left is the max length
        return len(nums) - left