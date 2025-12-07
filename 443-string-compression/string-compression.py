class Solution:
    def compress(self, chars: List[str]) -> int:
        slow = fast = 0
        while fast < (len(chars)):
            char = chars[fast]
            count = 0
            while fast < len(chars) and chars[fast] == char:
                count +=1
                fast +=1
            chars[slow] = char
            slow+=1
            if count > 1:
                for c in str(count):
                    chars[slow] = c
                    slow +=1
        return slow