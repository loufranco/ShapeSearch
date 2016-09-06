//#-hidden-code
/*
    ShapeSearch
    Page 03-DimTheWrongShapes
    Created by Lou Franco on 8/24/16.
    Copyright © 2016 Lou Franco. All rights reserved.

    Abstract:
    This page shows how to write the code to dim out the wrong shapes
 */
//#-end-hidden-code
/*:
 Once you figure out the best attribute to ask about and ask, you need to eliminate the
 shapes that don't match any more.
 */
//#-code-completion(everything, hide)
//#-hidden-code
import PlaygroundSupport

var ShapesInView = shuffleShapes(shapes: Shapes)

private func initializeView() {
    var shapeOrder = [PlaygroundValue]()
    for s in ShapesInView {
        shapeOrder.append(.integer(s.id))
    }

    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let dict = PlaygroundValue.dictionary([
            "method": .string("setShapeOrder"),
            "shapeOrder": .array(shapeOrder)
            ])
        proxy.send(dict)
    }
}


    initializeView()


private func eliminateShapeFromView(atIndex: Int) {
    let page = PlaygroundPage.current
    if let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy {
        let dict = PlaygroundValue.dictionary([
            "method": .string("eliminateShape"),
            "atIndex": .integer(atIndex)
            ])
        proxy.send(dict)
    }
}
//#-end-hidden-code

func eliminateShapes(withAttribute attribute: ShapeAttribute, fromShapes shapes: [Shape]) -> [Shape] {
    return shapes.filter({ (s) -> Bool in
        return !s.attributes.contains(attribute)
    })
}


eliminateShapes(withAttribute: /*#-editable-code */.IsSolid/*#-end-editable-code*/, fromShapes: ShapesInView)

/*:

 When you're ready, go to the [next page](@next) to put it all together.
 */
