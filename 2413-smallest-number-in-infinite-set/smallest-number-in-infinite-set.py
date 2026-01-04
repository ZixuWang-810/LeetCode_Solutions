class SmallestInfiniteSet:

    def __init__(self):
        self.num_count = 1
        self.add_num = SortedSet()
    def popSmallest(self) -> int:
        if self.add_num:
            res = self.add_num[0]
            self.add_num.discard(res)
        else:
            res = self.num_count
            self.num_count+=1
        return res

    def addBack(self, num: int) -> None:
        if num < self.num_count:
            self.add_num.add(num)

# Your SmallestInfiniteSet object will be instantiated and called as such:
# obj = SmallestInfiniteSet()
# param_1 = obj.popSmallest()
# obj.addBack(num)