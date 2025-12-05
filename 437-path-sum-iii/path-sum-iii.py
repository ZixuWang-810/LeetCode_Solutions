# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> int:
        def helper(rt, tar):
            if not rt:
                return 0
            if rt.val == tar: count = 1
            else: count = 0
            count += helper(rt.left, tar - rt.val)
            count += helper(rt.right, tar - rt.val)
            return count

        if not root:return 0
        return helper(root, targetSum) + self.pathSum(root.left, targetSum) + self.pathSum(root.right, targetSum)