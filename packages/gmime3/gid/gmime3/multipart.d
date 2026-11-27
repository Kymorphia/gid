/// Module for [Multipart] class
module gid.gmime3.multipart;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.object;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A base MIME multipart object.
*/
@gidGir("Multipart", "MultipartClass")
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeMultipart* _cretval;
      _cretval = g_mime_multipart_new();
      this(_cretval, Yes.Take);
    }
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAdd` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncAdd(gid.gmime3.object.ObjectWrap part)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.add)
      return;

    _klass.add(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
  }

  /**
      Removes all subparts from multipart.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncClear` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncClear()
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.clear)
      return;

    _klass.clear(cast(GMimeMultipart*)this._cPtr);
  }

  /**
      Checks if part is contained within multipart.
  
      Params:
        part = a #GMimeObject
      Returns: true if part is a subpart of multipart or false
        otherwise.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncContains` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncContains(gid.gmime3.object.ObjectWrap part)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.contains)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.contains(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the boundary on the multipart. If the internal boundary is
      null, then an auto-generated boundary will be set on the multipart
      and returned.
      Returns: the boundary on the multipart.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetBoundary` to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  protected string vfuncGetBoundary()
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.getBoundary)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getBoundary(cast(GMimeMultipart*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the number of parts contained within multipart.
      Returns: the number of parts contained within multipart.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetCount` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncGetCount()
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.getCount)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getCount(cast(GMimeMultipart*)this._cPtr);
    return _retval;
  }

  /**
      Gets the part at the specified index within the multipart.
  
      Params:
        index = the 0-based index of the part
      Returns: the part at position index.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPart` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gmime3.object.ObjectWrap vfuncGetPart(int index)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.getPart)
      return typeof(return).init;

    GMimeObject* _cretval;
    _cretval = _klass.getPart(cast(GMimeMultipart*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the 0-based index of part within multipart.
  
      Params:
        part = a #GMimeObject
      Returns: the 0-based index of part within multipart or %-1 if not found.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIndexOf` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncIndexOf(gid.gmime3.object.ObjectWrap part)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.indexOf)
      return typeof(return).init;

    int _retval;
    _retval = _klass.indexOf(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Inserts part into multipart at the specified index.
  
      Params:
        index = the 0-based index to insert the part
        part = a #GMimeObject
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInsert` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncInsert(int index, gid.gmime3.object.ObjectWrap part)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.insert)
      return;

    _klass.insert(cast(GMimeMultipart*)this._cPtr, index, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
  }

  /**
      Removes the specified part from multipart.
  
      Params:
        part = a #GMimeObject
      Returns: true if the part was removed or false otherwise.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRemove` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncRemove(gid.gmime3.object.ObjectWrap part)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.remove)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.remove(cast(GMimeMultipart*)this._cPtr, part ? cast(GMimeObject*)part._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes the part at the specified index from multipart.
  
      Params:
        index = the 0-based index of the part to remove
      Returns: the mime part that was removed or null
        if the part was not contained within the multipart.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRemoveAt` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gmime3.object.ObjectWrap vfuncRemoveAt(int index)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.removeAt)
      return typeof(return).init;

    GMimeObject* _cretval;
    _cretval = _klass.removeAt(cast(GMimeMultipart*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets boundary as the boundary on the multipart. If boundary is
      null, then a boundary will be auto-generated for you.
  
      Params:
        boundary = boundary or null to autogenerate one
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetBoundary` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSetBoundary(string boundary)
  {
    auto _klass = cast(GMimeMultipartClass*)_vfuncClass;
    if (!_klass.setBoundary)
      return;

    const(char)* _boundary = boundary.toCString!(No.Malloc, No.Nullable);
    _klass.setBoundary(cast(GMimeMultipart*)this._cPtr, _boundary);
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
      gidAttachThread();
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

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Multipart
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gmime3.multipart.Multipart), T.stringof ~ " is not derived from gid.gmime3.multipart.Multipart");

    gid.gmime3.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAdd", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "add");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncClear", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "clear");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncContains", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "contains");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetBoundary", true)[0]) == gid.gmime3.multipart.Multipart))
      static assert(0, "Overriding gid.gmime3.multipart.Multipart.vfuncGetBoundary is not supported: callback string return value with transfer none is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetCount", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "get_count");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPart", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "get_part");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIndexOf", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "index_of");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInsert", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "insert");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRemove", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "remove");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRemoveAt", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "remove_at");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetBoundary", true)[0]) == gid.gmime3.multipart.Multipart))
      _installVfunc(klass, "set_boundary");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMimeMultipartClass*)klass;

    switch (vfunc)
    {
      case "add":
      {
        static extern(C) void _vfuncAddTramp(GMimeMultipart* multipart, GMimeObject* part) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.add)
              return (cast(typeof(&_vfuncAddTramp))_klass.add)(multipart, part);
            return;
          }

          try
          {
            _obj.vfuncAdd(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)part, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncAdd");
          }
        }

        _klass.add = cast(typeof(_klass.add))&_vfuncAddTramp;
        break;
      }
      case "clear":
      {
        static extern(C) void _vfuncClearTramp(GMimeMultipart* multipart) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.clear)
              return (cast(typeof(&_vfuncClearTramp))_klass.clear)(multipart);
            return;
          }

          try
          {
            _obj.vfuncClear();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncClear");
          }
        }

        _klass.clear = cast(typeof(_klass.clear))&_vfuncClearTramp;
        break;
      }
      case "contains":
      {
        static extern(C) gboolean _vfuncContainsTramp(GMimeMultipart* multipart, GMimeObject* part) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.contains)
              return (cast(typeof(&_vfuncContainsTramp))_klass.contains)(multipart, part);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncContains(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)part, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncContains");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.contains = cast(typeof(_klass.contains))&_vfuncContainsTramp;
        break;
      }
      case "get_count":
      {
        static extern(C) int _vfuncGetCountTramp(GMimeMultipart* multipart) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.getCount)
              return (cast(typeof(&_vfuncGetCountTramp))_klass.getCount)(multipart);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetCount();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncGetCount");
          }
          return _retval;
        }

        _klass.getCount = cast(typeof(_klass.getCount))&_vfuncGetCountTramp;
        break;
      }
      case "get_part":
      {
        static extern(C) GMimeObject* _vfuncGetPartTramp(GMimeMultipart* multipart, int index) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.getPart)
              return (cast(typeof(&_vfuncGetPartTramp))_klass.getPart)(multipart, index);
            return typeof(return).init;
          }

          gid.gmime3.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetPart(index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncGetPart");
          }
          auto _retval = _dretval ? cast(GMimeObject*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getPart = cast(typeof(_klass.getPart))&_vfuncGetPartTramp;
        break;
      }
      case "index_of":
      {
        static extern(C) int _vfuncIndexOfTramp(GMimeMultipart* multipart, GMimeObject* part) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.indexOf)
              return (cast(typeof(&_vfuncIndexOfTramp))_klass.indexOf)(multipart, part);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncIndexOf(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)part, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncIndexOf");
          }
          return _retval;
        }

        _klass.indexOf = cast(typeof(_klass.indexOf))&_vfuncIndexOfTramp;
        break;
      }
      case "insert":
      {
        static extern(C) void _vfuncInsertTramp(GMimeMultipart* multipart, int index, GMimeObject* part) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.insert)
              return (cast(typeof(&_vfuncInsertTramp))_klass.insert)(multipart, index, part);
            return;
          }

          try
          {
            _obj.vfuncInsert(index, gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)part, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncInsert");
          }
        }

        _klass.insert = cast(typeof(_klass.insert))&_vfuncInsertTramp;
        break;
      }
      case "remove":
      {
        static extern(C) gboolean _vfuncRemoveTramp(GMimeMultipart* multipart, GMimeObject* part) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.remove)
              return (cast(typeof(&_vfuncRemoveTramp))_klass.remove)(multipart, part);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRemove(gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(void*)part, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncRemove");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.remove = cast(typeof(_klass.remove))&_vfuncRemoveTramp;
        break;
      }
      case "remove_at":
      {
        static extern(C) GMimeObject* _vfuncRemoveAtTramp(GMimeMultipart* multipart, int index) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.removeAt)
              return (cast(typeof(&_vfuncRemoveAtTramp))_klass.removeAt)(multipart, index);
            return typeof(return).init;
          }

          gid.gmime3.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncRemoveAt(index);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncRemoveAt");
          }
          auto _retval = _dretval ? cast(GMimeObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.removeAt = cast(typeof(_klass.removeAt))&_vfuncRemoveAtTramp;
        break;
      }
      case "set_boundary":
      {
        static extern(C) void _vfuncSetBoundaryTramp(GMimeMultipart* multipart, const(char)* boundary) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gmime3.multipart.Multipart)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)multipart);
          if (!_obj)
          {
            auto _klass = cast(GMimeMultipartClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)multipart);
            if (_klass.setBoundary)
              return (cast(typeof(&_vfuncSetBoundaryTramp))_klass.setBoundary)(multipart, boundary);
            return;
          }

          string _boundary = boundary.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetBoundary(_boundary);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gmime3.multipart.Multipart.vfuncSetBoundary");
          }
        }

        _klass.setBoundary = cast(typeof(_klass.setBoundary))&_vfuncSetBoundaryTramp;
        break;
      }
      default:
      break;
    }
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
