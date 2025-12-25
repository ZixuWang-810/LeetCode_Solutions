class Solution:
    def maxArea(self, height: List[int]) -> int:
        res = 0
        slow, fast = 0, len(height)-1
        while slow < fast:
            res = max(res, (fast - slow) * min(height[fast], height[slow]))
            if height[fast] < height[slow]:fast -= 1
            else: slow +=1
        return res