//#-hidden-code
/*
    ShapeSearch
    Page 01-GuessTheShape
    Created by Lou Franco on 8/24/16.
    Copyright © 2016 Lou Franco. All rights reserved.

    Abstract:
    This first page of the playground book lets you play the shape searching game we're going to program the playground to play.
*/
//#-end-hidden-code
/*:
 We're going to play a game. On the right are some shapes. Some are solid colored, and some are patterned. Some 
 have straight sides, and some are curvy.
 
 I have secretly picked one and I want you to guess which one it is.

 You can ask yes or no questions to figure it out. The way you do that is by calling the `ask(...)` function and passing one of
 these arguments:
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

 For example, if you want to ask if the shape has a dotted pattern, call `ask()` like this:
 
 `ask(.HasDotPattern)`

 If the answer is yes, then the non-dotted shapes will dim out.  If the answer is no, then the dotted ones will, and you can ask another question to narrow it down further.

 Think about what question you want to ask first, so that a yes or a no eliminates as many shapes as possible.
 */
//#-code-completion(everything, hide)
//#-hidden-code
import PlaygroundSupport

private func ask(_ attribute: ShapeAttribute) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let dict = PlaygroundValue.dictionary([
            "method": .string("ask"),
            "attribute": .integer(attribute.rawValue)
        ])
        proxy.send(dict)
    }
}
//#-end-hidden-code
ask(/*#-editable-code *//*#-end-editable-code*/)
/*:
 Keep asking questions until you have narrowed it down to one shape.

 When you're ready, go to the [next page](@next) to learn how we can program the playground to make guesses.
 */
