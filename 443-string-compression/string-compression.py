class Solution:
    def compress(self, chars: List[str]) -> int:
        slow = fast = 0
        count = 0
        while fast < len(chars):
            s = chars[fast]
            count = 0
            while fast < len(chars) and chars[fast] == s:
                count+=1
                fast+=1
            chars[slow] = s
            slow+=1
            if count > 1:
                for i in str(count):
                    chars[slow] = i
                    slow+=1
        return slow