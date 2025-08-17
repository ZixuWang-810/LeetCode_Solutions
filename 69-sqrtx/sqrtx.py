class Solution:
    def mySqrt(self, x: int) -> int:
        for i in range(2+x):
            if i**2 > x:
                return i-1
