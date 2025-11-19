class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        s1 = set(nums1)
        s2 = set(nums2)
        for n in nums2:
            if n in s1:
                s2.remove(n)
                s1.remove(n)
        
        return [list(s1), list(s2)]