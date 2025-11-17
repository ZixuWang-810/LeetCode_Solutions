class Solution:
    def maxOperations(self, nums: List[int], k: int) -> int:
        nums.sort()
        slow, fast = 0, len(nums)-1
        res = 0
        while slow < fast:
            total = nums[slow] + nums[fast]
            if total > k:
                fast-=1
            elif total < k:
                slow +=1
            else:
                res+=1
                slow+=1
                fast-=1
        return res