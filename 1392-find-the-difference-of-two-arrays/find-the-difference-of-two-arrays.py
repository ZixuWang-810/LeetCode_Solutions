class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
         s1 = set(nums1)
         s2 = set(nums2)
         com = s1 & s2
         for i in com:
            s1.remove(i)
            s2.remove(i)
         return [list(s1), list(s2)]