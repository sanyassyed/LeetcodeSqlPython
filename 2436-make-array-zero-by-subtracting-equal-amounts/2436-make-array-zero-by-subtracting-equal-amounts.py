def find_min(nums):
    min_n = 0
    for n in nums:
        if n != 0:
            if min_n == 0 or n < min_n:
                min_n = n
    return min_n


class Solution:
    def minimumOperations(self, nums):
        counter = 0
        while True:
            min_n = find_min(nums)
            if min_n == 0:
                return counter
            
            # In-place update — no new list created
            for i in range(len(nums)):
                if nums[i] != 0:
                    nums[i] -= min_n
            counter += 1
