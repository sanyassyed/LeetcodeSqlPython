class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        counter = 0
        while True:
            no_zero = [x for x in nums if x != 0]
            if no_zero:
                min_num = min(no_zero)
                counter += 1
                for i, n in enumerate(nums):
                    if n != 0:
                        nums[i] = n - min_num

            else:
                return counter

            
