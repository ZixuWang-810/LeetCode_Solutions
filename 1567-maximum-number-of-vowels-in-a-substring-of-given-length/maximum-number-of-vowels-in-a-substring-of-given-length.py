class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        dic = 'aeiou'
        res = 0
        left = temp =  0
        for i in range(len(s)):
            if s[i] in dic: temp+=1
            if i - left + 1 == k:
                res = max(res, temp)
                if s[left] in dic: temp -= 1
                left += 1
        return res