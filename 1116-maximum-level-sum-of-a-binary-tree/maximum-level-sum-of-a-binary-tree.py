# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        node = deque([root])
        max_v = float('-inf')
        res = level = 0
        while node:
            temp = 0
            level+=1
            for _ in range(len(node)):
                n = node.popleft()
                if n.left: node.append(n.left)
                if n.right: node.append(n.right)
                temp+=n.val
            if temp > max_v:
                max_v = temp
                res = level
        return res