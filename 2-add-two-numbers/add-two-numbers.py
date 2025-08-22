# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def addTwoNumbers(self, l1: Optional[ListNode], l2: Optional[ListNode]) -> Optional[ListNode]:
        carry = num = 0
        dummy = ListNode()
        res = dummy
        while l1 or l2 or carry:
            num = carry 
            if l1:
                num+= l1.val
                l1 = l1.next
            if l2:
                num+= l2.val
                l2 = l2.next
            carry = num//10
            val = num%10
            dummy.next = ListNode(val)
            dummy = dummy.next
        return res.next