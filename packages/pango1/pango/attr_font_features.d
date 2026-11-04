/// Module for [AttrFontFeatures] class
module pango.attr_font_features;

public import gid.basictypes;
import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    The [pango.attr_font_features.AttrFontFeatures] structure is used to represent OpenType
    font features as an attribute.
*/
class AttrFontFeatures : StructWrap!(PangoAttrFontFeatures)
{
  /**
      Create a `attr_font_features.AttrFontFeatures` wrap type.
      Params:
        features = the features, as a string in CSS syntax
  */
  this(string features = string.init) nothrow
  {
    this.features = features;
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
  @property pango.attribute.Attribute attr() nothrow
  {
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrFontFeatures*)this._cPtr).attr);
  }

  private const(char)* _featuresRef; // Keeps borrowed GC string alive

  /**
      Get `features` field.
      Returns: the features, as a string in CSS syntax
  */
  @property string features() nothrow
  {
    return cToD!(string)(cast(void*)(cast(PangoAttrFontFeatures*)this._cPtr).features);
  }

  /**
      Set `features` field.
      Params:
        propval = the features, as a string in CSS syntax
  */
  @property void features(string propval) nothrow
  {
    if (_refuseBorrowedStore("features"))
      return;

    _featuresRef = toCString!(No.Malloc, Yes.Nullable)(propval);
    (cast(PangoAttrFontFeatures*)this._cPtr).features = cast(char*)_featuresRef;
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
  static pango.attribute.Attribute new_(string features) nothrow
  {
    PangoAttribute* _cretval;
    const(char)* _features = features.toCString!(No.Malloc, No.Nullable);
    _cretval = pango_attr_font_features_new(_features);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
