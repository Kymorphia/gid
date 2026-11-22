/// D types for gsk4 library
module gid.gsk4.types;

import gid.core.utils;
import gid.gdk4.texture;
import gid.glib2.error;
import gid.graphene1.point;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.path;
import gid.gsk4.path_point;
import gid.gsk4.render_node;
import gid.gsk4.render_replay;
import gid.pango1.font;


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
alias ParseErrorFunc = void delegate(gid.gsk4.types.ParseLocation start, gid.gsk4.types.ParseLocation end, gid.glib2.error.ErrorWrap error);

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
alias PathForeachFunc = bool delegate(gid.gsk4.types.PathOperation op, gid.graphene1.point.Point[] pts, float weight);

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
alias PathIntersectionFunc = bool delegate(gid.gsk4.path.Path path1, gid.gsk4.path_point.PathPoint point1, gid.gsk4.path.Path path2, gid.gsk4.path_point.PathPoint point2, gid.gsk4.types.PathIntersection kind);

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
alias RenderReplayFontFilter = gid.pango1.font.Font delegate(gid.gsk4.render_replay.RenderReplay replay, gid.pango1.font.Font font);

/**
    A function to replay a node.
    
    The node may be returned unmodified.
    
    The node may be discarded by returning null.
    
    If you do not want to do any handling yourself, call
    [gid.gsk4.render_replay.RenderReplay.default_] to use the default handler
    that calls your function on the children of the node.

    Params:
      replay = The replay object used to replay the node (modified in place, changes are seen by the caller)
      node = The node to replay
    Returns: The replayed node
*/
alias RenderReplayNodeFilter = gid.gsk4.render_node.RenderNode delegate(gid.gsk4.render_replay.RenderReplay replay, gid.gsk4.render_node.RenderNode node);

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
alias RenderReplayTextureFilter = gid.gdk4.texture.Texture delegate(gid.gsk4.render_replay.RenderReplay replay, gid.gdk4.texture.Texture texture);
