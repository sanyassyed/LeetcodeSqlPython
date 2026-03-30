class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        seen_r = defaultdict(set)
        seen_c = defaultdict(set)
        seen_sq = defaultdict(set)
        for r in range(0,9):
            for c in range(0,9):
                item = board[r][c]
                if item == '.':
                    continue
                if (item in seen_r[r] or
                   item in seen_c[c] or
                   item in seen_sq[(r//3,c//3)]):
                    return False
                seen_r[r].add(item)
                seen_c[c].add(item)
                seen_sq[(r//3, c//3)].add(item)
            
        return True