class Solution:
    def closeStrings(self, word1: str, word2: str) -> bool:
        dic1, dic2 = {}, {}
        for i in word1:
            if i in dic1: dic1[i]+=1
            else:dic1[i] = 1
        for j in word2:
            if j in dic2: dic2[j]+=1
            else:dic2[j] = 1
        occ1 = sorted(dic1.values())
        occ2 = sorted(dic2.values())

        return occ1 == occ2 and set(dic1.keys()) == set(dic2.keys())