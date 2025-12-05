class Solution:
    def canVisitAllRooms(self, rooms: List[List[int]]) -> bool:
        visited = set()
        visited.add(0)
        k = deque([x for x in rooms[0]])
        while k:
            room = k.popleft()
            if room not in visited: visited.add(room)
            for key in rooms[room]:
                if key not in visited:
                    visited.add(key)
                    k.append(key)
        return len(visited) == len(rooms)
