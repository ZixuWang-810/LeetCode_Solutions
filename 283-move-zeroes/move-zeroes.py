class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        left = 0
        for i in range(len(nums)):
            if nums[left] == 0:
                if nums[i] != 0:
                    nums[left] = nums[i]
                    nums[i] = 0
                    left +=1
            else: left += 1
