class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if len(s) < len(t): return ""
        need = {}
        for c in t:
            need[c] = need.get(c, 0) + 1
        left, min_start = 0, 0
        min_len = inf
        required = len(need)
        formed = 0
        window_dic = {}
        for r in range(len(s)):
            char = s[r]
            window_dic[char] = window_dic.get(char, 0) + 1
            if char in need and window_dic[char] == need[char]:
                formed += 1
            while left <= r and formed == required:
                if r - left + 1 < min_len:
                    min_len = r - left + 1
                    min_start = left

                left_char = s[left]
                window_dic[left_char] -= 1
                if left_char in need and window_dic[left_char] < need[left_char]:
                    formed -= 1
            
                left += 1
        return "" if min_len == float('inf') else s[min_start:min_start + min_len]