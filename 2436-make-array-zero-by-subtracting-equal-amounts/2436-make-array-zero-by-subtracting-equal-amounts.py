def min_value(nums: List[int]):
    min_n = 0
    for n in nums:
        if n != 0 and min_n != 0 and n < min_n:
            min_n = n
        elif n != 0: # min_n == 0
            min_n = n  
    return min_n

class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        cntr = 0
        while True:
            min_num = min_value(nums)
            if min_num == 0:
                return cntr
            cntr += 1
            for i in range(len(nums)):
                n = nums[i]
                nums[i] = n - min_num if n != 0 else n

        