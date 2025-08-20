class Solution:
    def mySqrt(self, x: int) -> int:
        left, right = 0, x
        while left <= right:
            mid = left + (right-left) // 2
            if mid**2 == x: return mid
            if mid**2 > x:
                right = mid -1 
            else: left = mid +1
        return right

### 10: 0,10,5  0,4,2  3,4,3 4,4,4, 4,3,