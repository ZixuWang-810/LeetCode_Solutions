class Solution:
    def search(self, nums: List[int], target: int) -> int:
        # Step 1: Find pivot (smallest element)
        left, right = 0, len(nums) - 1
        
        while left <= right:
            mid = (left + right) // 2
            if nums[mid] > nums[-1]:
                left = mid + 1
            else:
                right = mid - 1
        
        pivot = left  # Index of smallest element
        
        # Step 2: Binary search helper
        def binary_search(l, r):
            while l <= r:  # ← Fixed: left <= right
                mid = (l + r) // 2
                if nums[mid] == target:
                    return mid
                elif nums[mid] < target:
                    l = mid + 1
                else:
                    r = mid - 1
            return -1
        
        if target >= nums[pivot] and target <= nums[-1]:
            return binary_search(pivot, len(nums) - 1)
        else:
            return binary_search(0, pivot - 1)