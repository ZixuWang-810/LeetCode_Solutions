class Solution:
    def totalCost(self, costs: List[int], k: int, candidates: int) -> int:
        head_workers = costs[:candidates]
        tail_workers = costs[max(candidates, len(costs) - candidates):]
        heapify(head_workers)
        heapify(tail_workers)
        res = 0
        slow, fast = candidates, len(costs) - candidates - 1
        for _ in range(k):
            if not tail_workers or head_workers and head_workers[0] <= tail_workers[0]: 
                res += heappop(head_workers)
                if slow <= fast: 
                    heappush(head_workers, costs[slow])
                    slow += 1
            else: 
                res+=heappop(tail_workers)
                if slow <= fast:  
                    heappush(tail_workers, costs[fast])
                    fast -= 1
        return res