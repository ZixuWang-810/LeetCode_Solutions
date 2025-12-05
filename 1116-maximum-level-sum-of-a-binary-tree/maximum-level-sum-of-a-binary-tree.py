# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxLevelSum(self, root: Optional[TreeNode]) -> int:
        lev = res = 1
        max_s = root.val
        q = deque([root])
        while q:
            temp = 0
            for _ in range(len(q)):
                node = q.popleft()
                temp+=node.val
                if node.left:q.append(node.left)
                if node.right:q.append(node.right)
            if temp > max_s:
                max_s = temp
                res = lev
            lev+=1
        return res     