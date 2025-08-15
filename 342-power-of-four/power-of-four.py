class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        if n < 4 and n != 1:
             return False
        else:
            while n >= 4:
                if(n%4):
                    return False
                else:
                    n /= 4
            return True if n == 1 else False