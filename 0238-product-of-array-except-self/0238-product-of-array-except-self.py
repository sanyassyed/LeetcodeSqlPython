class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        pre, post = 1, 1
        lNums = len(nums)
        result = []
        for n in nums:
            result.append(pre)
            pre *= n
        #print(result)

        for i in range(lNums-1, -1, -1):
            result[i] *= post
            post *= nums[i]
        #print(result)
        return result