class Solution:
    def asteroidCollision(self, asteroids: List[int]) -> List[int]:
        res = []
        for i in asteroids:
            if i > 0:
                res.append(i)
            else:
                # res[-1] 
                while res and res[-1] > 0 and res[-1] + i < 0: # > <<
                    res.pop()
                
                # > < 
                if res and res[-1] > 0 and res[-1] + i == 0:
                    res.pop()
                # < <
                # <
                # >> <
                elif res and res[-1] + i > 0: continue
                else:
                    res.append(i)
        return res