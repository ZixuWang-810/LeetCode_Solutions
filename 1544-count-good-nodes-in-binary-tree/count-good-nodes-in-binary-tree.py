# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        self.res = 0
        def helper(rt, max):
            if not rt: return
            if rt.val >= max: 
                self.res+=1
                max = rt.val
            helper(rt.left, max)
            helper(rt.right, max)
        helper(root, root.val)
        return self.res