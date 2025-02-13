      Minimum Operations to Exceed Threshold Value II (LeetCode 3066)
      Problem Statement
      You are given a 0-indexed integer array nums and an integer k. Perform the following operation on nums until all elements in the array are greater than or equal to k:
      
      Take the two smallest integers x and y from the array.
      Remove x and y from the array.
      Add min(x, y) * 2 + max(x, y) to the array.
      Repeat this operation until all elements in nums are greater than or equal to k. Return the minimum number of operations needed to achieve this.
      
      Example 1:
      Input:
      
      plaintext
      Copy
      nums = [2, 11, 10, 1, 3], k = 10
      Output:
      
      plaintext
      Copy
      2
      Explanation:
      
      Remove "1" and "2" → add 1 * 2 + 2 = 4 → nums = [4, 11, 10, 3]
      Remove "3" and "4" → add 3 * 2 + 4 = 10 → nums = [10, 11, 10]
      Now, all elements are greater than or equal to 10.
      Example 2:
      Input:
      
      plaintext
      Copy
      nums = [1, 1, 2, 4, 9], k = 20
      Output:
      
      plaintext
      Copy
      4
      Explanation:
      
      After each operation, the following updates happen:
      First operation: nums = [2, 4, 9, 3]
      Second operation: nums = [7, 4, 9]
      Third operation: nums = [15, 9]
      Fourth operation: nums = [33]
      Now, all elements are greater than or equal to 20.
      Solution Approach
      We can solve this problem using a greedy strategy with a min-heap (priority queue).
      
      Key Observations:
      Each operation always involves the two smallest numbers in the array, so we need an efficient way to retrieve and remove these elements. A min-heap is perfect for this purpose.
      After each operation, we add the new value (min(x, y) * 2 + max(x, y)) back into the heap.
      The process continues until the smallest element in the heap is greater than or equal to k.
      Approach:
      Create a min-heap: Initialize a priority queue (min-heap) to store the numbers in nums.
      Repeat the operation: While the smallest element is less than k, remove the two smallest elements from the heap, calculate the new value, and insert it back into the heap.
      Count the operations: Keep track of how many operations are performed.
      Return the result: Once the smallest element is greater than or equal to k, return the number of operations.
      Java Solution
      java
      Copy
      import java.util.*;
      
      class Solution {
          public int minOperations(int[] nums, int k) {
              // Create a min-heap from the input array 'nums'
              PriorityQueue<Long> minHeap = new PriorityQueue<Long>(
                  Arrays.stream(nums)
                      .mapToLong(i -> (long) i)
                      .boxed()
                      .collect(Collectors.toList())
              );
              
              int numOperations = 0;
      
              // Continue performing the operation until the smallest element >= k
              while (minHeap.peek() < k) {
                  long x = minHeap.remove();
                  long y = minHeap.remove();
                  
                  // Apply the operation and add the new value to the heap
                  minHeap.add(Math.min(x, y) * 2 + Math.max(x, y));
                  
                  numOperations++;
              }
      
              // Return the total number of operations performed
              return numOperations;
          }
      }
      Complexity Analysis
      Time Complexity:
      Heap Operations: Each heap operation (insertion or removal) takes O(log n) time, where n is the number of elements in the heap.
      In the worst case, each operation reduces the size of the array by 1, and we perform this operation multiple times until all elements are greater than or equal to k.
      The overall time complexity is O(m * log n), where m is the number of operations required to make all elements greater than or equal to k, and n is the length of the array.
      Space Complexity:
      The space complexity is O(n) because we store the entire array in the heap, and the heap can grow as large as the size of the array.
      Edge Cases:
      All elements are already >= k: The loop won't run, and the function will immediately return 0 operations.
      Small arrays: The solution works even for small arrays, as the heap operations will still run efficiently.
      Conclusion:
      This solution efficiently handles the problem using a greedy approach with a priority queue. By always removing the two smallest elements and applying the operation, we ensure that the number of operations is minimized. The solution is optimal in both time and space complexity for the given problem constraints.
      
      Happy Coding! 🚀
