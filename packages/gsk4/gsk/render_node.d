/// Module for [RenderNode] class
module gsk.render_node;

public import gid.basictypes;
import cairo.context;
import gid.gid;
import glib.bytes;
import glib.error;
import graphene.rect;
import gsk.c.functions;
import gsk.c.types;
import gsk.types;

/**
    The basic block in a scene graph to be rendered using [gsk.renderer.Renderer].
    
    Each node has a parent, except the top-level node; each node may have
    children nodes.
    
    Each node has an associated drawing surface, which has the size of
    the rectangle set when creating it.
    
    Render nodes are meant to be transient; once they have been associated
    to a [gsk.renderer.Renderer] it's safe to release any reference you have on
    them. All [gsk.render_node.RenderNode]s are immutable, you can only specify their
    properties during construction.
*/
class RenderNode : ReffedWrap!(GskRenderNode*, gsk_render_node_ref, gsk_render_node_unref)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_render_node_get_type != &gidSymbolNotFound ? gsk_render_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Loads data previously created via [gsk.render_node.RenderNode.serialize].
      
      For a discussion of the supported format, see that function.
  
      Params:
        bytes = the bytes containing the data
        errorFunc = callback on parsing errors
      Returns: a new render node
  */
  static gsk.render_node.RenderNode deserialize(glib.bytes.Bytes bytes, gsk.types.ParseErrorFunc errorFunc = null) nothrow
  {
    extern(C) void _errorFuncCallback(const(GskParseLocation)* start, const(GskParseLocation)* end, const(GError)* error, void* userData) nothrow
    {
      auto _dlg = cast(gsk.types.ParseErrorFunc*)userData;

      try
      {
        (*_dlg)(*cast(gsk.types.ParseLocation*)start, *cast(gsk.types.ParseLocation*)end, error ? new glib.error.ErrorWrap(cast(void*)error, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gsk.types.ParseErrorFunc");
      }
    }
    auto _errorFuncCB = errorFunc ? &_errorFuncCallback : null;
    GskRenderNode* _cretval;
    auto _errorFunc = errorFunc ? cast(void*)&(errorFunc) : null;
    _cretval = gsk_render_node_deserialize(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, _errorFuncCB, _errorFunc);
    auto _retval = _cretval ? new gsk.render_node.RenderNode(cast(GskRenderNode*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Draws the contents of a render node on a cairo context.
      
      Typically, you'll use this function to implement fallback rendering
      of render nodes on an intermediate Cairo context, instead of using
      the drawing context associated to a [gdk.surface.Surface]'s rendering buffer.
      
      For advanced nodes that cannot be supported using Cairo, in particular
      for nodes doing 3D operations, this function may fail.
  
      Params:
        cr = cairo context to draw to
  */
  void draw(cairo.context.Context cr) nothrow
  {
    gsk_render_node_draw(cast(GskRenderNode*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  }

  /**
      Retrieves the boundaries of the node.
      
      The node will not draw outside of its boundaries.
  
      Params:
        bounds = return location for the boundaries
  */
  void getBounds(out graphene.rect.Rect bounds) nothrow
  {
    auto _bounds = boxedNew!graphene_rect_t(graphene.rect.Rect._getGType);
    gsk_render_node_get_bounds(cast(GskRenderNode*)this._cPtr, _bounds);
    bounds = new graphene.rect.Rect(cast(void*)_bounds, Yes.Take);
  }

  /**
      Gets a list of all children nodes of the rendernode.
      
      Keep in mind that for various rendernodes, their children have different
      semantics, like the mask vs the source of a mask node. If you care about
      thse semantics, don't use this function, use the specific getters instead.
      Returns: The children
  */
  gsk.render_node.RenderNode[] getChildren() nothrow
  {
    GskRenderNode** _cretval;
    size_t _cretlength;
    _cretval = gsk_render_node_get_children(cast(GskRenderNode*)this._cPtr, &_cretlength);
    gsk.render_node.RenderNode[] _retval;

    if (_cretval)
    {
      _retval = new gsk.render_node.RenderNode[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gsk.render_node.RenderNode(cast(void*)_cretval[i], No.Take);
    }
    return _retval;
  }

  /**
      Returns the type of the render node.
      Returns: the type of node
  */
  gsk.types.RenderNodeType getNodeType() nothrow
  {
    GskRenderNodeType _cretval;
    _cretval = gsk_render_node_get_node_type(cast(const(GskRenderNode)*)this._cPtr);
    gsk.types.RenderNodeType _retval = cast(gsk.types.RenderNodeType)_cretval;
    return _retval;
  }

  /**
      Gets an opaque rectangle inside the node that GTK can determine to
      be fully opaque.
      
      There is no guarantee that this is indeed the largest opaque rectangle or
      that regions outside the rectangle are not opaque. This function is a best
      effort with that goal.
      
      The rectangle will be fully contained in the bounds of the node.
  
      Params:
        outOpaque = return location for the opaque rect
      Returns: true if part or all of the rendernode is opaque, false if no
          opaque region could be found.
  */
  bool getOpaqueRect(out graphene.rect.Rect outOpaque) nothrow
  {
    bool _retval;
    auto _outOpaque = boxedNew!graphene_rect_t(graphene.rect.Rect._getGType);
    _retval = cast(bool)gsk_render_node_get_opaque_rect(cast(GskRenderNode*)this._cPtr, _outOpaque);
    outOpaque = new graphene.rect.Rect(cast(void*)_outOpaque, Yes.Take);
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
  glib.bytes.Bytes serialize() nothrow
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
        filename = the file to save it to
      Returns: true if saving was successful
      Throws: [ErrorWrap]
  */
  bool writeToFile(string filename)
  {
    bool _retval;
    const(char)* _filename = filename.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)gsk_render_node_write_to_file(cast(GskRenderNode*)this._cPtr, _filename, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }
}
