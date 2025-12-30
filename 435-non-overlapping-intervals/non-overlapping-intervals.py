class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        intervals.sort(key = lambda x: x[1])
        res = 0
        bound = -inf
        for x, y in intervals:
            if x >= bound: 
                bound = y
            else:
                res+=1
        return res