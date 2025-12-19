class Solution:
    def maxScore(self, nums1: List[int], nums2: List[int], k: int) -> int:
        pairs = sorted(zip(nums1, nums2), key = lambda x: -x[1])
        heap = []
        total = res = 0
        for num1, num2 in pairs:
            heapq.heappush(heap, num1)
            total+=num1
            if len(heap) > k:
                total -= heapq.heappop(heap)
            
            if len(heap) == k:
                res = max(res, total*num2)
        return res