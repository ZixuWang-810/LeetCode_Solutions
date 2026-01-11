class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        dic = 'aeiou'
        res = 0
        for i in range(k):
            if s[i] in dic: res+=1
        index = 0
        temp = res
        while index + k < len(s):
            if s[index+k] in dic: temp+=1
            if s[index] in dic: temp-=1
            res = max(temp, res)
            index+=1
        return res
        