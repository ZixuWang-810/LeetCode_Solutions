class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        m = 1/4
        while m < n:
            m*=4
        return True if m == n else False