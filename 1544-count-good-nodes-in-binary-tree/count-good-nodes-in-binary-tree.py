# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def goodNodes(self, root: TreeNode) -> int:
        def count_helper(rt, max_v):
            if not rt:
                return 
            else:
                if rt.val >= max_v:
                    max_v = rt.val
                    self.res+=1
            count_helper(rt.left, max_v)
            count_helper(rt.right, max_v)
        self.res = 0
        max_v = root.val
        count_helper(root, max_v)
        return self.res