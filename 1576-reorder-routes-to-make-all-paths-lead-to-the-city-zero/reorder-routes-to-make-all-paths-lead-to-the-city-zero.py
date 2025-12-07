class Solution:
    def minReorder(self, n: int, connections: List[List[int]]) -> int:
        # Build undirected graph
        adj = defaultdict(list)
        
        # Track original directed edges
        seen = set()
        
        for x, y in connections:
            adj[x].append(y)  # Can go both ways
            adj[y].append(x)
            seen.add((x, y))  # But remember original direction x→y
        
        vis = [False] * n
        q = deque()
        q.append(0)
        vis[0] = True
        ans = 0
        
        while q:
            node = q.popleft()
            for nei in adj[node]:
                if not vis[nei]:
                    vis[nei] = True
                    
                    # If edge was node→nei (going away from 0), reverse it!
                    if (node, nei) in seen:
                        ans += 1
                    
                    q.append(nei)
        
        return ans