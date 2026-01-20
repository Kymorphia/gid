/// Module for [AttrFontFeatures] class
module pango.attr_font_features;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_font_features.AttrFontFeatures] structure is used to represent OpenType
    font features as an attribute.
*/
class AttrFontFeatures
{
  PangoAttrFontFeatures _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_font_features.AttrFontFeatures");

    _cInstance = *cast(PangoAttrFontFeatures*)ptr;

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
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFontFeatures*)this._cPtr).attr);
  }

  /**
      Get `features` field.
      Returns: the features, as a string in CSS syntax
  */
  @property string features()
  {
    return cToD!(string)(cast(void*)(cast(PangoAttrFontFeatures*)this._cPtr).features);
  }

  /**
      Set `features` field.
      Params:
        propval = the features, as a string in CSS syntax
  */
  @property void features(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(PangoAttrFontFeatures*)this._cPtr).features);
    dToC(propval, cast(void*)&(cast(PangoAttrFontFeatures*)this._cPtr).features);
  }

  /**
      Create a new font features tag attribute.
      
      You can use this attribute to select OpenType font features like small-caps,
      alternative glyphs, ligatures, etc. for fonts that support them.
  
      Params:
        features = a string with OpenType font features, with the syntax of the [CSS
          font-feature-settings property](https://www.w3.org/TR/css-fonts-4/#font-rend-desc)
      Returns: the newly allocated
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(string features)
  {
    PangoAttribute* _cretval;
    const(char)* _features = features.toCString(No.Alloc);
    _cretval = pango_attr_font_features_new(_features);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
