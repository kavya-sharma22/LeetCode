# Problem: Minimum Equal Sum of Two Arrays After Replacing Zeros

## Problem Statement

You are given two arrays `nums1` and `nums2` consisting of positive integers. You have to replace all the 0's in both arrays with strictly positive integers such that the sum of elements of both arrays becomes equal. Return the minimum equal sum you can obtain, or -1 if it is impossible.

### Constraints:

* 1 <= nums1.length, nums2.length <= 10^5
* 0 <= nums1\[i], nums2\[i] <= 10^6

### Example 1:

**Input:** nums1 = \[3,2,0,1,0], nums2 = \[6,5,0]
**Output:** 12
**Explanation:**

* Replace the two 0's in nums1 with the values 2 and 4 to make nums1 = \[3,2,2,1,4].
* Replace the 0 in nums2 with the value 1 to make nums2 = \[6,5,1].
* Both arrays now sum to 12, which is the minimum possible equal sum.

### Example 2:

**Input:** nums1 = \[2,0,2,0], nums2 = \[1,4]
**Output:** -1
**Explanation:**

* It's impossible to make the sum of both arrays equal by only replacing 0's with positive integers.

---

## Approach

We want to replace zeros in both arrays with strictly positive integers to make their sums equal. The idea is to:

1. Calculate the total sum of each array.
2. Count how many zeros exist in each array.
3. For each zero encountered during the initial sum calculation, assume the **minimum** value of `1` is placed in its position (this represents the smallest possible increment to reach equality).
4. After replacing all 0s with 1s temporarily, if one array still has a smaller sum and no more zeros to adjust, it's impossible to match the sums — return `-1`.
5. Otherwise, return the maximum of the two calculated minimal sums as the minimum achievable equal sum.

---

## Java Solution

```java
class Solution {
    public long minSum(int[] nums1, int[] nums2) {
        long sum1 = 0, sum2 = 0;
        long zero1 = 0, zero2 = 0;

        for (int i : nums1) {
            sum1 += i;
            if (i == 0) {
                sum1++;
                zero1++;
            }
        }

        for (int i : nums2) {
            sum2 += i;
            if (i == 0) {
                sum2++;
                zero2++;
            }
        }

        if ((zero1 == 0 && sum2 > sum1) || (zero2 == 0 && sum1 > sum2)) {
            return -1;
        }

        return Math.max(sum1, sum2);
    }
}
```

---

## Time and Space Complexity

* **Time Complexity:** O(n + m), where `n` is the length of `nums1` and `m` is the length of `nums2`.
* **Space Complexity:** O(1), only constant extra space is used.

---

## Conclusion

This solution efficiently determines whether it is possible to equalize the sum of two arrays by replacing zeros with the smallest possible positive integers. If it is feasible, it calculates the minimal such sum. Otherwise, it correctly returns `-1`.
