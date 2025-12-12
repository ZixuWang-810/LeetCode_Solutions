class Solution:
    def maxScore(self, nums1: List[int], nums2: List[int], k: int) -> int:
        # Step 1: Sort by nums2 descending (pair with nums1)
        pairs = sorted(zip(nums1, nums2), key=lambda x: -x[1])
        
        heap = []     # Min-heap to track k largest nums1 values
        total = 0     # Sum of current k nums1 values
        result = 0    # Maximum score found
        
        # Step 2: Iterate through pairs
        for num1, num2 in pairs:
            # Add current num1 to heap
            heapq.heappush(heap, num1)
            total += num1
            
            # Step 3: Maintain exactly k elements
            if len(heap) > k:
                total -= heapq.heappop(heap)  # Remove smallest
            
            # Step 4: Calculate score when we have k elements
            if len(heap) == k:
                # num2 is guaranteed to be the minimum
                result = max(result, total * num2)
        
        return result