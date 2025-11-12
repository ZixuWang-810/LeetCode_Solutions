class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:
        if str1 + str2 != str2 + str1: return ""
        def gcd(l1, l2):
            while l2 != 0:
                l1, l2 = l2, l1 % l2
            return l1
        return str1[0 : gcd(len(str1), len(str2))]