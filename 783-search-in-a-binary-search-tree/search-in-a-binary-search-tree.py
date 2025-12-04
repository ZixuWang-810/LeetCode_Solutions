# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def searchBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:
        def helper(rt, tar):
            if not rt or rt.val == tar:
                return rt
            left = helper(rt.left, tar)
            right = helper(rt.right, tar)
            if left or right:
                return left or right
            else: return None
        return helper(root, val)