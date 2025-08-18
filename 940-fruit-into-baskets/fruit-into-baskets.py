class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        left = 0
        fruit_count = {}  # Track fruit types in current window
        max_fruits = 0
        
        for right in range(len(fruits)):
            # Add current fruit to window
            fruit_count[fruits[right]] = fruit_count.get(fruits[right], 0) + 1
            
            # If we have more than 2 fruit types, shrink window
            while len(fruit_count) > 2:
                fruit_count[fruits[left]] -= 1
                if fruit_count[fruits[left]] == 0:
                    del fruit_count[fruits[left]]
                left += 1
            
            # Update maximum
            max_fruits = max(max_fruits, right - left + 1)
        
        return max_fruits