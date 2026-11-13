/// D types for gsk4 library
module gsk.types;

import gdk.texture;
import gid.gid;
import glib.error;
import graphene.point;
import gsk.c.functions;
import gsk.c.types;
import gsk.path;
import gsk.path_point;
import gsk.render_node;
import gsk.render_replay;
import pango.font;


// Enums

/** */
alias BlendMode = GskBlendMode;

/** */
alias Corner = GskCorner;

/** */
alias FillRule = GskFillRule;

/** */
alias GLUniformType = GskGLUniformType;

/** */
alias Isolation = GskIsolation;

/** */
alias LineCap = GskLineCap;

/** */
alias LineJoin = GskLineJoin;

/** */
alias MaskMode = GskMaskMode;

/** */
alias PathDirection = GskPathDirection;

/** */
alias PathForeachFlags = GskPathForeachFlags;

/** */
alias PathIntersection = GskPathIntersection;

/** */
alias PathOperation = GskPathOperation;

/** */
alias PorterDuff = GskPorterDuff;

/** */
alias RenderNodeType = GskRenderNodeType;

/** */
alias ScalingFilter = GskScalingFilter;

/** */
alias SerializationError = GskSerializationError;

/** */
alias TransformCategory = GskTransformCategory;

// Structs

/** */
alias ParseLocation = GskParseLocation;

// Callbacks

/**
    Type of callback that is called when an error occurs
    during node deserialization.

    Params:
      start = start of the error location
      end = end of the error location
      error = the error
*/
alias ParseErrorFunc = void delegate(gsk.types.ParseLocation start, gsk.types.ParseLocation end, glib.error.ErrorWrap error);

/**
    Type of the callback to iterate through the operations of a path.
    
    For each operation, the callback is given the op itself, the points
    that the operation is applied to in pts, and a weight for conic
    curves. The n_pts argument is somewhat redundant, since the number
    of points can be inferred from the operation.
    
    Each contour of the path starts with a GSK_PATH_MOVE operation.
    Closed contours end with a GSK_PATH_CLOSE operation.

    Params:
      op = The operation
      pts = The points of the operation
      weight = The weight for conic curves, or unused if not a conic curve
    Returns: true to continue iterating the path, false to
        immediately abort and not call the function again.
*/
alias PathForeachFunc = bool delegate(gsk.types.PathOperation op, graphene.point.Point[] pts, float weight);

/**
    Prototype of the callback to iterate through the
    intersections of two paths.

    Params:
      path1 = the first path (modified in place, changes are seen by the caller)
      point1 = the intersection as point on path1
      path2 = the second path (modified in place, changes are seen by the caller)
      point2 = the intersection as point on path2
      kind = the nature of the intersection
    Returns: true to continue iterating, false to
        stop the iteration and not call the function again
*/
alias PathIntersectionFunc = bool delegate(gsk.path.Path path1, gsk.path_point.PathPoint point1, gsk.path.Path path2, gsk.path_point.PathPoint point2, gsk.types.PathIntersection kind);

/**
    A function that filters fonts.
    
    The function will be called by the default replay function for
    all nodes with fonts. They will then generate a node using the
    returned font.
    
    It is valid for the function to return the passed in font if
    the font shuld not be modified.

    Params:
      replay = The replay object used to replay the node (modified in place, changes are seen by the caller)
      font = The font to filter
    Returns: The filtered font
*/
alias RenderReplayFontFilter = pango.font.Font delegate(gsk.render_replay.RenderReplay replay, pango.font.Font font);

/**
    A function to replay a node.
    
    The node may be returned unmodified.
    
    The node may be discarded by returning null.
    
    If you do not want to do any handling yourself, call
    [gsk.render_replay.RenderReplay.default_] to use the default handler
    that calls your function on the children of the node.

    Params:
      replay = The replay object used to replay the node (modified in place, changes are seen by the caller)
      node = The node to replay
    Returns: The replayed node
*/
alias RenderReplayNodeFilter = gsk.render_node.RenderNode delegate(gsk.render_replay.RenderReplay replay, gsk.render_node.RenderNode node);

/**
    A function that filters textures.
    
    The function will be called by the default replay function for
    all nodes with textures. They will then generate a node using the
    returned texture.
    
    It is valid for the function to return the passed in texture if
    the texture shuld not be modified.

    Params:
      replay = The replay object used to replay the node (modified in place, changes are seen by the caller)
      texture = The texture to filter
    Returns: The filtered texture
*/
alias RenderReplayTextureFilter = gdk.texture.Texture delegate(gsk.render_replay.RenderReplay replay, gdk.texture.Texture texture);
