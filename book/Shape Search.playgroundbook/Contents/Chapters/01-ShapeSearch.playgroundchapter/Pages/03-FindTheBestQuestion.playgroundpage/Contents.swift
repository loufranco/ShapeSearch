//#-hidden-code
/*
    ShapeSearch
    Page 03-FindTheBestQuestion
    Created by Lou Franco on 8/24/16.
    Copyright © 2016 Lou Franco. All rights reserved.

    Abstract:
    This page shows how to write the code to find the best question to ask.
*/
//#-end-hidden-code
/*:
 When you start out with 16 shapes, the best question to ask is one where half of
 them have the attribute and half don't. So, no matter what the answer is, you will eliminate
 eight shapes. If you picked one that wasn't balanced, you could get lucky and eliminate more
 than eight, but if you don't, then you'll need more than four questions to find the shape.
 
 On this page, in order to find the best attribute, we need to count how many shapes have each one.
 The function `countAttributes()` is almost complete. Follow the comments in it to finish implementing the function.
 */
//#-code-completion(everything, hide)
//#-code-completion(currentmodule, show)
//#-code-completion(identifier, show, for, if, s, attributeCount)
//#-hidden-code
import PlaygroundSupport

//#-end-hidden-code
// Count the number of shapes that have each attribute
func countAttributes(forShapes shapes: [Shape]) -> [ShapeAttribute: Int] {
    // This will be a dictionary of attributes to counts of how many shapes 
    // have that attribute.
    var attributeCount = [ShapeAttribute: Int]()

    for s in shapes {
        //#-editable-code
        // Complete the function:
        // 1. Loop through each attribute in s.attributes
        // 2. If the attributeCount dictionary has this attribute, increase the count
        // 3. If it does not, then set the count to one



        //#-end-editable-code
    }

    return attributeCount
}

func bestAttributeToAsk(forShapes shapes: [Shape]) -> ShapeAttribute {
    // Count how many shapes each attribute describes.
    let attributeCount = countAttributes(forShapes: shapes)

    // Find the attribute whose count is closest to the targetCount
    // of half the number of shapes.
    let targetCount = shapes.count / 2
    let best = attributeCount.min { (a, b) -> Bool in
        // a and b are tuples of (attribute, count). So, a.1 accesses the count.
        // This closure returns true if a is closer to the target count.
        return abs(targetCount - a.1) < abs(targetCount - b.1)
    }

    // best will be nil if the shapes array is empty. In that case we return
    // .IsRed, since all attributes are equal.
    return best?.0 ?? .IsRed
}


bestAttributeToAsk(forShapes: Shapes)

/*:

 When you're ready, go to the [next page](@next) to learn how to eliminate the wrong shapes.
 */
