
# Product of the Last K Numbers

## Problem Description

The problem involves designing an algorithm that accepts a stream of integers and retrieves the product of the last `k` integers from the stream. The class should support the following operations:

- **ProductOfNumbers()**: Initializes the object with an empty stream.
- **add(int num)**: Appends the integer `num` to the stream.
- **getProduct(int k)**: Returns the product of the last `k` numbers in the current list.

### Example

```java
ProductOfNumbers productOfNumbers = new ProductOfNumbers();
productOfNumbers.add(3);        // [3]
productOfNumbers.add(0);        // [3,0]
productOfNumbers.add(2);        // [3,0,2]
productOfNumbers.add(5);        // [3,0,2,5]
productOfNumbers.add(4);        // [3,0,2,5,4]
System.out.println(productOfNumbers.getProduct(2)); // 20
System.out.println(productOfNumbers.getProduct(3)); // 40
System.out.println(productOfNumbers.getProduct(4)); // 0
productOfNumbers.add(8);        // [3,0,2,5,4,8]
System.out.println(productOfNumbers.getProduct(2)); // 32
```

### Input and Output

Input:
- **`add(num)`**: Integer `num` (0 <= `num` <= 100).
- **`getProduct(k)`**: Integer `k` (1 <= `k` <= 40,000).

Output:
- Integer representing the product of the last `k` numbers in the stream.

### Explanation

1. After adding `3`, the stream is `[3]`.
2. After adding `0`, the stream becomes `[3, 0]` and any subsequent product will involve zero.
3. After adding `2`, `5`, and `4`, the product of the last 2 numbers is `20` (from `5 * 4`), the product of the last 3 is `40` (from `2 * 5 * 4`), and the product of the last 4 is `0` (due to the presence of 0).
4. Adding `8` resets the product list starting from `1`.

## Solution

```java
import java.util.ArrayList;

class ProductOfNumbers {

    // Stores cumulative product of the stream
    private ArrayList<Integer> prefixProduct = new ArrayList<>();
    private int size = 0;

    public ProductOfNumbers() {
        // Initialize the product list with 1 to handle multiplication logic
        this.prefixProduct.add(1);
        this.size = 0;
    }

    public void add(int num) {
        if (num == 0) {
            // If num is 0, reset the cumulative products since multiplication
            // with 0 invalidates previous products
            this.prefixProduct = new ArrayList<Integer>();
            this.prefixProduct.add(1);
            this.size = 0;
        } else {
            // Append the cumulative product of the current number with the last
            // product
            this.prefixProduct.add(this.prefixProduct.get(size) * num);
            this.size++;
        }
    }

    public int getProduct(int k) {
        // Check if the requested product length exceeds the size of the valid
        // product list
        if (k > this.size) return 0;

        // Compute the product of the last k elements using division
        return (
            this.prefixProduct.get(this.size) /
            this.prefixProduct.get(this.size - k)
        );
    }
}
```

## Complexity Analysis

### Time Complexity

- **`add(int num)`**: O(1)
  - Each `add` operation either appends the cumulative product to the list or resets the list entirely if `num == 0`. This operation involves a constant amount of work (just adding the number to the list).
  
- **`getProduct(int k)`**: O(1)
  - The `getProduct` operation involves two list accesses (for the last product and the product `k` elements before it) and a division. These operations are constant time.

### Space Complexity

- **O(n)** where `n` is the number of numbers added to the stream.
  - The space is primarily used to store the cumulative product of the stream in the `prefixProduct` list. In the worst case, each `add` operation appends a new product, so the space required is proportional to the number of added elements.

### Edge Cases Considered

- **Zero in the stream**: If `0` is added to the stream, it resets the product list, as any product involving 0 will be zero.
- **Product calculation for `k` greater than the stream size**: The `getProduct(k)` function ensures that it never returns a product when `k` exceeds the number of elements in the stream.

## Conclusion

This solution efficiently computes the product of the last `k` elements in a stream with constant time operations for both `add` and `getProduct`. The approach uses cumulative products and ensures optimal time and space complexity, even for large streams.

---

