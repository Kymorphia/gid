/// Module for [AttrIterator] class
module pango.attr_iterator;

import gid.gid;
import gobject.boxed;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.font_description;
import pango.language;
import pango.types;

/**
    A [pango.attr_iterator.AttrIterator] is used to iterate through a [pango.attr_list.AttrList].
    
    A new iterator is created with [pango.attr_list.AttrList.getIterator].
    Once the iterator is created, it can be advanced through the style
    changes in the text using [pango.attr_iterator.AttrIterator.next]. At each
    style change, the range of the current style segment and the attributes
    currently in effect can be queried.
*/
class AttrIterator : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_attr_iterator_get_type != &gidSymbolNotFound ? pango_attr_iterator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AttrIterator self()
  {
    return this;
  }

  /**
      Copy a [pango.attr_iterator.AttrIterator].
      Returns: the newly allocated
          [pango.attr_iterator.AttrIterator], which should be freed with
          [pango.attr_iterator.AttrIterator.destroy]
  */
  pango.attr_iterator.AttrIterator copy()
  {
    PangoAttrIterator* _cretval;
    _cretval = pango_attr_iterator_copy(cast(PangoAttrIterator*)this._cPtr);
    auto _retval = _cretval ? new pango.attr_iterator.AttrIterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Destroy a [pango.attr_iterator.AttrIterator] and free all associated memory.
  */
  void destroy()
  {
    pango_attr_iterator_destroy(cast(PangoAttrIterator*)this._cPtr);
  }

  /**
      Find the current attribute of a particular type
      at the iterator location.
      
      When multiple attributes of the same type overlap,
      the attribute whose range starts closest to the
      current location is used.
  
      Params:
        type = the type of attribute to find
      Returns: the current
          attribute of the given type, or null if no attribute
          of that type applies to the current location.
  */
  pango.attribute.Attribute get(pango.types.AttrType type)
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_iterator_get(cast(PangoAttrIterator*)this._cPtr, type);
    auto _retval = _cretval ? new pango.attribute.Attribute(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets a list of all attributes at the current position of the
      iterator.
      Returns: a list of all attributes for the current range. To free
          this value, call [pango.attribute.Attribute.destroy] on each
          value and [glib.slist.SList.free] on the list.
  */
  pango.attribute.Attribute[] getAttrs()
  {
    GSList* _cretval;
    _cretval = pango_attr_iterator_get_attrs(cast(PangoAttrIterator*)this._cPtr);
    auto _retval = gSListToD!(pango.attribute.Attribute, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Get the font and other attributes at the current
      iterator position.
  
      Params:
        desc = a [pango.font_description.FontDescription] to fill in with the current
            values. The family name in this structure will be set using
            [pango.font_description.FontDescription.setFamilyStatic] using
            values from an attribute in the [pango.attr_list.AttrList] associated
            with the iterator, so if you plan to keep it around, you
            must call:
            `pango_font_description_set_family (desc, pango_font_description_get_family (desc))`.
        language = location to store language tag
            for item, or null if none is found.
        extraAttrs = location in which to store a list of non-font attributes
            at the the current position; only the highest priority
            value of each attribute will be added to this list. In
            order to free this value, you must call
            [pango.attribute.Attribute.destroy] on each member.
  */
  void getFont(pango.font_description.FontDescription desc, out pango.language.Language language, out pango.attribute.Attribute[] extraAttrs)
  {
    PangoLanguage* _language;
    GSList* _extraAttrs;
    pango_attr_iterator_get_font(cast(PangoAttrIterator*)this._cPtr, desc ? cast(PangoFontDescription*)desc._cPtr(No.Dup) : null, &_language, &_extraAttrs);
    language = new pango.language.Language(cast(void*)_language, Yes.Take);
    extraAttrs = gSListToD!(pango.attribute.Attribute, GidOwnership.Full)(_extraAttrs);
  }

  /**
      Advance the iterator until the next change of style.
      Returns: false if the iterator is at the end
          of the list, otherwise true
  */
  bool next()
  {
    bool _retval;
    _retval = cast(bool)pango_attr_iterator_next(cast(PangoAttrIterator*)this._cPtr);
    return _retval;
  }

  /**
      Get the range of the current segment.
      
      Note that the stored return values are signed, not unsigned
      like the values in [pango.attribute.Attribute]. To deal with this API
      oversight, stored return values that wouldn't fit into
      a signed integer are clamped to `G_MAXINT`.
  
      Params:
        start = location to store the start of the range
        end = location to store the end of the range
  */
  void range(out int start, out int end)
  {
    pango_attr_iterator_range(cast(PangoAttrIterator*)this._cPtr, cast(int*)&start, cast(int*)&end);
  }
}
