class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        res = [[1] * n for _ in range(m)]

        for col in range(1, m):
            for row in range(1, n):
                res[col][row] = res[col - 1][row] + res[col][row - 1]

        return res[m - 1][n - 1]