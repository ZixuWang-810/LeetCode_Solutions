class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        # Use list instead of dict
        values = []
        
        # Store all values
        while head:
            values.append(head.val)
            head = head.next
        
        # Find max twin sum
        max_sum = 0
        n = len(values)
        
        for i in range(n // 2):
            twin_sum = values[i] + values[n - 1 - i]
            max_sum = max(max_sum, twin_sum)
        
        return max_sum