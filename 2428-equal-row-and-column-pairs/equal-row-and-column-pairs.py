class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        col = []
        res = 0
        for i in range(len(grid)):
            temp = []
            for j in range(len(grid)):
                temp.append(grid[j][i])
            col.append(temp)
        for i in col:
            for j in grid:
                if i == j: res+=1
        return res