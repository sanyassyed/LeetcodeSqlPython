class Solution:
    def minimumOperations(self, nums: List[int]) -> int:
        counter = 0
        while True:
            no_zero = [x for x in nums if x != 0]
            if no_zero:
                small = min(no_zero)
                nums = [n-small if n !=0 else n for n in nums ]
                counter += 1
            else:
                return counter

        return counter