class Solution:
    def compress(self, chars: List[str]) -> int:
        left = right = 0
        while right < len(chars):
            count = 0
            s = chars[right]
            while right < len(chars) and chars[right] == s:
                count+=1
                right+=1
            chars[left] = s
            left += 1
            if count > 1:
                for i in str(count):
                    chars[left] = i
                    left+=1
        return left