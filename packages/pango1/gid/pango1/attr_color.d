/// Module for [AttrColor] class
module gid.pango1.attr_color;

public import gid.core.basictypes;
import gid.core.utils;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.color;
import gid.pango1.types;

/**
    The [gid.pango1.attr_color.AttrColor] structure is used to represent attributes that
    are colors.
*/
@gidGir("AttrColor")
class AttrColor : StructWrap!(PangoAttrColor)
{
  /**
      Create a `attr_color.AttrColor` wrap type.
      Params:
        color = the [gid.pango1.color.Color] which is the value of the attribute
  */
  this(gid.pango1.color.Color color = gid.pango1.color.Color.init) nothrow
  {
    this.color = color;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property gid.pango1.attribute.Attribute attr() nothrow
  {
    return cToD!(gid.pango1.attribute.Attribute)(cast(void*)&(cast(PangoAttrColor*)this._cPtr).attr);
  }

  /**
      Get `color` field.
      Returns: the [gid.pango1.color.Color] which is the value of the attribute
  */
  @property gid.pango1.color.Color color() nothrow
  {
    return cToD!(gid.pango1.color.Color)(cast(void*)&(cast(PangoAttrColor*)this._cPtr).color);
  }

  /**
      Set `color` field.
      Params:
        propval = the [gid.pango1.color.Color] which is the value of the attribute
  */
  @property void color(gid.pango1.color.Color propval) nothrow
  {
    (cast(PangoAttrColor*)this._cPtr).color = cast(PangoColor)propval;
  }
}
