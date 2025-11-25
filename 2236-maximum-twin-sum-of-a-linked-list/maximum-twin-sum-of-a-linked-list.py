# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        slow = fast = head
        res = 0
        while fast and fast.next:
            slow = slow.next
            fast = fast.next.next
        p_head = None
        while slow:
            nxt = slow.next
            slow.next = p_head
            p_head = slow
            slow = nxt
        while p_head:
            res = max(res, p_head.val + head.val)
            p_head = p_head.next
            head = head.next
        return res