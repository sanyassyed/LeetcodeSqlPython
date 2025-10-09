class Solution(object):
    def containsNearbyDuplicate(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: bool
        """
        record = {}

        for i, n in enumerate(nums):
            if n in record:
                if abs(i-record[n]) <= k:
                    return True
            record[n] = i

        return False
