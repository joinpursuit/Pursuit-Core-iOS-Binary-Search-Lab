import Foundation

//

// 1. Find if an element is contained within a sorted array in O(log(n)) time.  Do not use recursion.

//func binarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
//
//    return false
//}

//func binarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
//
//    var lowerIndex = 0
//    var upper
//
//    return false
//}
func binarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
    
    var leftIndex = 0
    var rightIndex = arr.count - 1
    
    while leftIndex <= rightIndex {
        let midIndex = (leftIndex + rightIndex) / 2
        let midValue = arr[midIndex]
        if midValue == target {
            return true
        } else if midValue > target {
            rightIndex = midIndex - 1
        } else {
            leftIndex = midIndex + 1
        }
    }
    return false
}


// 2. Find if an element is contained within a sorted array in O(log(n)) time.  Use recursion.

//func recursiveBinarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
//
//
//    return false
//}

func recursiveBinarySearch<T: Comparable>(arr: [T], target: T) -> Bool {
    
    if arr.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = arr.count - 1
    let midIndex = maxIndex/2
    let midValue = arr[midIndex]
    
    
    if target < arr[minIndex] || target > arr[maxIndex]{
        print("\(target) does not exist in the array")
        return false
    }
    
    if target > midValue {
        let slicedArray = Array(arr[midIndex + 1...maxIndex])
        return binarySearch(arr: slicedArray, target: target)
    }
    
    
    if target < midValue {
        let slicedArray = Array(arr[minIndex...midIndex - 1])
        return binarySearch(arr: slicedArray, target: target)
    }
    
    if target == midValue {
        print("\(target) was found in the array")
        return true
    }
    
    return false
}

// https://www.interviewbit.com/problems/matrix-search/

// 3. Find if a value is contained in a matrix of dimensions m x n. This matrix has the following properties:

// Integers in each row are sorted from left to right.
// The first integer of each row is greater than or equal to the last integer of the previous row.

func contains(value: Int, in arr: [[Int]]) -> Bool {
    if arr.count == 0 || arr[0].count == 0 {
        return false
    }
    
    let n = arr.count
    let m = arr[0].count
    var left = 0
    var right = m * n - 1
    var mid = 0
    
    while left != right {
        mid = (left + right - 1) >> 1
        if arr[mid / m][mid % m] < value {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return arr[right / m][right % m] == value
}





// https://www.techiedelight.com/find-first-or-last-occurrence-of-a-given-number-sorted-array/
// 4. Given a sorted array of integers, find the index of the last occurrence of a given number.  Your solution should work in O(log(n)) time

//func lastOccurrence<T: Comparable>(of value: T, in arr: [T]) -> Int? {
//
//    if arr.count == 0{
//        return nil
//    }
//
//    var leftIndex = 0
//    var rightIndex = arr.count - 1
//
//    while(leftIndex < rightIndex) {
//        let midIndex = (leftIndex + rightIndex)/2
//
//        //if target value is greater than value at midIndex
//        if(arr[midIndex] < value) {
//            leftIndex = midIndex + 1
//        }else {
//            rightIndex = midIndex
//        }
//    }
//
//    if(arr[leftIndex] != value) {
//        return nil
//    }
//
//
//
//    return nil
//}

func lastOccurrence<T: Comparable>(of value: T, in arr: [T]) -> Int? {
    
    var result: Int?
    
    if arr.count == 0{
        return nil
    }
    
    var leftIndex = 0
    var rightIndex = arr.count - 1
    
    while(leftIndex <= rightIndex) {
        let midIndex = (leftIndex + rightIndex)/2
        
        if arr[midIndex] == value{
            result = midIndex
            leftIndex = midIndex + 1
        }
            
        else if arr[midIndex] > value{
            rightIndex = midIndex - 1
        }
            
        else{
            leftIndex = midIndex + 1
        }
        
    }
    return result
}

// https://www.techiedelight.com/find-smallest-missing-element-sorted-array/
// 5. Given a sorted array of distinct non-negative integers, find the smallest missing number.  Your solution should work in O(log(n)) time

func smallestMissingNumber(in arr: [Int]) -> Int {
    
//    var result = 0
    
    var leftIndex = 0
    var rightIndex = arr.count - 1
    
    while(leftIndex <= rightIndex) {
        let midIndex = (leftIndex + rightIndex)/2
        
        if arr[midIndex] == midIndex{
            //mismatch is on the right side
            leftIndex = midIndex + 1
        }else{
            //mismatch is on the left side
            rightIndex = midIndex - 1
        }
    }
//    return result
    if leftIndex > rightIndex{
        return leftIndex
    }else{
        return rightIndex
    }
}
