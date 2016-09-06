//#-hidden-code
/*
     ShapeSearch
     Page 04-PlaygroundPlays
     Created by Lou Franco on 8/24/16.
     Copyright © 2016 Lou Franco. All rights reserved.

     Abstract:
     This page ties it all together to get the playground to play the game.
 */
//#-end-hidden-code
/*:

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
//-REMOVEask(/*#-editable-code *//*#-end-editable-code*/)
/*:

 When you're ready, go to the [next page](@next) to ...
 */
