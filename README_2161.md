
# LeetCode 2161: Partition Array According to Given Pivot

This repository contains the solution for [LeetCode Problem 2161 - Partition Array According to Given Pivot](https://leetcode.com/problems/partition-array-according-to-given-pivot/).

## Problem Statement

You are given a 0-indexed integer array `nums` and an integer `pivot`. Rearrange `nums` such that the following conditions are satisfied:

- Every element less than `pivot` appears before every element greater than `pivot`.
- Every element equal to `pivot` appears in between the elements less than and greater than `pivot`.
- The relative order of the elements less than `pivot` and the elements greater than `pivot` is maintained.

### Example 1

```
Input: nums = [9,12,5,10,14,3,10], pivot = 10
Output: [9,5,3,10,10,12,14]
```

### Example 2

```
Input: nums = [-3,4,3,2], pivot = 2
Output: [-3,2,4,3]
```

---

## Constraints

- `1 <= nums.length <= 10^5`
- `-10^6 <= nums[i] <= 10^6`
- `pivot` equals an element of `nums`.

---

## Approach

- Use **three linked lists** to store elements:
    - Numbers smaller than pivot.
    - Numbers equal to pivot.
    - Numbers greater than pivot.
- Combine all three lists to get the final order.
- Maintain relative order for numbers smaller than and greater than pivot.

---

## Code

```java
import java.util.*;

class Solution {

    public int[] pivotArray(int[] nums, int pivot) {
        LinkedList<Integer> less = new LinkedList<>();
        LinkedList<Integer> equal = new LinkedList<>();
        LinkedList<Integer> greater = new LinkedList<>();
        for (int num : nums) {
            if (num < pivot) {
                less.add(num);
            } else if (num > pivot) {
                greater.add(num);
            } else {
                equal.add(num);
            }
        }
        less.addAll(equal);
        less.addAll(greater);

        int i = 0;
        int[] ans = new int[nums.length];
        for (int num : less) {
            ans[i++] = num;
        }
        return ans;
    }
}
```

---

## Time Complexity

- `O(n)` to process all elements into three lists.
- `O(n)` to combine the lists into the final array.

**Overall Time Complexity: O(n)**

---

## Space Complexity

- `O(n)` for the three lists.

**Overall Space Complexity: O(n)**

---

## Links

- [LeetCode Problem Link](https://leetcode.com/problems/partition-array-according-to-given-pivot/)

---

## Author

- Your Name (or GitHub username)

