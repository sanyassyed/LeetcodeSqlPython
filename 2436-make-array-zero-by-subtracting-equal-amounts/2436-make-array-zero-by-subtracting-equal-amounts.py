def find_min(nums):
    min_n = 0
    for n in nums:
        if min_n == 0 and n != 0:
            min_n = n
        elif n != 0:
            min_n = min(min_n, n)
    return min_n
        

class Solution:
    def minimumOperations(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        counter = 0
        while True:
            min_n = find_min(nums)
            print(min_n)
            if min_n == 0:
                return counter
            nums = [x-min_n if x !=0 else x for x in nums]
            counter += 1

        return counter