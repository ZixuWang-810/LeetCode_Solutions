class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        dic1, dic2 = Counter(word1), Counter(word2)
        return dic1.keys() == dic2.keys() and sorted(dic1.values()) == sorted(dic2.values())