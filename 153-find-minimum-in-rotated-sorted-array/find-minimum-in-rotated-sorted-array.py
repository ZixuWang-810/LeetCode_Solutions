class Solution:
    def findMin(self, nums: List[int]) -> int:
        left, right = 0, len(nums) - 1
        
        while left < right:
            mid = (left + right) // 2
            
            # If mid element is greater than rightmost element,
            # minimum is in the right half
            if nums[mid] > nums[right]:
                left = mid + 1
            else:
                # Minimum is in the left half (including mid)
                right = mid
        
        # When left == right, we found the minimum
        return nums[left]