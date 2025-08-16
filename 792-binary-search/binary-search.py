class Solution:
    def search(self, nums: List[int], target: int) -> int:
        left, right = 0, len(nums)-1
        if nums[left] > target or nums[right] < target:
            return -1
        else:
            while left <= right:
                mid = (left + right) //2
                if nums[mid] == target:
                    return mid
                elif nums[mid] < target:
                    left = mid+1
                else:
                    right = mid-1
            return -1