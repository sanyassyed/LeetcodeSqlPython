class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        counter = 0
        while True:
            no_zero = [x for x in nums if x != 0]
            if len(no_zero) != 0:
                small = min(no_zero)
                nums = [x-small if x !=0 else x for x in nums]
                counter += 1
            else:
                return counter