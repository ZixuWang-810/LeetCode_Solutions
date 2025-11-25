# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        stack = []
        prev = ListNode(0)
        prev.next = head
        dummy = head
        while dummy:
            stack.append(dummy.val)
            dummy = dummy.next
        while head:
            head.val = stack.pop()
            head = head.next
        return prev.next