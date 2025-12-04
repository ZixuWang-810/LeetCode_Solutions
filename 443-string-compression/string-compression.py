class Solution:
    def compress(self, chars: List[str]) -> int:
        pos = 0
        i = 0
        while i < len(chars):
            c = chars[i]
            count = 0
            while i < len(chars) and chars[i] == c:
                count += 1
                i += 1
            chars[pos] = c
            pos += 1
            if count > 1:
                for c in str(count):
                    chars[pos] = c
                    pos += 1
        return pos
