# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeElements(self, head: Optional[ListNode], val: int) -> Optional[ListNode]:
        node = ListNode(0, head)
        dummy = node
        while dummy:
            while dummy.next and dummy.next.val == val:
                dummy.next = dummy.next.next
            dummy = dummy.next
        return node.next