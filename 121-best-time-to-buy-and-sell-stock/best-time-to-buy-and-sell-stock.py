class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min_p = float('inf')
        max_p = 0
        for i in range(len(prices)):
            if prices[i] < min_p:
                min_p = prices[i]
            else:
                max_p = max(max_p, prices[i] - min_p)
        return max_p