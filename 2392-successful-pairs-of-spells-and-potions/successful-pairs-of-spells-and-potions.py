class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        n = len(potions)
        res = []
        
        for spell in spells:
            # Find minimum potion strength needed
            min_potion = math.ceil(success / spell)
            
            # Find leftmost position >= min_potion
            idx = bisect.bisect_left(potions, min_potion)
            
            res.append(n - idx)
        
        return res