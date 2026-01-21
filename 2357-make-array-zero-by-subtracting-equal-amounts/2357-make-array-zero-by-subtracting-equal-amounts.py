def find_min(nums):
    least = 0
    if len(nums) != 0:
        least = nums[0]
        for n in range(1, len(nums)):
            least = min(nums[n], least)
    return least
class Solution:
    def minimumOperations(self, nums: List[int]) -> int: 
        counter = 0
        while True:
            small = find_min([x for x in nums if x != 0])
            if small == 0:
                return counter
            nums = [x-small if x != 0 else x for x in nums] 
            counter += 1

        return counter
        