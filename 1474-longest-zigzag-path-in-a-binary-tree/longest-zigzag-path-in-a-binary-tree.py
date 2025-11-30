# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def longestZigZag(self, root: Optional[TreeNode]) -> int:
        self.res = 0
        def helper(rt, l_flag, length):

            if not rt:
                self.res = max(self.res, length)
                return 
            elif l_flag:
                helper(rt.right, False, length+1)
                helper(rt.left, True, 0)
            else:
                helper(rt.left, True, length+1)
                helper(rt.right, False, 0)
            return 
        helper(root.left, True, 0)
        helper(root.right, False, 0)
        return self.res