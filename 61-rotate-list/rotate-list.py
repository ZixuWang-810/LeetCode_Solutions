# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        length = 0
        dummy = head
        while dummy:
            dummy = dummy.next
            length += 1
        if length == 0: return head
        position = k % length
        if position == 0: return head
        fast = slow = head
        for _ in range(position):
            fast = fast.next
        while fast.next:
            fast = fast.next
            slow = slow.next
        new_head = slow.next
        slow.next = None
        fast.next = head
        return new_head