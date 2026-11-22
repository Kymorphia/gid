/// Module for [AttrList] class
module gid.pango1.attr_list;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.pango1.attr_iterator;
import gid.pango1.attribute;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/**
    A [gid.pango1.attr_list.AttrList] represents a list of attributes that apply to a section
    of text.
    
    The attributes in a [gid.pango1.attr_list.AttrList] are, in general, allowed to overlap in
    an arbitrary fashion. However, if the attributes are manipulated only through
    [gid.pango1.attr_list.AttrList.change], the overlap between properties will meet
    stricter criteria.
    
    Since the [gid.pango1.attr_list.AttrList] structure is stored as a linear list, it is not
    suitable for storing attributes for large amounts of text. In general, you
    should not use a single [gid.pango1.attr_list.AttrList] for more than one paragraph of text.
*/
class AttrList : gid.gobject2.boxed.BoxedWrap!(pango_attr_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override AttrList self() nothrow
  {
    return this;
  }

  /**
      Create a new empty attribute list with a reference
      count of one.
      Returns: the newly allocated
          [gid.pango1.attr_list.AttrList], which should be freed with
          [gid.pango1.attr_list.AttrList.unref]
  */
  this() nothrow
  {
    PangoAttrList* _cretval;
    _cretval = pango_attr_list_new();
    this(_cretval, Yes.Take);
  }

  /**
      Insert the given attribute into the [gid.pango1.attr_list.AttrList].
      
      It will replace any attributes of the same type
      on that segment and be merged with any adjoining
      attributes that are identical.
      
      This function is slower than [gid.pango1.attr_list.AttrList.insert]
      for creating an attribute list in order (potentially
      much slower for large lists). However,
      [gid.pango1.attr_list.AttrList.insert] is not suitable for
      continually changing a set of attributes since it
      never removes or combines existing attributes.
  
      Params:
        attr = the attribute to insert
  */
  void change(gid.pango1.attribute.Attribute attr) nothrow
  {
    pango_attr_list_change(cast(PangoAttrList*)this._cPtr, attr ? cast(PangoAttribute*)attr._cPtr(Yes.Dup) : null);
  }

  /**
      Copy list and return an identical new list.
      Returns: the newly allocated
          [gid.pango1.attr_list.AttrList], with a reference count of one,
          which should be freed with [gid.pango1.attr_list.AttrList.unref].
          Returns null if list was null.
  */
  gid.pango1.attr_list.AttrList copy() nothrow
  {
    PangoAttrList* _cretval;
    _cretval = pango_attr_list_copy(cast(PangoAttrList*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.attr_list.AttrList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether list and other_list contain the same
      attributes and whether those attributes apply to the
      same ranges.
      
      Beware that this will return wrong values if any list
      contains duplicates.
  
      Params:
        otherList = the other [gid.pango1.attr_list.AttrList]
      Returns: true if the lists are equal, false if
          they aren't
  */
  bool equal(gid.pango1.attr_list.AttrList otherList) nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_attr_list_equal(cast(PangoAttrList*)this._cPtr, otherList ? cast(PangoAttrList*)otherList._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Given a [gid.pango1.attr_list.AttrList] and callback function, removes
      any elements of list for which func returns true and
      inserts them into a new list.
  
      Params:
        func = callback function;
            returns true if an attribute should be filtered out
      Returns: the new
          [gid.pango1.attr_list.AttrList] or null if no attributes of the
          given types were found
  */
  gid.pango1.attr_list.AttrList filter(gid.pango1.types.AttrFilterFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(PangoAttribute* attribute, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.pango1.types.AttrFilterFunc*)userData;
      auto _attribute = attribute ? new gid.pango1.attribute.Attribute(cast(void*)attribute, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(_attribute);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.pango1.types.AttrFilterFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_attribute)
        _attribute._cUnborrow;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    PangoAttrList* _cretval;
    auto _func = func ? cast(void*)&(func) : null;
    _cretval = pango_attr_list_filter(cast(PangoAttrList*)this._cPtr, _funcCB, _func);
    auto _retval = _cretval ? new gid.pango1.attr_list.AttrList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a list of all attributes in list.
      Returns: a list of all attributes in list. To free this value,
          call [gid.pango1.attribute.Attribute.destroy] on each value and
          [gid.glib2.slist.SList.free] on the list.
  */
  gid.pango1.attribute.Attribute[] getAttributes() nothrow
  {
    GSList* _cretval;
    _cretval = pango_attr_list_get_attributes(cast(PangoAttrList*)this._cPtr);
    auto _retval = gSListToD!(gid.pango1.attribute.Attribute, GidOwnership.Full)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Create a iterator initialized to the beginning of the list.
      
      list must not be modified until this iterator is freed.
      Returns: the newly allocated
          [gid.pango1.attr_iterator.AttrIterator], which should be freed with
          [gid.pango1.attr_iterator.AttrIterator.destroy]
  */
  gid.pango1.attr_iterator.AttrIterator getIterator() nothrow
  {
    PangoAttrIterator* _cretval;
    _cretval = pango_attr_list_get_iterator(cast(PangoAttrList*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.attr_iterator.AttrIterator(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Insert the given attribute into the [gid.pango1.attr_list.AttrList].
      
      It will be inserted after all other attributes with a
      matching start_index.
  
      Params:
        attr = the attribute to insert
  */
  void insert(gid.pango1.attribute.Attribute attr) nothrow
  {
    pango_attr_list_insert(cast(PangoAttrList*)this._cPtr, attr ? cast(PangoAttribute*)attr._cPtr(Yes.Dup) : null);
  }

  /**
      Insert the given attribute into the [gid.pango1.attr_list.AttrList].
      
      It will be inserted before all other attributes with a
      matching start_index.
  
      Params:
        attr = the attribute to insert
  */
  void insertBefore(gid.pango1.attribute.Attribute attr) nothrow
  {
    pango_attr_list_insert_before(cast(PangoAttrList*)this._cPtr, attr ? cast(PangoAttribute*)attr._cPtr(Yes.Dup) : null);
  }

  /**
      This function opens up a hole in list, fills it
      in with attributes from the left, and then merges
      other on top of the hole.
      
      This operation is equivalent to stretching every attribute
      that applies at position pos in list by an amount len,
      and then calling [gid.pango1.attr_list.AttrList.change] with a copy
      of each attribute in other in sequence (offset in position
      by pos, and limited in length to len).
      
      This operation proves useful for, for instance, inserting
      a pre-edit string in the middle of an edit buffer.
      
      For backwards compatibility, the function behaves differently
      when len is 0. In this case, the attributes from other are
      not imited to len, and are just overlayed on top of list.
      
      This mode is useful for merging two lists of attributes together.
  
      Params:
        other = another [gid.pango1.attr_list.AttrList]
        pos = the position in list at which to insert other
        len = the length of the spliced segment. (Note that this
            must be specified since the attributes in other may only
            be present at some subsection of this range)
  */
  void splice(gid.pango1.attr_list.AttrList other, int pos, int len) nothrow
  {
    pango_attr_list_splice(cast(PangoAttrList*)this._cPtr, other ? cast(PangoAttrList*)other._cPtr(No.Dup) : null, pos, len);
  }

  /**
      Serializes a [gid.pango1.attr_list.AttrList] to a string.
      
      In the resulting string, serialized attributes are separated by newlines or commas.
      Individual attributes are serialized to a string of the form
      
          [START END] TYPE VALUE
      
      Where START and END are the indices (with -1 being accepted in place
      of MAXUINT), TYPE is the nickname of the attribute value type, e.g.
      _weight_ or _stretch_, and the value is serialized according to its type:
      
      Optionally, START and END can be omitted to indicate unlimited extent.
      
      - enum values as nick or numeric value
      - boolean values as _true_ or _false_
      - integers and floats as numbers
      - strings as string, optionally quoted
      - font features as quoted string
      - PangoLanguage as string
      - PangoFontDescription as serialized by [gid.pango1.font_description.FontDescription.toString_], quoted
      - PangoColor as serialized by [gid.pango1.color.Color.toString_]
      
      Examples:
      
          0 10 foreground red, 5 15 weight bold, 0 200 font-desc "Sans 10"
      
          0 -1 weight 700
          0 100 family Times
      
          weight bold
      
      To parse the returned value, use [gid.pango1.attr_list.AttrList.fromString].
      
      Note that shape attributes can not be serialized.
      Returns: a newly allocated string
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = pango_attr_list_to_string(cast(PangoAttrList*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Update indices of attributes in list for a change in the
      text they refer to.
      
      The change that this function applies is removing remove
      bytes at position pos and inserting add bytes instead.
      
      Attributes that fall entirely in the (pos, pos + remove)
      range are removed.
      
      Attributes that start or end inside the (pos, pos + remove)
      range are shortened to reflect the removal.
      
      Attributes start and end positions are updated if they are
      behind pos + remove.
  
      Params:
        pos = the position of the change
        remove = the number of removed bytes
        add = the number of added bytes
  */
  void update(int pos, int remove, int add) nothrow
  {
    pango_attr_list_update(cast(PangoAttrList*)this._cPtr, pos, remove, add);
  }

  /**
      Deserializes a [gid.pango1.attr_list.AttrList] from a string.
      
      This is the counterpart to [gid.pango1.attr_list.AttrList.toString_].
      See that functions for details about the format.
  
      Params:
        text = a string
      Returns: a new [gid.pango1.attr_list.AttrList]
  */
  static gid.pango1.attr_list.AttrList fromString(string text) nothrow
  {
    PangoAttrList* _cretval;
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _cretval = pango_attr_list_from_string(_text);
    auto _retval = _cretval ? new gid.pango1.attr_list.AttrList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
