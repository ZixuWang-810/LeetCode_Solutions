# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSubtree(self, root: Optional[TreeNode], subRoot: Optional[TreeNode]) -> bool:
        def isequal(t1, t2):
            if not t1 and not t2:
                return True
            elif not t1 or not t2: return False
            elif t1.val != t2.val: return False
            else:
                return isequal(t1.left, t2.left) and isequal(t1.right, t2.right)
        def helper(root):
            if not root: return False
            if isequal(root, subRoot): return True
            return helper(root.left) or helper(root.right)

        return helper(root)
