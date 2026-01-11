class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        r, c = set(), set()
        m = len(matrix)
        n = len(matrix[0])
        for row in range(m):
            for col in range(n):
                if matrix[row][col] == 0:
                    r.add(row)
                    c.add(col)
        zr = [0] * n
        for i in r: matrix[i] = zr
        for cc in c:
            for j in range(m):
                matrix[j][cc] = 0
