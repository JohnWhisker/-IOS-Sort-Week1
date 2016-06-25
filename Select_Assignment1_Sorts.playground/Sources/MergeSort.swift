import Foundation

func mergeSort(list: [Int])->[Int]{
    guard list.count > 1 else {return list}
    
    let middleIndex = list.count/2
    let leftArray = mergeSort(Array(list[0..<middleIndex]))
    let rightArray = mergeSort(Array(list[middleIndex..<list.count]))
    
    return merge(leftPile:leftArray, rightPile: rightArray)
}

// Merge function
func merge(leftPile leftPile:[Int],rightPile: [Int])->[Int]{
    var leftIndex = 0;
    var rightIndex = 0;
    
    var orderedPile = [Int]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count{
        if leftPile[leftIndex] < rightPile[rightIndex]{
            orderedPile.append(leftPile[leftIndex])
            leftIndex+=1
        } else if leftPile[leftIndex] > rightPile[rightIndex]{
            orderedPile.append(rightPile[rightIndex])
            rightIndex+=1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex+=1
            orderedPile.append(rightPile[rightIndex])
            rightIndex+=1
        }
    }
    
    while leftIndex<leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex<rightPile.count{
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
}


