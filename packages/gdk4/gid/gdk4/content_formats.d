/// Module for [ContentFormats] class
module gid.gdk4.content_formats;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.c.functions;
import gid.gdk4.c.types;
import gid.gdk4.types;
import gid.glib2.string_;
import gid.gobject2.boxed;
import gid.gobject2.types;

/**
    Used to advertise and negotiate the format of content.
    
    You will encounter [gid.gdk4.content_formats.ContentFormats] when interacting with objects
    controlling operations that pass data between different widgets, window
    or application, like [gid.gdk4.drag.Drag], [gid.gdk4.drop.Drop],
    [gid.gdk4.clipboard.Clipboard] or [gid.gdk4.content_provider.ContentProvider].
    
    GDK supports content in 2 forms: `GType` and mime type.
    Using `GTypes` is meant only for in-process content transfers. Mime types
    are meant to be used for data passing both in-process and out-of-process.
    The details of how data is passed is described in the documentation of
    the actual implementations. To transform between the two forms,
    [gid.gdk4.content_serializer.ContentSerializer] and [gid.gdk4.content_deserializer.ContentDeserializer] are used.
    
    A [gid.gdk4.content_formats.ContentFormats] describes a set of possible formats content can be
    exchanged in. It is assumed that this set is ordered. `GTypes` are more
    important than mime types. Order between different `GTypes` or mime types
    is the order they were added in, most important first. Functions that
    care about order, such as [gid.gdk4.content_formats.ContentFormats.union_], will describe
    in their documentation how they interpret that order, though in general the
    order of the first argument is considered the primary order of the result,
    followed by the order of further arguments.
    
    For debugging purposes, the function [gid.gdk4.content_formats.ContentFormats.toString_]
    exists. It will print a comma-separated list of formats from most important
    to least important.
    
    [gid.gdk4.content_formats.ContentFormats] is an immutable struct. After creation, you cannot change
    the types it represents. Instead, new [gid.gdk4.content_formats.ContentFormats] have to be created.
    The [gid.gdk4.content_formats_builder.ContentFormatsBuilder] structure is meant to help in this
    endeavor.
*/
class ContentFormats : gid.gobject2.boxed.BoxedWrap!(gdk_content_formats_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentFormats self() nothrow
  {
    return this;
  }

  /**
      Creates a new [gid.gdk4.content_formats.ContentFormats] from an array of mime types.
      
      The mime types must be valid and different from each other or the
      behavior of the return value is undefined. If you cannot guarantee
      this, use [gid.gdk4.content_formats_builder.ContentFormatsBuilder] instead.
  
      Params:
        mimeTypes = Pointer to an
            array of mime types
      Returns: the new [gid.gdk4.content_formats.ContentFormats].
  */
  this(string[] mimeTypes = null) nothrow
  {
    GdkContentFormats* _cretval;
    uint _nMimeTypes;
    if (mimeTypes)
      _nMimeTypes = cast(uint)mimeTypes.length;

    auto _mimeTypes_arr = new char*[](mimeTypes.length);
    auto _mimeTypes = cast(char**)_mimeTypes_arr.ptr;
    foreach (i, s; mimeTypes) _mimeTypes[i] = s.toCString!(No.Malloc);
    _cretval = gdk_content_formats_new(_mimeTypes, _nMimeTypes);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new [gid.gdk4.content_formats.ContentFormats] for a given `GType`.
  
      Params:
        type = a `GType`
      Returns: a new [gid.gdk4.content_formats.ContentFormats]
  */
  static gid.gdk4.content_formats.ContentFormats newForGtype(gid.gobject2.types.GType type) nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_new_for_gtype(type);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if a given `GType` is part of the given formats.
  
      Params:
        type = the `GType` to search for
      Returns: true if the `GType` was found
  */
  bool containGtype(gid.gobject2.types.GType type) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_content_formats_contain_gtype(cast(const(GdkContentFormats)*)this._cPtr, type);
    return _retval;
  }

  /**
      Checks if a given mime type is part of the given formats.
  
      Params:
        mimeType = the mime type to search for
      Returns: true if the mime_type was found
  */
  bool containMimeType(string mimeType) nothrow
  {
    bool _retval;
    const(char)* _mimeType = mimeType.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gdk_content_formats_contain_mime_type(cast(const(GdkContentFormats)*)this._cPtr, _mimeType);
    return _retval;
  }

  /**
      Gets the `GType`s included in formats.
      
      Note that formats may not contain any `GType`s, in particular when
      they are empty. In that case null will be returned.
      Returns: `G_TYPE_INVALID`-terminated array of types included in formats
  */
  gid.gobject2.types.GType[] getGtypes() nothrow
  {
    const(GType)* _cretval;
    size_t _cretlength;
    _cretval = gdk_content_formats_get_gtypes(cast(const(GdkContentFormats)*)this._cPtr, &_cretlength);
    gid.gobject2.types.GType[] _retval;

    if (_cretval)
    {
      _retval = cast(gid.gobject2.types.GType[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Gets the mime types included in formats.
      
      Note that formats may not contain any mime types, in particular
      when they are empty. In that case null will be returned.
      Returns: null-terminated array of interned strings of mime types included
          in formats
  */
  string[] getMimeTypes() nothrow
  {
    const(char*)* _cretval;
    size_t _cretlength;
    _cretval = gdk_content_formats_get_mime_types(cast(const(GdkContentFormats)*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(No.Free);
    }
    return _retval;
  }

  /**
      Returns whether the content formats contain any formats.
      Returns: true if formats contains no mime types and no GTypes
  */
  bool isEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_content_formats_is_empty(cast(GdkContentFormats*)this._cPtr);
    return _retval;
  }

  /**
      Checks if first and second have any matching formats.
  
      Params:
        second = the [gid.gdk4.content_formats.ContentFormats] to intersect with
      Returns: true if a matching format was found.
  */
  bool match(gid.gdk4.content_formats.ContentFormats second) nothrow
  {
    bool _retval;
    _retval = cast(bool)gdk_content_formats_match(cast(const(GdkContentFormats)*)this._cPtr, second ? cast(const(GdkContentFormats)*)second._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Finds the first `GType` from first that is also contained
      in second.
      
      If no matching `GType` is found, `G_TYPE_INVALID` is returned.
  
      Params:
        second = the [gid.gdk4.content_formats.ContentFormats] to intersect with
      Returns: The first common `GType` or `G_TYPE_INVALID` if none.
  */
  gid.gobject2.types.GType matchGtype(gid.gdk4.content_formats.ContentFormats second) nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = gdk_content_formats_match_gtype(cast(const(GdkContentFormats)*)this._cPtr, second ? cast(const(GdkContentFormats)*)second._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Finds the first mime type from first that is also contained
      in second.
      
      If no matching mime type is found, null is returned.
  
      Params:
        second = the [gid.gdk4.content_formats.ContentFormats] to intersect with
      Returns: The first common mime type or null if none
  */
  string matchMimeType(gid.gdk4.content_formats.ContentFormats second) nothrow
  {
    const(char)* _cretval;
    _cretval = gdk_content_formats_match_mime_type(cast(const(GdkContentFormats)*)this._cPtr, second ? cast(const(GdkContentFormats)*)second._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Prints the given formats into a string for human consumption.
      
      The result of this function can later be parsed with
      [gid.gdk4.content_formats.ContentFormats.parse].
  
      Params:
        string_ = a [gid.glib2.string_.String] to print into
  */
  void print(gid.glib2.string_.String string_) nothrow
  {
    gdk_content_formats_print(cast(GdkContentFormats*)this._cPtr, string_ ? cast(GString*)string_._cPtr(No.Dup) : null);
  }

  /**
      Prints the given formats into a human-readable string.
      
      The resulting string can be parsed with [gid.gdk4.content_formats.ContentFormats.parse].
      
      This is a small wrapper around [gid.gdk4.content_formats.ContentFormats.print]
      to help when debugging.
      Returns: a new string
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gdk_content_formats_to_string(cast(GdkContentFormats*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Append all missing types from second to first, in the order
      they had in second.
  
      Params:
        second = the [gid.gdk4.content_formats.ContentFormats] to merge from
      Returns: a new [gid.gdk4.content_formats.ContentFormats]
  */
  gid.gdk4.content_formats.ContentFormats union_(gid.gdk4.content_formats.ContentFormats second) nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union(cast(GdkContentFormats*)this._cPtr(Yes.Dup), second ? cast(const(GdkContentFormats)*)second._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Add GTypes for mime types in formats for which deserializers are
      registered.
      Returns: a new [gid.gdk4.content_formats.ContentFormats]
  */
  gid.gdk4.content_formats.ContentFormats unionDeserializeGtypes() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_deserialize_gtypes(cast(GdkContentFormats*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Add mime types for GTypes in formats for which deserializers are
      registered.
      Returns: a new [gid.gdk4.content_formats.ContentFormats]
  */
  gid.gdk4.content_formats.ContentFormats unionDeserializeMimeTypes() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_deserialize_mime_types(cast(GdkContentFormats*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Add GTypes for the mime types in formats for which serializers are
      registered.
      Returns: a new [gid.gdk4.content_formats.ContentFormats]
  */
  gid.gdk4.content_formats.ContentFormats unionSerializeGtypes() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_serialize_gtypes(cast(GdkContentFormats*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Add mime types for GTypes in formats for which serializers are
      registered.
      Returns: a new [gid.gdk4.content_formats.ContentFormats]
  */
  gid.gdk4.content_formats.ContentFormats unionSerializeMimeTypes() nothrow
  {
    GdkContentFormats* _cretval;
    _cretval = gdk_content_formats_union_serialize_mime_types(cast(GdkContentFormats*)this._cPtr(Yes.Dup));
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parses the given string into [gid.gdk4.content_formats.ContentFormats] and
      returns the formats.
      
      Strings printed via [gid.gdk4.content_formats.ContentFormats.toString_]
      can be read in again successfully using this function.
      
      If string does not describe valid content formats, null
      is returned.
  
      Params:
        string_ = the string to parse
      Returns: the content formats if string is valid
  */
  static gid.gdk4.content_formats.ContentFormats parse(string string_) nothrow
  {
    GdkContentFormats* _cretval;
    const(char)* _string_ = string_.toCString!(No.Malloc, No.Nullable);
    _cretval = gdk_content_formats_parse(_string_);
    auto _retval = _cretval ? new gid.gdk4.content_formats.ContentFormats(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
