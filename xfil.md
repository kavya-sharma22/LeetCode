## Leetcode Problem 2579: Count Total Number of Colored Cells

## Problem Description

There exists an infinitely large two-dimensional grid of uncolored unit cells. You are given a positive integer `n`, indicating that you must do the following routine for `n` minutes:

- At the first minute, color any arbitrary unit cell blue.
- Every minute thereafter, color blue every uncolored cell that touches a blue cell.

The task is to **return the number of colored cells at the end of `n` minutes**.

---

## Example 1

```
Input: n = 1
Output: 1
Explanation: After 1 minute, there is only 1 blue cell, so we return 1.
```

## Example 2

```
Input: n = 2
Output: 5
Explanation: After 2 minutes, there are 4 colored cells on the boundary and 1 in the center, so we return 5.
```

---

## Constraints
- \(1 \leq n \leq 10^5\)

---

## Approach

### Observations
This is a **pattern problem**. The grid expands in a **diamond shape** where each minute adds a new layer of cells around the existing colored cells.

- After minute 1, there is **1 cell**.
- After minute 2, there are **5 cells** (1 center + 4 around it).
- After minute 3, there are **13 cells** (5 from minute 2 + 8 new cells).

This forms a clear arithmetic progression:
- Minute 1: 1 cell
- Minute 2: 5 cells
- Minute 3: 13 cells
- Minute 4: 25 cells
- Each minute, the number of new cells increases by 4 (the boundary grows outward).

---

## Mathematical Formula

The total number of cells at minute `n` can be calculated iteratively. 
- Start with 1 cell.
- Each minute after the first, add `4, 8, 12, 16, ...` new cells.

This can be computed using a **simple loop**.

---

## Code

```java
class Solution {

    public long coloredCells(int n) {
        long numBlueCells = 1;
        int addend = 4;

        // Iterate n - 1 times to add new cells for each minute after the first
        while (--n > 0) {
            numBlueCells += addend;
            addend += 4;
        }
        return numBlueCells;
    }
}
```

---

## Time Complexity
- **O(n)** — We iterate for each minute after the first.
- This is efficient for \(n \leq 100,000\).

## Space Complexity
- **O(1)** — We only use a few variables.

---

## Conclusion
This problem is a **mathematical pattern recognition problem**. Understanding the **growth pattern** (adding a layer of cells each minute) allows us to compute the number of cells in **linear time**.

---

## Summary
| Approach | Time Complexity | Space Complexity |
|---|---|---|
| Iterative Pattern Calculation | O(n) | O(1) |

