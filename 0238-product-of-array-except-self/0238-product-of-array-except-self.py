class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        
        prefix = 1
        result = []

        for n in nums:
            result.append(prefix)
            prefix = prefix * n

        # print(result)
        
        post = 1
        for i in range(len(result)-1, -1, -1):
            result[i] *= post
            post *= nums[i]
            

        return result
