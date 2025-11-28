class Solution:
    def equalPairs(self, grid: List[List[int]]) -> int:
        r_dic = {}
        res = 0
        for r in grid:
            if str(r) not in r_dic: r_dic[str(r)] = 1
            else: r_dic[str(r)] += 1
        for i in range(len(grid)):
            col = []
            for j in range(len(grid)):
                col.append(grid[j][i])
            res += r_dic.get(str(col), 0)
        return res