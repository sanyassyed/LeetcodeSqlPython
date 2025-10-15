class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        seen = defaultdict(list)
        for i, n in enumerate(nums):
            if n in seen:
                for v in seen[n]:
                    if abs(v-i) <= k:
                        return True
            seen[n].append(i)

        return False
    
