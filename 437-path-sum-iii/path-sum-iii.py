# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pathSum(self, root: Optional[TreeNode], targetSum: int) -> int:
        
        def helper(root, sum):
            if not root:
                return 0
            count = 1 if root.val == sum else 0
            
            count += helper(root.left, sum-root.val)
            count += helper(root.right, sum-root.val)
            return count
        
        if not root:
            return 0
        return helper(root, targetSum)+ self.pathSum(root.left, targetSum) + self.pathSum(root.right, targetSum)