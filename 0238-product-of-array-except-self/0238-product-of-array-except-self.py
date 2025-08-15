class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        
        l = len(nums)
        res = [1] * l
        prefix, postfix = 1, 1

        for i in range(l):
            res[i] = prefix
            prefix *= nums[i]

        for i in range(l-1, -1, -1):
            res[i] *= postfix
            postfix *= nums[i]

        return res

        return result
