class Solution:
    def longestOnes(self, nums: List[int], k: int) -> int:
        left = count_z = 0
        for n in nums:
            if n == 0:
                count_z+=1
            if count_z > k:
                if nums[left] == 0:
                    count_z -= 1
                left +=1
        return len(nums) - left