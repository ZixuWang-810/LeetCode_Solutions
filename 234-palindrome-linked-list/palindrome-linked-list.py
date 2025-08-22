# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: Optional[ListNode]) -> bool:
        tmp = []
        cur = head
        while cur:
            tmp.append(cur.val)
            cur = cur.next
        for i in range(len(tmp)-1, len(tmp)//2-1, -1):
            if tmp[i] != head.val: return False
            else: head = head.next
        return True