/// D types for pangocairo1 library
module pangocairo.types;

import cairo.context;
import gid.gid;
import pango.attr_shape;
import pangocairo.c.functions;
import pangocairo.c.types;


// Callbacks

/**
    Function type for rendering attributes of type [pango.types.AttrType.Shape]
    with Pango's Cairo renderer.

    Params:
      cr = a Cairo context with current point set to where the shape should
        be rendered
      attr = the [pango.types.AttrType.Shape] to render (borrowed, only valid during the callback)
      doPath = whether only the shape path should be appended to current
        path of cr and no filling/stroking done.  This will be set
        to true when called from [pangocairo.global.layoutPath] and
        [pangocairo.global.layoutLinePath] rendering functions.
*/
alias ShapeRendererFunc = void delegate(cairo.context.Context cr, pango.attr_shape.AttrShape attr, bool doPath);
