class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        x, y, dx, dy = 0, 0, 1, 0
        m, n = len(matrix), len(matrix[0])
        res = []
        for i in range(m*n):
            res.append(matrix[y][x])
            matrix[y][x] = "."
            if not 0 <= x+dx < n or not 0 <= y+dy < m or matrix[y+dy][x+dx] == '.':
                dx, dy = -dy, dx
            x+=dx
            y+=dy
        return res