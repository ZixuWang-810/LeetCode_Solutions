class Solution:
    def reverseVowels(self, s: str) -> str:
        s = list(s)
        idx = []
        vow = []
        tab = ['a', 'e', 'i','o', 'u','A','E','I','O','U']
        for i in range(len(s)):
            if s[i] in tab:
                idx.append(i)
                vow.append(s[i])
        vow.reverse()
        for i in range(len(idx)):
            s[idx[i]] = vow[i]
        s= ''.join(s)
        return s