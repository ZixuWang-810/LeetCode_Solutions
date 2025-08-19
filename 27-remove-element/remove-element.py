class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        left = 0
        for i in nums:
            if i != val:
                nums[left] = i
                left +=1
        return left