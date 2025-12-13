class Solution:
    def successfulPairs(self, spells: List[int], potions: List[int], success: int) -> List[int]:
        potions.sort()
        res = []
        n = len(potions)
        for i in spells:
            tar = success // i if not success % i else (success//i + 1)
            left, right, mid = 0, n - 1, 0
            while left <= right:
                mid = left + (right - left) // 2
                if potions[mid] < tar:
                    left = mid + 1
                elif potions[mid] >= tar:
                    right = mid - 1

            if i * potions[mid] < success: res.append(n-mid-1)
            else: res.append(n - mid)
        return res