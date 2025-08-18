class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        if nums[0] > 0: return [x**2 for x in nums]
        if nums[-1] < 0: return [x**2 for x in reversed(nums)]
        res = [0] * len(nums)
        left, right = 0, len(nums)-1
        for i in range(len(nums)-1, -1, -1):
            ll, rr = nums[left] ** 2, nums[right]**2
            if ll > rr:
                res[i] = ll
                left +=1
            else:
                res[i] = rr
                right -= 1
        return res