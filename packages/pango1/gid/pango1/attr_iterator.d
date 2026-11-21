/// Module for [AttrIterator] class
module gid.pango1.attr_iterator;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.boxed;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font_description;
import gid.pango1.language;
import gid.pango1.types;

/**
    A [gid.pango1.attr_iterator.AttrIterator] is used to iterate through a [gid.pango1.attr_list.AttrList].
    
    A new iterator is created with [gid.pango1.attr_list.AttrList.getIterator].
    Once the iterator is created, it can be advanced through the style
    changes in the text using [gid.pango1.attr_iterator.AttrIterator.next]. At each
    style change, the range of the current style segment and the attributes
    currently in effect can be queried.
*/
class AttrIterator : gid.gobject2.boxed.BoxedWrap!(pango_attr_iterator_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AttrIterator self() nothrow
  {
    return this;
  }

  /**
      Copy a [gid.pango1.attr_iterator.AttrIterator].
      Returns: the newly allocated
          [gid.pango1.attr_iterator.AttrIterator], which should be freed with
          [gid.pango1.attr_iterator.AttrIterator.destroy]
  */
  gid.pango1.attr_iterator.AttrIterator copy() nothrow
  {
    PangoAttrIterator* _cretval;
    _cretval = pango_attr_iterator_copy(cast(PangoAttrIterator*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.attr_iterator.AttrIterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Destroy a [gid.pango1.attr_iterator.AttrIterator] and free all associated memory.
  */
  void destroy() nothrow
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
  gid.pango1.attribute.Attribute get(gid.pango1.types.AttrType type) nothrow
  {
    PangoAttribute* _cretval;
    _cretval = pango_attr_iterator_get(cast(PangoAttrIterator*)this._cPtr, type);
    auto _retval = _cretval ? new gid.pango1.attribute.Attribute(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets a list of all attributes at the current position of the
      iterator.
      Returns: a list of all attributes for the current range. To free
          this value, call [gid.pango1.attribute.Attribute.destroy] on each
          value and [gid.glib2.slist.SList.free] on the list.
  */
  gid.pango1.attribute.Attribute[] getAttrs() nothrow
  {
    GSList* _cretval;
    _cretval = pango_attr_iterator_get_attrs(cast(PangoAttrIterator*)this._cPtr);
    auto _retval = gSListToD!(gid.pango1.attribute.Attribute, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Get the font and other attributes at the current
      iterator position.
  
      Params:
        desc = a [gid.pango1.font_description.FontDescription] to fill in with the current
            values. The family name in this structure will be set using
            [gid.pango1.font_description.FontDescription.setFamilyStatic] using
            values from an attribute in the [gid.pango1.attr_list.AttrList] associated
            with the iterator, so if you plan to keep it around, you
            must call:
            `pango_font_description_set_family (desc, pango_font_description_get_family (desc))`.
        language = location to store language tag
            for item, or null if none is found.
        extraAttrs = location in which to store a list of non-font attributes
            at the the current position; only the highest priority
            value of each attribute will be added to this list. In
            order to free this value, you must call
            [gid.pango1.attribute.Attribute.destroy] on each member.
  */
  void getFont(gid.pango1.font_description.FontDescription desc, out gid.pango1.language.Language language, out gid.pango1.attribute.Attribute[] extraAttrs) nothrow
  {
    PangoLanguage* _language;
    GSList* _extraAttrs;
    pango_attr_iterator_get_font(cast(PangoAttrIterator*)this._cPtr, desc ? cast(PangoFontDescription*)desc._cPtr(No.Dup) : null, &_language, &_extraAttrs);
    if (_language)
      language = new gid.pango1.language.Language(cast(void*)_language, Yes.Take);
    extraAttrs = gSListToD!(gid.pango1.attribute.Attribute, GidOwnership.Full)(_extraAttrs);
  }

  /**
      Advance the iterator until the next change of style.
      Returns: false if the iterator is at the end
          of the list, otherwise true
  */
  bool next() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_attr_iterator_next(cast(PangoAttrIterator*)this._cPtr);
    return _retval;
  }

  /**
      Get the range of the current segment.
      
      Note that the stored return values are signed, not unsigned
      like the values in [gid.pango1.attribute.Attribute]. To deal with this API
      oversight, stored return values that wouldn't fit into
      a signed integer are clamped to `G_MAXINT`.
  
      Params:
        start = location to store the start of the range
        end = location to store the end of the range
  */
  void range(out int start, out int end) nothrow
  {
    pango_attr_iterator_range(cast(PangoAttrIterator*)this._cPtr, cast(int*)&start, cast(int*)&end);
  }
}
