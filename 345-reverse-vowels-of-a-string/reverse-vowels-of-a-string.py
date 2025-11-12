class Solution:
    def reverseVowels(self, s: str) -> str:
        s = list(s)
        a, b = 0, len(s)-1
        tab = ['a', 'e', 'i','o', 'u','A','E','I','O','U']
        while a < b:
            if s[a] in tab and s[b] in tab:
                s[a], s[b] = s[b], s[a]
                a+=1
                b-=1
            elif s[a] not in tab:
                a+=1
            else:
                b -= 1      
        s= ''.join(s)
        return s