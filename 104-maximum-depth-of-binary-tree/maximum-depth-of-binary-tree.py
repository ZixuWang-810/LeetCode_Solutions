# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: Optional[TreeNode]) -> int:
        def helper(rt):
            if not rt: return 0
            else:
                count_l = helper(rt.left)
                count_r = helper(rt.right)
            return max(count_l, count_r) + 1
        return helper(root)
