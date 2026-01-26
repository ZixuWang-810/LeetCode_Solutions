class Solution:
    def rob(self, nums: List[int]) -> int:
        N = len(nums)
        res = [None] * (N + 1)
        res[N], res[N - 1] = 0, nums[N - 1]
        for i in range(N - 2, -1, -1):

            # Same as recursive solution.
            res[i] = max(
                res[i + 1], res[i + 2] + nums[i]
            )

        return res[0]