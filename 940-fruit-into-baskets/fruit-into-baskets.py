class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        last = sec_last = -1
        curr, last_count, res = 0, 0, 0
        for i in fruits:
            if i == last or i == sec_last:
                curr+=1
            else:
                curr = last_count + 1

            if i == last:
                last_count +=1
            else:
                last_count = 1
                last, sec_last = i, last
            res = max(res, curr)
        return res