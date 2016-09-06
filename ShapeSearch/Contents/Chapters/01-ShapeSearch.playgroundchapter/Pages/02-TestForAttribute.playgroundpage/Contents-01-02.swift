//#-hidden-code
/*
 ShapeSearch
 Page 02-TestForAttribute
 Created by Lou Franco on 8/24/16.
 Copyright © 2016 Lou Franco. All rights reserved.

 Abstract:
 This second page of the playground book teaches you how to test a shape for an attribute using set inclusion.
 */
//#-end-hidden-code
/*:
 Did you figure out a strategy for eliminating the most shapes at each step?
 
 To start, there are 16 shapes. Since, we don't know anything about the chosen shape, the best we can do is
 come up with a question that eliminates half of them whether the answer is yes or no. You might have noticed that
 8 of the shapes are solid colored and 8 are patterned.  If we ask that first, then we will definitely end up with 
 8 shapes at the second question, whether the answer is yes or no.
 
 We can do this at each step, halving the number of shapes left. This means we can always narrow it down with four
 questions if we choose the questions carefully.  You can do better if you get lucky, but you can guarantee four
 steps by eliminating half the shapes at each step.
 
 This kind of searching is called a _binary search_.
 
 Now, we'd like to teach the Swift Playground to ask us questions using this technique. When we are done, we will
 pick a shape and the playground will ask us questions. If we do it right, it will always need just four questions.
 
 The first step is that our code will need to know how to see if a shape has a given attribute.
 */
//#-code-completion(everything, hide)
//#-hidden-code
import PlaygroundSupport
let cloud = Shapes[5]
//#-end-hidden-code
func hasAttribute(shape: Shape, attribute: ShapeAttribute) -> Bool {
    let attributes: Set<ShapeAttribute> = shape.attributes
    return attributes.contains(attribute)
}
/*:
 Change the attribute argument to this call and run the code. Swift Playground with show a T (for True) if the cloud has
 that attribute and an F (for False) if it does not.
 */
func Contents0102() -> Bool { return // REMOVE LINE
hasAttribute(shape: cloud, attribute: /*#-editable-code */.IsGray/*#-end-editable-code*/)
} // REMOVE LINE
//#-end-editable-code
/*:
 Remember, your choices of attribute are:
 
 ```
 .IsSolid
 .IsPatterned
 .IsRectangle
 .HasBorder
 .HasStraightSides
 .HasCurvedSides
 .HasLinedPattern
 .HasGridPattern
 .HasDotPattern
 .HasHole
 .IsBlue
 .IsRed
 .IsGreen
 .IsYellow
 .IsOrange
 .IsPurple
 .IsGray
 .IsBlack
 ```

 When you're ready, go to the [next page](@next) to learn how we figure out the best question to ask.
 */

