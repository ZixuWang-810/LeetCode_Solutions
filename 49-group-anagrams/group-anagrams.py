class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        dic = defaultdict(list)
        for i in strs:
            temp = sorted(i)
            dic[tuple(temp)].append(i)
        return list(dic.values())