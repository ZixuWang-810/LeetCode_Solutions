# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:
        if not root:
            return None      
        # Step 1: Find the node to delete
        if key < root.val:
            # Key is in left subtree
            root.left = self.deleteNode(root.left, key)
        elif key > root.val:
            # Key is in right subtree
            root.right = self.deleteNode(root.right, key)
        else:
            # Found the node to delete!
            
            # Case 1: Leaf node or only right child
            if not root.left:
                return root.right
            
            # Case 2: Only left child
            if not root.right:
                return root.left
            
            # Case 3: Two children
            # Find inorder successor (smallest in right subtree)
            successor = self.findMin(root.right)
            # Replace current value with successor
            root.val = successor.val
            # Delete the successor
            root.right = self.deleteNode(root.right, successor.val)
        
        return root
    
    def findMin(self, node):
        """Find minimum value node (leftmost)"""
        while node.left:
            node = node.left
        return node