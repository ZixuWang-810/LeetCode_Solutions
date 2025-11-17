class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        nums.sort()
        slow, fast = 0, len(nums)-1
        res = 0
        while slow < fast:
            if nums[slow] + nums[fast] > k:
                fast-=1
            elif nums[slow] + nums[fast] < k:
                slow +=1
            else:
                res+=1
                slow+=1
                fast-=1
        return res