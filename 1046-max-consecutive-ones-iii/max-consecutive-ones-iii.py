class Solution:
    def longestOnes(self, nums: List[int], k: int) -> int:
        left, maxlen, right = 0,0,0
        for right in range(len(nums)):
            if nums[right] == 0: k-=1
            while k < 0:
                if nums[left]== 0:
                    k+=1
                left+=1
            maxlen = max(maxlen, right - left+1)
        return maxlen