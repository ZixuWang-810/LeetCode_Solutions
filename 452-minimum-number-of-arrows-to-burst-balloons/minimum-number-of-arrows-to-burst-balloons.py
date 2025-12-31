class Solution:
    def findMinArrowShots(self, points: List[List[int]]) -> int:
        if not points: return 0
        points.sort(key = lambda x : x[1])
        res = 1
        first_end = points[0][1]
        for x, y in points:
            if first_end < x:
                res+=1
                first_end = y
        return res