class Solution:
    def totalFruit(self, fruits: List[int]) -> int:
        last = sec_last = -1
        last_count = curr = res = 0
        for f in fruits:
            if f == last or f == sec_last:
                curr += 1
            else: curr = last_count + 1

            if f == last:
                last_count +=1
            else:
                last_count = 1
                sec_last, last = last, f
            res = max(res, curr)
        return res