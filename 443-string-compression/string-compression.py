class Solution:
    def compress(self, chars: List[str]) -> int:
        ans = []
        i = 0
        count = 0
        s = ""
        while i < len(chars):
            if s == chars[i]:
                count+=1
            elif s == '':
                s = chars[i]
                count = 1
            else:
                if count == 1:
                    ans.append(s)
                else:
                    ans.append(s)
                    for n in str(count):
                        ans.append(n)
                s = chars[i]
                count = 1
            i+=1
        if count == 1: ans.append(s)
        else:
            ans.append(s)
            for n in str(count):
                ans.append(n)
        for a in range(len(ans)):
            chars[a] = ans[a]
        return len(ans)

            