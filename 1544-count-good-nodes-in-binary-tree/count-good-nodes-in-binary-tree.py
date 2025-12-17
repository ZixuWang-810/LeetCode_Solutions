# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        self.res = 0
        max_v = root.val
        def helper(rt, max_v):
            if not rt: return
            if rt.val >= max_v:
                self.res+=1
                max_v = rt.val
            helper(rt.left, max_v)
            helper(rt.right, max_v)
        helper(root, max_v)
        return self.res