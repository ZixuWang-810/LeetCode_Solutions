class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        row, column = defaultdict(int), defaultdict(int)
        for i in grid:
            row[tuple(i)] += 1
        for i in range(len(grid)):
            temp = []
            for j in range(len(grid)):
                temp.append(grid[j][i])
            column[tuple(temp)] +=1
        res = 0
        for r in row:
            if r in column:
                res+= row[r] * column[r]
        return res