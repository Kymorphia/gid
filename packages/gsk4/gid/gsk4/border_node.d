/// Module for [BorderNode] class
module gid.gsk4.border_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.rgba;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.rounded_rect;
import gid.gsk4.types;

/**
    A render node for a border.
*/
class BorderNode : gid.gsk4.render_node.RenderNode
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gsk_border_node_get_type != &gidSymbolNotFound ? gsk_border_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a [gid.gsk4.render_node.RenderNode] that will stroke a border rectangle inside the
      given outline.
      
      The 4 sides of the border can have different widths and colors.
  
      Params:
        outline = a [gid.gsk4.rounded_rect.RoundedRect] describing the outline of the border
        borderWidth = the stroke width of the border on
              the top, right, bottom and left side respectively.
        borderColor = the color used on the top, right,
              bottom and left side.
      Returns: A new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.gsk4.rounded_rect.RoundedRect outline, float[] borderWidth, gid.gdk4.rgba.RGBA[] borderColor) nothrow
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
      Returns: an array of 4 [gid.gdk4.rgba.RGBA]
          structs for the top, right, bottom and left color of the border
  */
  gid.gdk4.rgba.RGBA[] getColors() nothrow
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_border_node_get_colors(cast(const(GskRenderNode)*)this._cPtr);
    gid.gdk4.rgba.RGBA[] _retval;

    if (_cretval)
    {
      _retval = new gid.gdk4.rgba.RGBA[4];
      foreach (i; 0 .. 4)
        _retval[i] = cast(gid.gdk4.rgba.RGBA)(_cretval[i]);
    }
    return _retval;
  }

  /**
      Retrieves the outline of the border.
      Returns: the outline of the border
  */
  gid.gsk4.rounded_rect.RoundedRect getOutline() nothrow
  {
    const(GskRoundedRect)* _cretval;
    _cretval = gsk_border_node_get_outline(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gid.gsk4.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, this) : null;
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
