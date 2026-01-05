class Solution:
    def findKthLargest(self, nums: List[int], k: int) -> int:
        res = []
        for i in nums:
            heapq.heappush(res, -i)
        for _ in range(k-1):
            heapq.heappop(res)
        return -heapq.heappop(res)