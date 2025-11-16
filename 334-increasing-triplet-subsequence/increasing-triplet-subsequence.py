class Solution:
    def increasingTriplet(self, nums: List[int]) -> bool:
        n = len(nums)
        if n < 3: return False
        min_1 = min_2 = float('inf')
        i = 0
        while i < n:
            if nums[i] <= min_1:
                min_1 = nums[i]
            elif nums[i] <= min_2:
                min_2 = nums[i]
            else:
                return True
            i+=1
        return False
