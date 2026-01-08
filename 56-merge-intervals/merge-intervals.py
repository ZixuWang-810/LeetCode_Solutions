class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key =  lambda x: x[0])
        res = []
        for i in intervals:
            if not res: res.append(i)
            if res[-1][1] >= i[0]:
                if res[-1][1] < i[1]:
                    res[-1][1] = i[1]
            else:
                res.append(i)
        return res