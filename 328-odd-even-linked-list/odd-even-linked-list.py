# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def oddEvenList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        even = []
        odd = []
        flag = True
        p = head
        while p:
            if flag:
                odd.append(p.val)
                p = p.next
            else:
                even.append(p.val)
                p = p.next
            flag = not flag
        odd.extend(even)
        if not len(odd):
            return head
        head.val=  odd[0]
        res = head
        for i in range(1, len(odd)):
            head.next = ListNode(odd[i])
            head = head.next
        return res