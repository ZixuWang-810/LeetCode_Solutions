class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        left, right = 0, len(nums) - 1
        res = [-1, -1]  
        while left <= right:
            mid = left + (right -left)//2
            if nums[mid] == target:
                left = right = mid
                while left >= 0 and nums[left] == target: left-=1
                while right <= len(nums)-1 and nums[right] == target:
                    right +=1
                res = [left+1, right-1]
                return res
            if nums[mid] > target: right = mid-1
            else: left = mid+1
        return res
