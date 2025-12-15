/// Module for [RenderNode] class
module gsk.render_node;

import cairo.context;
import gid.gid;
import glib.bytes;
import glib.error;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    [gsk.render_node.RenderNode] is the basic block in a scene graph to be
    rendered using [gsk.renderer.Renderer].
    
    Each node has a parent, except the top-level node; each node may have
    children nodes.
    
    Each node has an associated drawing surface, which has the size of
    the rectangle set when creating it.
    
    Render nodes are meant to be transient; once they have been associated
    to a [gsk.renderer.Renderer] it's safe to release any reference you have on
    them. All [gsk.render_node.RenderNode]s are immutable, you can only specify their
    properties during construction.
*/
class RenderNode
{
  GskRenderNode* cInstancePtr;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.render_node.RenderNode");

    cInstancePtr = cast(GskRenderNode*)ptr;

    if (!take)
      gsk_render_node_ref(cInstancePtr);
  }

  ~this()
  {
    gsk_render_node_unref(cInstancePtr);
  }


  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    if (dup)
      gsk_render_node_ref(cInstancePtr);

    return cInstancePtr;
  }

  /**
      Loads data previously created via [gsk.render_node.RenderNode.serialize].
      
      For a discussion of the supported format, see that function.
  
      Params:
        bytes = the bytes containing the data
        errorFunc = Callback on parsing errors
      Returns: a new [gsk.render_node.RenderNode]
  */
  static gsk.render_node.RenderNode deserialize(glib.bytes.Bytes bytes, gsk.types.ParseErrorFunc errorFunc = null)
  {
    extern(C) void _errorFuncCallback(const(GskParseLocation)* start, const(GskParseLocation)* end, const(GError)* error, void* userData)
    {
      auto _dlg = cast(gsk.types.ParseErrorFunc*)userData;

      (*_dlg)(*start, *end, error ? new glib.error.ErrorWrap(cast(void*)error, No.Take) : null);
    }
    auto _errorFuncCB = errorFunc ? &_errorFuncCallback : null;

    GskRenderNode* _cretval;
    auto _errorFunc = errorFunc ? cast(void*)&(errorFunc) : null;
    _cretval = gsk_render_node_deserialize(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, _errorFuncCB, _errorFunc);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Draw the contents of node to the given cairo context.
      
      Typically, you'll use this function to implement fallback rendering
      of [gsk.render_node.RenderNode]s on an intermediate Cairo context, instead of using
      the drawing context associated to a [gdk.surface.Surface]'s rendering buffer.
      
      For advanced nodes that cannot be supported using Cairo, in particular
      for nodes doing 3D operations, this function may fail.
  
      Params:
        cr = cairo context to draw to
  */
  void draw(cairo.context.Context cr)
  {
    gsk_render_node_draw(cast(GskRenderNode*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Retrieves the boundaries of the node.
      
      The node will not draw outside of its boundaries.
  
      Params:
        bounds = return location for the boundaries
  */
  void getBounds(out graphene.rect.Rect bounds)
  {
    graphene_rect_t _bounds;
    gsk_render_node_get_bounds(cast(GskRenderNode*)this._cPtr, &_bounds);
    bounds = new graphene.rect.Rect(cast(void*)&_bounds, No.Take);
  }

  /**
      Returns the type of the node.
      Returns: the type of the [gsk.render_node.RenderNode]
  */
  gsk.types.RenderNodeType getNodeType()
  {
    GskRenderNodeType _cretval;
    _cretval = gsk_render_node_get_node_type(cast(const(GskRenderNode)*)this._cPtr);
    gsk.types.RenderNodeType _retval = cast(gsk.types.RenderNodeType)_cretval;
    return _retval;
  }

  /**
      Serializes the node for later deserialization via
      [gsk.render_node.RenderNode.deserialize]. No guarantees are made about the format
      used other than that the same version of GTK will be able to deserialize
      the result of a call to [gsk.render_node.RenderNode.serialize] and
      [gsk.render_node.RenderNode.deserialize] will correctly reject files it cannot open
      that were created with previous versions of GTK.
      
      The intended use of this functions is testing, benchmarking and debugging.
      The format is not meant as a permanent storage format.
      Returns: a [glib.bytes.Bytes] representing the node.
  */
  glib.bytes.Bytes serialize()
  {
    GBytes* _cretval;
    _cretval = gsk_render_node_serialize(cast(GskRenderNode*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      This function is equivalent to calling [gsk.render_node.RenderNode.serialize]
      followed by `funcGLib.file_set_contents`.
      
      See those two functions for details on the arguments.
      
      It is mostly intended for use inside a debugger to quickly dump a render
      node to a file for later inspection.
  
      Params:
        filename = the file to save it to.
      Returns: true if saving was successful
      Throws: [ErrorWrap]
  */
  bool writeToFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gsk_render_node_write_to_file(cast(GskRenderNode*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
