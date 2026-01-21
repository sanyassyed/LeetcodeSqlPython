class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        counter = 0
        while True:
            no_zero = [x for x in nums if x != 0]
            if no_zero:
                least = min(no_zero)
                nums = [x-least if x != 0 else x for x in nums]
                counter += 1
            else:
                return counter
        
        return counter