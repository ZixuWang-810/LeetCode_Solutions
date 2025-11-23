class Solution:
    def longestOnes(self, nums: List[int], k: int) -> int:
        left = zc = 0
        for right in range(len(nums)):
            if nums[right] == 0:
                zc+=1
            if zc > k:
                if nums[left] == 0:
                    zc-=1
                left +=1
        return len(nums) - left 