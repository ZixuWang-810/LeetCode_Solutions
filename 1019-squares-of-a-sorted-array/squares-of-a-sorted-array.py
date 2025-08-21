class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        left, right = 0, len(nums)-1
        res = [0 for _ in range(len(nums))]
        for i in range(right, -1, -1):
            if nums[left]**2 > nums[right]**2:
                res[i] = nums[left]**2
                left+=1
            else:
                res[i] = nums[right]**2
                right-=1
        return res