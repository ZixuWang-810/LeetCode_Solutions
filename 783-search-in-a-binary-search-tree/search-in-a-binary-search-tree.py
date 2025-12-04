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
            if rt.val > tar:
                return helper(rt.left, tar)
            else:
                return helper(rt.right, tar)
        return helper(root, val)