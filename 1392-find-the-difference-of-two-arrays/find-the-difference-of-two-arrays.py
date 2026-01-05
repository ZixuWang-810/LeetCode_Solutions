class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
         s1 = set(nums1)
         s2 = set(nums2)
         com = s1 & s2
         return [list(s1 - com), list(s2-com)]