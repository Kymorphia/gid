/// D types for pangocairo1 library
module gid.pangocairo1.types;

import gid.cairo1.context;
import gid.core.gid;
import gid.pango1.attr_shape;
import gid.pangocairo1.c.functions;
import gid.pangocairo1.c.types;


// Callbacks

/**
    Function type for rendering attributes of type [gid.pango1.types.AttrType.Shape]
    with Pango's Cairo renderer.

    Params:
      cr = a Cairo context with current point set to where the shape should
        be rendered (modified in place, changes are seen by the caller)
      attr = the [gid.pango1.types.AttrType.Shape] to render (borrowed, only valid during the callback)
      doPath = whether only the shape path should be appended to current
        path of cr and no filling/stroking done.  This will be set
        to true when called from [gid.pangocairo1.global.layoutPath] and
        [gid.pangocairo1.global.layoutLinePath] rendering functions.
*/
alias ShapeRendererFunc = void delegate(gid.cairo1.context.Context cr, gid.pango1.attr_shape.AttrShape attr, bool doPath);
