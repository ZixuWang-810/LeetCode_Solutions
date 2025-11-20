class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        n = len(grid)
        
        # Count frequency of each row (as tuple)
        row_count = Counter(tuple(row) for row in grid)
        
        # Count matching columns
        res = 0
        for col_idx in range(n):
            col = tuple(grid[row_idx][col_idx] for row_idx in range(n))
            res += row_count[col]  # Add count of matching rows
        
        return res