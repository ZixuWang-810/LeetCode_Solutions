class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n=len(nums)
        ans,pre,post=[1]*n,1,1
        for i in range(n):
            ans[i]*=pre
            pre*=nums[i]

            ans[n-i-1]*=post
            post*=nums[n-i-1]
        return ans