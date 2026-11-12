/// Module for [BorderNode] class
module gsk.border_node;

public import gid.basictypes;
import gdk.rgba;
import gid.gid;
import gsk.c.functions;
import gsk.c.types;
import gsk.render_node;
import gsk.rounded_rect;
import gsk.types;

/**
    A render node for a border.
*/
class BorderNode : gsk.render_node.RenderNode
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
    return cast(void function())gsk_border_node_get_type != &gidSymbolNotFound ? gsk_border_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gsk.render_node.RenderNode] that will stroke a border rectangle inside the
      given outline.
      
      The 4 sides of the border can have different widths and colors.
  
      Params:
        outline = a [gsk.rounded_rect.RoundedRect] describing the outline of the border
        borderWidth = the stroke width of the border on
              the top, right, bottom and left side respectively.
        borderColor = the color used on the top, right,
              bottom and left side.
      Returns: A new [gsk.render_node.RenderNode]
  */
  this(gsk.rounded_rect.RoundedRect outline, float[] borderWidth, gdk.rgba.RGBA[] borderColor) nothrow
  {
    GskRenderNode* _cretval;
    if (borderWidth.length > 4) borderWidth = borderWidth[0 .. 4];
    auto _borderWidth = cast(float*)borderWidth.ptr;
    typeof(*_borderWidth)[4] _borderWidth_fixed = void;
    if (borderWidth.length < 4)
    {
      (cast(ubyte[])_borderWidth_fixed[])[] = 0;
      _borderWidth_fixed[0 .. borderWidth.length] = _borderWidth[0 .. borderWidth.length];
      _borderWidth = _borderWidth_fixed.ptr;
    }
    if (borderColor.length > 4) borderColor = borderColor[0 .. 4];
    auto _borderColor = cast(GdkRGBA*)borderColor.ptr;
    typeof(*_borderColor)[4] _borderColor_fixed = void;
    if (borderColor.length < 4)
    {
      (cast(ubyte[])_borderColor_fixed[])[] = 0;
      _borderColor_fixed[0 .. borderColor.length] = _borderColor[0 .. borderColor.length];
      _borderColor = _borderColor_fixed.ptr;
    }
    _cretval = gsk_border_node_new(outline ? cast(const(GskRoundedRect)*)outline._cPtr : null, _borderWidth, _borderColor);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the colors of the border.
      Returns: an array of 4 [gdk.rgba.RGBA]
          structs for the top, right, bottom and left color of the border
  */
  gdk.rgba.RGBA[] getColors() nothrow
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_border_node_get_colors(cast(const(GskRenderNode)*)this._cPtr);
    gdk.rgba.RGBA[] _retval;

    if (_cretval)
    {
      _retval = new gdk.rgba.RGBA[4];
      foreach (i; 0 .. 4)
        _retval[i] = cast(gdk.rgba.RGBA)(_cretval[i]);
    }
    return _retval;
  }

  /**
      Retrieves the outline of the border.
      Returns: the outline of the border
  */
  gsk.rounded_rect.RoundedRect getOutline() nothrow
  {
    const(GskRoundedRect)* _cretval;
    _cretval = gsk_border_node_get_outline(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
    return _retval;
  }

  /**
      Retrieves the stroke widths of the border.
      Returns: an array of 4 floats
          for the top, right, bottom and left stroke width of the border,
          respectively
  */
  float[] getWidths() nothrow
  {
    const(float)* _cretval;
    _cretval = gsk_border_node_get_widths(cast(const(GskRenderNode)*)this._cPtr);
    float[] _retval;

    if (_cretval)
    {
      _retval = cast(float[])_cretval[0 .. 4].dup;
    }
    return _retval;
  }
}
