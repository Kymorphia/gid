/// Module for [BorderNode] class
module gsk.border_node;

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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gsk.border_node.BorderNode");

    super(cast(GskRenderNode*)ptr, take);
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
  this(gsk.rounded_rect.RoundedRect outline, float[] borderWidth, gdk.rgba.RGBA[] borderColor)
  {
    GskRenderNode* _cretval;
    assert(!borderWidth || borderWidth.length == 4);
    auto _borderWidth = cast(const(float)*)borderWidth.ptr;
    assert(!borderColor || borderColor.length == 4);
    GdkRGBA[] _tmpborderColor;
    foreach (obj; borderColor)
      _tmpborderColor ~= *cast(GdkRGBA*)obj._cPtr;
    const(GdkRGBA)* _borderColor = _tmpborderColor.ptr;
    _cretval = gsk_border_node_new(outline ? cast(const(GskRoundedRect)*)outline._cPtr : null, _borderWidth, _borderColor);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the colors of the border.
      Returns: an array of 4 [gdk.rgba.RGBA] structs
            for the top, right, bottom and left color of the border
  */
  gdk.rgba.RGBA getColors()
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_border_node_get_colors(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the outline of the border.
      Returns: the outline of the border
  */
  gsk.rounded_rect.RoundedRect getOutline()
  {
    const(GskRoundedRect)* _cretval;
    _cretval = gsk_border_node_get_outline(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = _cretval ? new gsk.rounded_rect.RoundedRect(cast(GskRoundedRect*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Retrieves the stroke widths of the border.
      Returns: an array of 4 floats
          for the top, right, bottom and left stroke width of the border,
          respectively
  */
  float[] getWidths()
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
