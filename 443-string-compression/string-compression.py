class Solution:
    def compress(self, chars: List[str]) -> int:
        left = right = 0
        n = len(chars)
        while right < n:
            s = chars[right]
            count = 0
            while right < n and chars[right] == s:
                count+=1
                right+=1
            chars[left] = s
            left +=1
            if count > 1:
                for i in str(count):
                    chars[left] = i
                    left +=1
        return left