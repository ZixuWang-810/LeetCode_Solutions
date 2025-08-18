class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:
        left, sums, m_l = 0, 0, inf
        for i in range(len(nums)):
            sums += nums[i]
            while sums >= target: 
                m_l = (i - left + 1) if m_l > (i - left + 1) else m_l
                sums -= nums[left]
                left += 1
        return m_l if m_l != inf else 0

