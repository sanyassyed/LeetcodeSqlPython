class Solution:
    def minimumOperations(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        counter = 0
        while True:
            non_zero_nums = [x for x in nums if x != 0]
            if non_zero_nums == []:
                return counter
            min_n = min(non_zero_nums)
            nums = [x-min_n if x !=0 else x for x in nums]
            counter += 1

        return counter