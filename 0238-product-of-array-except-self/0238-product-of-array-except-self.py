class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        len_nums = len(nums)
        result = [1] * (len_nums + 1)

        for i in range(len_nums):
            result[i+1] = result[i] * nums[i]
        print(result)
        right = 1

        for i in range(len_nums-1, -1, -1):
            result[i] *=right
            right *= nums[i]


        print(result)
        return result[:len_nums]
