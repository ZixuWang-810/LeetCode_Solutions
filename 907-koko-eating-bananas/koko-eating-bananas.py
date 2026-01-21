class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        l, r = 1, max(piles)
        while l < r:
            mid = (l+r) // 2
            hr = 0
            for i in piles:
                hr+=ceil(i / mid)
            if hr <= h: r = mid
            else: l = mid + 1
        return r