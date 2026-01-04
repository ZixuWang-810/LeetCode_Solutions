class Solution:
    def minCostClimbingStairs(self, cost: List[int]) -> int:
        min_cos = [0] * (len(cost) + 1)
        for i in range(2, len(cost)+ 1):
            one_step = min_cos[i-1] + cost[i-1]
            two_step = min_cos[i-2] + cost[i-2]
            min_cos[i] = min(one_step, two_step)

        return min_cos[-1]