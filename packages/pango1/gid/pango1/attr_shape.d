/// Module for [AttrShape] class
module gid.pango1.attr_shape;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.types;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/**
    The [gid.pango1.attr_shape.AttrShape] structure is used to represent attributes which
    impose shape restrictions.
*/
@gidGir("AttrShape")
class AttrShape : StructWrap!(PangoAttrShape)
{
  /**
      Create a `attr_shape.AttrShape` wrap type.
      Params:
        inkRect = the ink rectangle to restrict to
        logicalRect = the logical rectangle to restrict to
        copyFunc = copy function for the user data
        destroyFunc = destroy function for the user data
  */
  this(gid.pango1.types.Rectangle inkRect = gid.pango1.types.Rectangle.init, gid.pango1.types.Rectangle logicalRect = gid.pango1.types.Rectangle.init, PangoAttrDataCopyFunc copyFunc = PangoAttrDataCopyFunc.init, GDestroyNotify destroyFunc = GDestroyNotify.init) nothrow
  {
    this.inkRect = inkRect;
    this.logicalRect = logicalRect;
    this.copyFunc = copyFunc;
    this.destroyFunc = destroyFunc;
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
    return cToD!(gid.pango1.attribute.Attribute)(cast(void*)&(cast(PangoAttrShape*)this._cPtr).attr);
  }

  /**
      Get `inkRect` field.
      Returns: the ink rectangle to restrict to
  */
  @property gid.pango1.types.Rectangle inkRect() nothrow
  {
    return cToD!(gid.pango1.types.Rectangle)(cast(void*)&(cast(PangoAttrShape*)this._cPtr).inkRect);
  }

  /**
      Set `inkRect` field.
      Params:
        propval = the ink rectangle to restrict to
  */
  @property void inkRect(gid.pango1.types.Rectangle propval) nothrow
  {
    (cast(PangoAttrShape*)this._cPtr).inkRect = cast(PangoRectangle)propval;
  }

  /**
      Get `logicalRect` field.
      Returns: the logical rectangle to restrict to
  */
  @property gid.pango1.types.Rectangle logicalRect() nothrow
  {
    return cToD!(gid.pango1.types.Rectangle)(cast(void*)&(cast(PangoAttrShape*)this._cPtr).logicalRect);
  }

  /**
      Set `logicalRect` field.
      Params:
        propval = the logical rectangle to restrict to
  */
  @property void logicalRect(gid.pango1.types.Rectangle propval) nothrow
  {
    (cast(PangoAttrShape*)this._cPtr).logicalRect = cast(PangoRectangle)propval;
  }

  /**
      Get `copyFunc` field.
      Returns: copy function for the user data
  */
  @property PangoAttrDataCopyFunc copyFunc() nothrow
  {
    return (cast(PangoAttrShape*)this._cPtr).copyFunc;
  }

  /**
      Set `copyFunc` field.
      Params:
        propval = copy function for the user data
  */

  @property void copyFunc(PangoAttrDataCopyFunc propval) nothrow
  {
    (cast(PangoAttrShape*)this._cPtr).copyFunc = propval;
  }

  /**
      Get `destroyFunc` field.
      Returns: destroy function for the user data
  */
  @property GDestroyNotify destroyFunc() nothrow
  {
    return (cast(PangoAttrShape*)this._cPtr).destroyFunc;
  }

  /**
      Set `destroyFunc` field.
      Params:
        propval = destroy function for the user data
  */

  @property void destroyFunc(GDestroyNotify propval) nothrow
  {
    (cast(PangoAttrShape*)this._cPtr).destroyFunc = propval;
  }

  /**
      Create a new shape attribute.
      
      A shape is used to impose a particular ink and logical
      rectangle on the result of shaping a particular glyph.
      This might be used, for instance, for embedding a picture
      or a widget inside a [gid.pango1.layout.Layout].
  
      Params:
        inkRect = ink rectangle to assign to each character
        logicalRect = logical rectangle to assign to each character
      Returns: the newly allocated
          [gid.pango1.attribute.Attribute], which should be freed with
          [gid.pango1.attribute.Attribute.destroy]
  */
  static gid.pango1.attribute.Attribute new_(gid.pango1.types.Rectangle inkRect, gid.pango1.types.Rectangle logicalRect) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_shape_new(cast(const(PangoRectangle)*)&inkRect, cast(const(PangoRectangle)*)&logicalRect);
    auto _retval = _cretval ? new gid.pango1.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
