class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        s, l = 1, max(piles)
        while s < l:
            mid = (s+l) // 2
            temp = 0
            for i in piles:
                temp+=ceil(i / mid)
            if temp <= h: 
                l = mid
            else: s = mid + 1
        return l