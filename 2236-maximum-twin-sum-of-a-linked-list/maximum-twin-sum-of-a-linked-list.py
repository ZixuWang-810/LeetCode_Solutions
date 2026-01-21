# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def pairSum(self, head: Optional[ListNode]) -> int:
        dic = {}
        inx = 0
        while head:
            dic[inx] = head.val
            inx += 1
            head = head.next
        res = float('-inf')
        n = len(dic)
        for i in range(n//2):
            res = max(res, (dic[i] + dic[n-i-1]))
        return res