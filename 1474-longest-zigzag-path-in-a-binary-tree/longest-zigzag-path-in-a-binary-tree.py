# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def longestZigZag(self, root: Optional[TreeNode]) -> int:
        self.res = 0
        def helper(root, left_f, count):
            if not root: return
            count += 1
            self.res = max(self.res, count)
            if left_f:
                helper(root.left, True, 0)
                helper(root.right, False, count)
            else:
                helper(root.left, True, count)
                helper(root.right, False, 0)
        helper(root.left, True, 0)
        helper(root.right, False, 0)
        return self.res