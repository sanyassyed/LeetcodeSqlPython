class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        l_len = len(nums)
        result = [1] * (l_len)
        prefix, postfix = 1, 1

        for i in range(l_len):
            result[i] = prefix
            prefix *= nums[i]

        for i in range(l_len-1, -1, -1):
            result[i] *= postfix 
            postfix = postfix * nums[i]


        return result