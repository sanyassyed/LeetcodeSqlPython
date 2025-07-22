class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        values = set()
        for n in nums:
            if n in values:
                return True
            values.add(n)

        return False        