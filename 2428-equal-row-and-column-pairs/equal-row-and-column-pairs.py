class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:

        row_count = Counter(map(tuple, grid))
        col_count = Counter(zip(*grid))

        return sum(row_count[pattern] * col_count[pattern] 
                   for pattern in row_count)