# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        if not head: return head
        length = 1
        count = dummy = head
        while count.next:
           length += 1
           count = count.next
        move = k % length
        if move == 0: return head
        for _ in range(length - move - 1):
            dummy = dummy.next
        new_head = dummy.next
        dummy.next = None
        count.next = head
        return new_head
