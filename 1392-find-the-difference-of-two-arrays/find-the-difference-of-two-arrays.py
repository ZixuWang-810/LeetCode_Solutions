class Solution:
    def findDifference(self, nums1: List[int], nums2: List[int]) -> List[List[int]]:
        res, temp1, temp2 = [], set(), set()
        for i in nums1:
            if i not in nums2:
                temp1.add(i)
        res. append(list(temp1))
        for i in nums2:
            if i not in nums1:
                temp2.add(i)
        res.append(list(temp2))
        return res