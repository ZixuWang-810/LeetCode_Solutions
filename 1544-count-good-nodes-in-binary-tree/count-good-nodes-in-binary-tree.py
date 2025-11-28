# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        self.res = 0
        def helper(rt, max_v):
            if not rt:
                return 0
            else:
                if rt.val >= max_v:
                    max_v = rt.val
                    self.res+=1
                helper(rt.left, max_v)
                helper(rt.right, max_v)
        helper(root, root.val)
        return self.res