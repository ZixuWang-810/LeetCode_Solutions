class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        lgh = len(nums)
        if lgh == 0:
            return 0
        p1, p2 = 0, 0
        while p2 < lgh: 
            if nums[p2] != val:
                nums[p1] = nums[p2]
                p1 += 1
                p2 += 1
            else:
                p2+=1
        return p1