# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def rotateRight(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:
        lgth = 0
        dummy = dummy2 = head
        while dummy:
            lgth+=1
            dummy = dummy.next
        if not lgth: return head
        move = k % lgth
        if move == 0: return head
        for _ in range(lgth - move-1):
            head = head.next
        new_head = head.next
        tmp = new_head
        head.next = None
        while tmp.next:
            tmp = tmp.next
        tmp.next = dummy2
        return new_head