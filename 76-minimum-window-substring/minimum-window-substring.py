class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not s or not t or len(s) < len(t):
            return ""
    
        # Count characters needed from t
        need = {}
        for char in t:
            need[char] = need.get(char, 0) + 1
        
        # Sliding window variables
        left = 0
        min_len = float('inf')
        min_start = 0
        required = len(need)  # Number of unique characters in t
        formed = 0  # Number of unique characters in current window with desired frequency
        
        # Dictionary to keep count of characters in current window
        window_counts = {}
        
        for right in range(len(s)):
            # Add character from the right to the window
            char = s[right]
            window_counts[char] = window_counts.get(char, 0) + 1
            
            # If frequency of current character matches the desired count in t
            if char in need and window_counts[char] == need[char]:
                formed += 1
            
            # Try to contract the window from left
            while left <= right and formed == required:
                # Update minimum window if this one is smaller
                if right - left + 1 < min_len:
                    min_len = right - left + 1
                    min_start = left
                
                # Remove character from left of window
                left_char = s[left]
                window_counts[left_char] -= 1
                if left_char in need and window_counts[left_char] < need[left_char]:
                    formed -= 1
                
                left += 1
        
        # Return empty string if no valid window found
        return "" if min_len == float('inf') else s[min_start:min_start + min_len]