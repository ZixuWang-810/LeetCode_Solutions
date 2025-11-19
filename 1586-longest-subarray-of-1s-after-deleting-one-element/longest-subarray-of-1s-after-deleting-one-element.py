class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        left = zero_c = 0
        for right in range(len(nums)):                
            if nums[right] == 0:
                zero_c +=1
            if zero_c > 1 :
                if nums[left] == 0:
                    zero_c-=1
                left+=1
        return len(nums) - left - 1