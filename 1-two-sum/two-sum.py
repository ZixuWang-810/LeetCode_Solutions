class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        dic = defaultdict(int)
        for i in range(len(nums)):
            dic[nums[i]] = i
        for i in range(len(nums)):
            comp = target - nums[i]
            if comp in dic and dic[comp] != i:
                return [i, dic[comp]]
        return []