class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        vals = set()
        for n in nums:
            if n in vals:
                return True
            else:
                vals.add(n)

        return False