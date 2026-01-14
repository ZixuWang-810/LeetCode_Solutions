# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSameTree(self, p: Optional[TreeNode], q: Optional[TreeNode]) -> bool:
        def helper(r1, r2):
            if not r1 and not r2: return True
            elif not r1 or not r2: return False
            else:
                if r1.val != r2.val: return False
                else:
                    return helper(r1.left, r2.left) and helper(r1.right, r2.right)

        return helper(p, q)