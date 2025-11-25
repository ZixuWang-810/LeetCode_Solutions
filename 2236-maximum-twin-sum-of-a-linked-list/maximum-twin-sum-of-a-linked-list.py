# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        slow = fast = head
        prev = None
        while fast :
            fast = fast.next.next
            slow.next, prev, slow = prev, slow, slow.next

        # Iterate over twin nodes
        max_sum = 0
        backward, forward = prev, slow

        while forward:
            max_sum = max(max_sum, backward.val + forward.val)
            forward = forward.next
            backward = backward.next
        return max_sum