/// Module for [AttrFontDesc] class
module pango.attr_font_desc;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.font_description;
import pango.types;

/**
    The [pango.attr_font_desc.AttrFontDesc] structure is used to store an attribute that
    sets all aspects of the font description at once.
*/
class AttrFontDesc
{
  PangoAttrFontDesc _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_font_desc.AttrFontDesc");

    _cInstance = *cast(PangoAttrFontDesc*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `attr` field.
      Returns: the common portion of the attribute
  */
  @property pango.attribute.Attribute attr()
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFontDesc*)this._cPtr).attr);
  }

  /**
      Get `desc` field.
      Returns: the font description which is the value of this attribute
  */
  @property pango.font_description.FontDescription desc()
  {
    return cToD!(pango.font_description.FontDescription)(cast(void*)(cast(PangoAttrFontDesc*)this._cPtr).desc);
  }

  /**
      Set `desc` field.
      Params:
        propval = the font description which is the value of this attribute
  */
  @property void desc(pango.font_description.FontDescription propval)
  {
    cValueFree!(pango.font_description.FontDescription)(cast(void*)(cast(PangoAttrFontDesc*)this._cPtr).desc);
    dToC(propval, cast(void*)&(cast(PangoAttrFontDesc*)this._cPtr).desc);
  }

  /**
      Create a new font description attribute.
      
      This attribute allows setting family, style, weight, variant,
      stretch, and size simultaneously.
  
      Params:
        desc = the font description
      Returns: the newly allocated
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(pango.font_description.FontDescription desc)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_font_desc_new(desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
