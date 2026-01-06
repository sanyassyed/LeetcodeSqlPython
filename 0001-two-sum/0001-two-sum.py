class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = defaultdict(list)

        for i in range(len(nums)):
            diff = target - nums[i]
            if diff in seen:
                return [i, seen[diff][0]]
            seen[nums[i]].append(i)

        return [0, 0]