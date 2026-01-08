class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        dic1, dic2 = defaultdict(int), defaultdict(int)
        for i in word1:
            dic1[i] += 1
        for i in word2:
            dic2[i] += 1
        return dic1.keys() == dic2.keys() and sorted(dic1.values()) == sorted(dic2.values())