## LeetCode accepted Code goes here
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapPairs(self, head: Optional[ListNode]) -> Optional[ListNode]:
        dummy = ListNode(0, head)
        prev = dummy
        curr = head
        while curr and curr.next:
            tmp = curr.next.next
            sec = curr.next

            sec.next = curr
            curr.next = tmp
            prev.next = sec

            prev = curr
            curr = tmp

        return dummy.next