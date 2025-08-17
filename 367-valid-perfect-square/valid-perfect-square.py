class Solution:
    def isPerfectSquare(self, num: int) -> bool:
        if num == 1: return True
        left, right = 2, num
        while left <= right:
            mid = left + (right - left) // 2
            if mid == num / mid:
                return True
            elif mid < num / mid:
                left = mid + 1 
            else:
                right = mid - 1
        return False