class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        res = 0
        s = set(nums)
        for i in s:
            if i-1 not in s:
                cur = i
                cur_len = 1
                while cur+1 in s:
                    cur += 1
                    cur_len += 1
                res = max(res, cur_len)
        return res
        