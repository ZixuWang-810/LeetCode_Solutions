# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root: return []
        res = []
        node = deque([root])
        while node:
            temp = []
            for _ in range(len(node)):
                n = node.popleft()
                temp.append(n.val)
                if n.left: node.append(n.left)
                if n.right: node.append(n.right)
            res.append(temp)
        return res