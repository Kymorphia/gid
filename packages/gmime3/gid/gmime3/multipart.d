/// Module for [Multipart] class
module gid.gmime3.multipart;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.object;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A base MIME multipart object.
*/
class Multipart : gid.gmime3.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_multipart_get_type != &gidSymbolNotFound ? g_mime_multipart_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeMultipart";
  }

  /** Returns `this`, for use in `with` statements. */
  override Multipart self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.multipart.Multipart]
      Returns: New builder object
  */
  static MultipartGidBuilder builder() nothrow
  {
    return new MultipartGidBuilder;
  }

  /**
      Creates a new MIME multipart object with a default content-type of
      multipart/mixed.
      Returns: an empty MIME multipart object with a default content-type of
        multipart/mixed.
  */
  this() nothrow
  {
    GMimeMultipart* _cretval;
    _cretval = g_mime_multipart_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new MIME multipart object with a content-type of
      multipart/subtype.
  
      Params:
        subtype = content-type subtype
      Returns: an empty MIME multipart object with a content-type of
        multipart/subtype.
  */
  static gid.gmime3.multipart.Multipart newWithSubtype(string subtype) nothrow
  {
    GMimeMultipart* _cretval;
    const(char)* _subtype = subtype.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_multipart_new_with_subtype(_subtype);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.multipart.Multipart)(cast(GMimeMultipart*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends a mime part to multipart.
  
      Params:
        part = a #GMimeObject
  */
  void add(gid.gmime3.object.ObjectWrap part) nothrow
  {
    g_mime_multipart_add(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
  }

  /**
      Removes all subparts from multipart.
  */
  void clear() nothrow
  {
    g_mime_multipart_clear(cast(GMimeMultipart*)this._cPtr);
  }

  /**
      Checks if part is contained within multipart.
  
      Params:
        part = a #GMimeObject
      Returns: true if part is a subpart of multipart or false
        otherwise.
  */
  bool contains(gid.gmime3.object.ObjectWrap part) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_multipart_contains(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Recursively calls callback on each of multipart's subparts.
  
      Params:
        callback = function to call for each of multipart's
            subparts.
  */
  void foreach_(gid.gmime3.types.ObjectForeachFunc callback) nothrow
  {
    extern(C) void _callbackCallback(GMimeObject* parent, GMimeObject* part, void* userData) nothrow
    {
      auto _dlg = cast(gid.gmime3.types.ObjectForeachFunc*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)parent, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)part, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gmime3.types.ObjectForeachFunc");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? cast(void*)&(callback) : null;
    g_mime_multipart_foreach(cast(GMimeMultipart*)this._cPtr, _callbackCB, _callback);
  }

  /**
      Gets the boundary on the multipart. If the internal boundary is
      null, then an auto-generated boundary will be set on the multipart
      and returned.
      Returns: the boundary on the multipart.
  */
  string getBoundary() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_multipart_get_boundary(cast(GMimeMultipart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of parts contained within multipart.
      Returns: the number of parts contained within multipart.
  */
  int getCount() nothrow
  {
    int _retval;
    _retval = g_mime_multipart_get_count(cast(GMimeMultipart*)this._cPtr);
    return _retval;
  }

  /**
      Gets the epilogue on the multipart.
      Returns: a pointer to the epilogue string on the multipart.
  */
  string getEpilogue() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_multipart_get_epilogue(cast(GMimeMultipart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the part at the specified index within the multipart.
  
      Params:
        index = the 0-based index of the part
      Returns: the part at position index.
  */
  gid.gmime3.object.ObjectWrap getPart(int index) nothrow
  {
    GMimeObject* _cretval;
    _cretval = g_mime_multipart_get_part(cast(GMimeMultipart*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the prologue on the multipart.
      Returns: a pointer to the prologue string on the multipart.
  */
  string getPrologue() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_multipart_get_prologue(cast(GMimeMultipart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the mime part with the content-id content_id from the
      multipart multipart.
  
      Params:
        contentId = the content id of the part to look for
      Returns: the #GMimeObject whose content-id matches
        the search string, or null if a match cannot be found.
  */
  gid.gmime3.object.ObjectWrap getSubpartFromContentId(string contentId) nothrow
  {
    GMimeObject* _cretval;
    const(char)* _contentId = contentId.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_multipart_get_subpart_from_content_id(cast(GMimeMultipart*)this._cPtr, _contentId);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the 0-based index of part within multipart.
  
      Params:
        part = a #GMimeObject
      Returns: the 0-based index of part within multipart or %-1 if not found.
  */
  int indexOf(gid.gmime3.object.ObjectWrap part) nothrow
  {
    int _retval;
    _retval = g_mime_multipart_index_of(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Inserts part into multipart at the specified index.
  
      Params:
        index = the 0-based index to insert the part
        part = a #GMimeObject
  */
  void insert(int index, gid.gmime3.object.ObjectWrap part) nothrow
  {
    g_mime_multipart_insert(cast(GMimeMultipart*)this._cPtr, index, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
  }

  /**
      Removes the specified part from multipart.
  
      Params:
        part = a #GMimeObject
      Returns: true if the part was removed or false otherwise.
  */
  bool remove(gid.gmime3.object.ObjectWrap part) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_multipart_remove(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes the part at the specified index from multipart.
  
      Params:
        index = the 0-based index of the part to remove
      Returns: the mime part that was removed or null
        if the part was not contained within the multipart.
  */
  gid.gmime3.object.ObjectWrap removeAt(int index) nothrow
  {
    GMimeObject* _cretval;
    _cretval = g_mime_multipart_remove_at(cast(GMimeMultipart*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Replaces the part at the specified index within multipart with
      replacement.
  
      Params:
        index = the 0-based index of the part to replace
        replacement = a #GMimeObject to use as the replacement
      Returns: the part that was replaced or null
        if the part was not contained within the multipart.
  */
  gid.gmime3.object.ObjectWrap replace(int index, gid.gmime3.object.ObjectWrap replacement) nothrow
  {
    GMimeObject* _cretval;
    _cretval = g_mime_multipart_replace(cast(GMimeMultipart*)this._cPtr, index, replacement ? cast(GMimeObject*)replacement._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets boundary as the boundary on the multipart. If boundary is
      null, then a boundary will be auto-generated for you.
  
      Params:
        boundary = boundary or null to autogenerate one
  */
  void setBoundary(string boundary) nothrow
  {
    const(char)* _boundary = boundary.toCString!(No.Malloc, No.Nullable);
    g_mime_multipart_set_boundary(cast(GMimeMultipart*)this._cPtr, _boundary);
  }

  /**
      Sets the epilogue on the multipart.
  
      Params:
        epilogue = epilogue
  */
  void setEpilogue(string epilogue) nothrow
  {
    const(char)* _epilogue = epilogue.toCString!(No.Malloc, No.Nullable);
    g_mime_multipart_set_epilogue(cast(GMimeMultipart*)this._cPtr, _epilogue);
  }

  /**
      Sets the prologue on the multipart.
  
      Params:
        prologue = prologue
  */
  void setPrologue(string prologue) nothrow
  {
    const(char)* _prologue = prologue.toCString!(No.Malloc, No.Nullable);
    g_mime_multipart_set_prologue(cast(GMimeMultipart*)this._cPtr, _prologue);
  }
}

/// Fluent builder implementation template for [gid.gmime3.multipart.Multipart]
class MultipartGidBuilderImpl(T) : gid.gmime3.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.multipart.Multipart]
final class MultipartGidBuilder : MultipartGidBuilderImpl!MultipartGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Multipart build() nothrow
  {
    return new Multipart(cast(void*)createGObject(Multipart._getGType), Yes.Take);
  }
}
