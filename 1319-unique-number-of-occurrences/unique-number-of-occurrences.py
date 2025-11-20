class Solution:
    def uniqueOccurrences(self, arr: List[int]) -> bool:
        occ = {}
        for i in arr:
            if i in occ: occ[i]+=1
            else:occ[i] = 1
        res = occ.values()
        return len(res) == len(set(res))