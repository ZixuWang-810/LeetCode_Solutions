# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def leafSimilar(self, root1: Optional[TreeNode], root2: Optional[TreeNode]) -> bool:
        leaf1, leaf2 = [], []
        def helper(root, leaf):
            if not root:
                return
            if not root.left and not root.right: leaf.append(root.val)
            helper(root.left, leaf)
            helper(root.right, leaf)
            return
        helper(root1, leaf1)
        helper(root2, leaf2)
        return leaf1 == leaf2
