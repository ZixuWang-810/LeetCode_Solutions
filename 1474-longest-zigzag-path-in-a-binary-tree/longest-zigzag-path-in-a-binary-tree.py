# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def longestZigZag(self, root: Optional[TreeNode]) -> int:
        self.res = 0
        def helper(rt, left, leng):
            if not rt: 
                self.res = max(self.res, leng) 
                return
            if left:
                helper(rt.right, False, leng+1)
                helper(rt.left, True, 0)
            else:
                helper(rt.left, True, leng+1)
                helper(rt.right, False, 0)
            return
        helper(root.left, True, 0)
        helper(root.right, False, 0)
        return self.res
