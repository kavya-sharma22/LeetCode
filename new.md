# Minimum Time to Repair Cars (LeetCode 2594)

## Problem Statement
You are given an integer array `ranks` representing the ranks of some mechanics. The `i`-th mechanic has a rank of `ranks[i]`. A mechanic with rank `r` can repair `n` cars in `r * n^2` minutes.

You are also given an integer `cars`, representing the total number of cars waiting to be repaired.

Return the **minimum time** required to repair all the cars.

**Constraints:**
- `1 <= ranks.length <= 10^5`
- `1 <= ranks[i] <= 100`
- `1 <= cars <= 10^6`

## Example
### Example 1:
**Input:**  
```plaintext
ranks = [4,2,3,1], cars = 10
```
**Output:**  
```plaintext
16
```
**Explanation:**  
- Mechanic 1 (rank 4) repairs 2 cars in `4 * 2^2 = 16` minutes.
- Mechanic 2 (rank 2) repairs 2 cars in `2 * 2^2 = 8` minutes.
- Mechanic 3 (rank 3) repairs 2 cars in `3 * 2^2 = 12` minutes.
- Mechanic 4 (rank 1) repairs 4 cars in `1 * 4^2 = 16` minutes.
- The total minimum time required is `16` minutes.

### Example 2:
**Input:**  
```plaintext
ranks = [5,1,8], cars = 6
```
**Output:**  
```plaintext
16
```
**Explanation:**  
- Mechanic 1 (rank 5) repairs 1 car in `5 * 1^2 = 5` minutes.
- Mechanic 2 (rank 1) repairs 4 cars in `1 * 4^2 = 16` minutes.
- Mechanic 3 (rank 8) repairs 1 car in `8 * 1^2 = 8` minutes.
- The total minimum time required is `16` minutes.

---

## Solution Approach
The solution uses **Binary Search** to optimize the time calculation.
1. **Binary Search on Time:** We search for the minimum possible time required.
2. **Check Feasibility:** For each mid-value of time, we calculate the number of cars that can be repaired.
3. **Update Search Space:** If the total cars repaired is sufficient, we reduce the time; otherwise, we increase it.

### Complexity Analysis
- **Sorting or pre-processing:** `O(N)`, where `N` is the length of `ranks`.
- **Binary search time complexity:** `O(log(T) * N)`, where `T` is the max possible repair time.
- **Overall complexity:** `O(N log T)`, which is efficient for large inputs.

## Code Implementation
```java
class Solution {
    public long repairCars(int[] ranks, int cars) {
        int minRank = ranks[0], maxRank = ranks[0];

        // Find min and max rank dynamically
        for (int rank : ranks) {
            minRank = Math.min(minRank, rank);
            maxRank = Math.max(maxRank, rank);
        }

        // Frequency array to count mechanics with each rank
        int[] freq = new int[maxRank + 1];
        for (int rank : ranks) {
            freq[rank]++;
        }

        // Minimum possible time, Maximum possible time
        long low = 1, high = 1L * minRank * cars * cars;

        // Perform binary search to find the minimum time required
        while (low < high) {
            long mid = (low + high) / 2;
            long carsRepaired = 0;

            // Calculate the total number of cars that can be repaired in 'mid' time
            for (int rank = 1; rank <= maxRank; rank++) {
                carsRepaired += freq[rank] * (long) Math.sqrt(mid / (long) rank);
            }

            // Adjust the search boundaries based on the number of cars repaired
            if (carsRepaired >= cars) {
                high = mid; // Try to find a smaller time
            } else {
                low = mid + 1; // Need more time
            }
        }
        return low;
    }
}
```

## How to Run the Code
1. Copy and paste the solution into a Java environment.
2. Run test cases with different `ranks` and `cars` values.

## Edge Cases Considered
- **All mechanics have the same rank.**
- **Only one mechanic available.**
- **Cars are fewer or greater than the number of mechanics.**
- **Minimum and maximum rank values.**

## Conclusion
This approach efficiently determines the **minimum time required** using binary search and a frequency-based approach. 🚀

