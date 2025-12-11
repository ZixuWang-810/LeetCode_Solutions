class SmallestInfiniteSet:

    def __init__(self):
        self.heap = [x for x in range(1, 1001)]
        heapq.heapify(self.heap)

    def popSmallest(self) -> int:
        if self.heap: 
            return heapq.heappop(self.heap)
        else: return None

    def addBack(self, num: int) -> None:
        if num not in self.heap:
            heapq.heappush(self.heap, num)


# Your SmallestInfiniteSet object will be instantiated and called as such:
# obj = SmallestInfiniteSet()
# param_1 = obj.popSmallest()
# obj.addBack(num)