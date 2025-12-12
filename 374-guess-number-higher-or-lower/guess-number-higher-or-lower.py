# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num: int) -> int:

class Solution:
    def guessNumber(self, n: int) -> int:
        left, right = 1, n

        while left <= right:
            temp = left + (right - left) // 2
            if guess(temp) == -1:
                right = temp - 1
            elif guess(temp) == 1:
                left = temp + 1
            else: return temp