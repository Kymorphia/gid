/// Module for [AttrLanguage] class
module pango.attr_language;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.language;
import pango.types;

/**
    The [pango.attr_language.AttrLanguage] structure is used to represent attributes that
    are languages.
*/
class AttrLanguage
{
  PangoAttrLanguage _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for pango.attr_language.AttrLanguage");

    _cInstance = *cast(PangoAttrLanguage*)ptr;

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
    return cToD!(pango.attribute.Attribute)(cast(void*)&(cast(PangoAttrLanguage*)this._cPtr).attr);
  }

  /**
      Get `value` field.
      Returns: the [pango.language.Language] which is the value of the attribute
  */
  @property pango.language.Language value()
  {
    return cToD!(pango.language.Language)(cast(void*)(cast(PangoAttrLanguage*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the [pango.language.Language] which is the value of the attribute
  */
  @property void value(pango.language.Language propval)
  {
    cValueFree!(pango.language.Language)(cast(void*)(cast(PangoAttrLanguage*)this._cPtr).value);
    dToC(propval, cast(void*)&(cast(PangoAttrLanguage*)this._cPtr).value);
  }

  /**
      Create a new language tag attribute.
  
      Params:
        language = language tag
      Returns: the newly allocated
          [pango.attribute.Attribute], which should be freed with
          [pango.attribute.Attribute.destroy]
  */
  static pango.attribute.Attribute new_(pango.language.Language language)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_language_new(language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
