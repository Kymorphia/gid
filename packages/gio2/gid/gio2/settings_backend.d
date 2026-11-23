/// Module for [SettingsBackend] class
module gid.gio2.settings_backend;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.variant;
import gid.glib2.variant_type;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    The [gid.gio2.settings_backend.SettingsBackend] interface defines a generic interface for
    non-strictly-typed data that is stored in a hierarchy. To implement
    an alternative storage backend for [gid.gio2.settings.Settings], you need to
    implement the [gid.gio2.settings_backend.SettingsBackend] interface and then make it implement the
    extension point [gid.gio2.types.SETTINGS_BACKEND_EXTENSION_POINT_NAME].
    
    The interface defines methods for reading and writing values, a
    method for determining if writing of certain values will fail
    (lockdown) and a change notification mechanism.
    
    The semantics of the interface are very precisely defined and
    implementations must carefully adhere to the expectations of
    callers that are documented on each of the interface methods.
    
    Some of the [gid.gio2.settings_backend.SettingsBackend] functions accept or return a
    [gid.glib2.tree.Tree]. These trees always have strings as keys and
    [gid.glib2.variant.Variant] as values.
    
    The [gid.gio2.settings_backend.SettingsBackend] API is exported to allow third-party
    implementations, but does not carry the same stability guarantees
    as the public GIO API. For this reason, you have to define the
    C preprocessor symbol `G_SETTINGS_ENABLE_BACKEND` before including
    `gio/gsettingsbackend.h`.
*/
class SettingsBackend : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_settings_backend_get_type != &gidSymbolNotFound ? g_settings_backend_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSettingsBackend";
  }

  /** Returns `this`, for use in `with` statements. */
  override SettingsBackend self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.settings_backend.SettingsBackend]
      Returns: New builder object
  */
  static SettingsBackendGidBuilder builder() nothrow
  {
    return new SettingsBackendGidBuilder;
  }

  /**
      Returns the default #GSettingsBackend. It is possible to override
      the default by setting the `GSETTINGS_BACKEND` environment variable
      to the name of a settings backend.
      
      The user gets a reference to the backend.
      Returns: the default #GSettingsBackend,
            which will be a dummy (memory) settings backend if no other settings
            backend is available.
  */
  static gid.gio2.settings_backend.SettingsBackend getDefault() nothrow
  {
    GSettingsBackend* _cretval;
    _cretval = g_settings_backend_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.settings_backend.SettingsBackend)(cast(GSettingsBackend*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      virtual method to get if a key is writable
  
      Params:
        key = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetWritable` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncGetWritable(string key)
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.getWritable)
      return typeof(return).init;

    bool _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.getWritable(cast(GSettingsBackend*)this._cPtr, _key);
    return _retval;
  }

  /**
      virtual method to read a key's value
  
      Params:
        key = 
        expectedType = 
        defaultValue = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRead` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant vfuncRead(string key, gid.glib2.variant_type.VariantType expectedType, bool defaultValue)
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.read)
      return typeof(return).init;

    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.read(cast(GSettingsBackend*)this._cPtr, _key, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null, defaultValue);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      virtual method to read user's key value
  
      Params:
        key = 
        expectedType = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReadUserValue` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant vfuncReadUserValue(string key, gid.glib2.variant_type.VariantType expectedType)
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.readUserValue)
      return typeof(return).init;

    GVariant* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.readUserValue(cast(GSettingsBackend*)this._cPtr, _key, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      virtual method to reset state
  
      Params:
        key = 
        originTag = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncReset(string key, void* originTag = null)
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.reset)
      return;

    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _klass.reset(cast(GSettingsBackend*)this._cPtr, _key, originTag);
  }

  /**
      virtual method to subscribe to key changes
  
      Params:
        name = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSubscribe` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSubscribe(string name)
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.subscribe)
      return;

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _klass.subscribe(cast(GSettingsBackend*)this._cPtr, _name);
  }

  /**
      virtual method to sync state
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSync` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSync()
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.sync)
      return;

    _klass.sync(cast(GSettingsBackend*)this._cPtr);
  }

  /**
      virtual method to unsubscribe to key changes
  
      Params:
        name = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnsubscribe` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUnsubscribe(string name)
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.unsubscribe)
      return;

    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _klass.unsubscribe(cast(GSettingsBackend*)this._cPtr, _name);
  }

  /**
      virtual method to change key's value
  
      Params:
        key = 
        value = 
        originTag = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncWrite` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncWrite(string key, gid.glib2.variant.Variant value, void* originTag = null)
  {
    auto _klass = cast(GSettingsBackendClass*)_vfuncClass;
    if (!_klass.write)
      return typeof(return).init;

    bool _retval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.write(cast(GSettingsBackend*)this._cPtr, _key, value ? cast(GVariant*)value._cPtr(No.Dup) : null, originTag);
    return _retval;
  }

  /**
      Signals that a single key has possibly changed.  Backend
      implementations should call this if a key has possibly changed its
      value.
      
      key must be a valid key (ie starting with a slash, not containing
      '//', and not ending with a slash).
      
      The implementation must call this function during any call to
      g_settings_backend_write(), before the call returns (except in the
      case that no keys are actually changed and it cares to detect this
      fact).  It may not rely on the existence of a mainloop for
      dispatching the signal later.
      
      The implementation may call this function at any other time it likes
      in response to other events (such as changes occurring outside of the
      program).  These calls may originate from a mainloop or may originate
      in response to any other action (including from calls to
      g_settings_backend_write()).
      
      In the case that this call is in response to a call to
      g_settings_backend_write() then origin_tag must be set to the same
      value that was passed to that call.
  
      Params:
        key = the name of the key
        originTag = the origin tag
  */
  void changed(string key, void* originTag = null) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    g_settings_backend_changed(cast(GSettingsBackend*)this._cPtr, _key, originTag);
  }

  /**
      Signals that a list of keys have possibly changed.  Backend
      implementations should call this if keys have possibly changed their
      values.
      
      path must be a valid path (ie starting and ending with a slash and
      not containing '//').  Each string in items must form a valid key
      name when path is prefixed to it (ie: each item must not start or
      end with '/' and must not contain '//').
      
      The meaning of this signal is that any of the key names resulting
      from the concatenation of path with each item in items may have
      changed.
      
      The same rules for when notifications must occur apply as per
      [gid.gio2.settings_backend.SettingsBackend.changed].  These two calls can be used
      interchangeably if exactly one item has changed (although in that
      case [gid.gio2.settings_backend.SettingsBackend.changed] is definitely preferred).
      
      For efficiency reasons, the implementation should strive for path to
      be as long as possible (ie: the longest common prefix of all of the
      keys that were changed) but this is not strictly required.
  
      Params:
        path = the path containing the changes
        items = the null-terminated list of changed keys
        originTag = the origin tag
  */
  void keysChanged(string path, string[] items, void* originTag = null) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    auto _items_arr = new char*[](items.length + 1);
    auto _items = cast(char**)_items_arr.ptr;
    foreach (i, s; items) _items[i] = s.toCString!(No.Malloc);
    g_settings_backend_keys_changed(cast(GSettingsBackend*)this._cPtr, _path, _items, originTag);
  }

  /**
      Signals that all keys below a given path may have possibly changed.
      Backend implementations should call this if an entire path of keys
      have possibly changed their values.
      
      path must be a valid path (ie starting and ending with a slash and
      not containing '//').
      
      The meaning of this signal is that any of the key which has a name
      starting with path may have changed.
      
      The same rules for when notifications must occur apply as per
      [gid.gio2.settings_backend.SettingsBackend.changed].  This call might be an appropriate
      reasponse to a 'reset' call but implementations are also free to
      explicitly list the keys that were affected by that call if they can
      easily do so.
      
      For efficiency reasons, the implementation should strive for path to
      be as long as possible (ie: the longest common prefix of all of the
      keys that were changed) but this is not strictly required.  As an
      example, if this function is called with the path of "/" then every
      single key in the application will be notified of a possible change.
  
      Params:
        path = the path containing the changes
        originTag = the origin tag
  */
  void pathChanged(string path, void* originTag = null) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    g_settings_backend_path_changed(cast(GSettingsBackend*)this._cPtr, _path, originTag);
  }

  /**
      Signals that the writability of all keys below a given path may have
      changed.
      
      Since GSettings performs no locking operations for itself, this call
      will always be made in response to external events.
  
      Params:
        path = the name of the path
  */
  void pathWritableChanged(string path) nothrow
  {
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    g_settings_backend_path_writable_changed(cast(GSettingsBackend*)this._cPtr, _path);
  }

  /**
      Signals that the writability of a single key has possibly changed.
      
      Since GSettings performs no locking operations for itself, this call
      will always be made in response to external events.
  
      Params:
        key = the name of the key
  */
  void writableChanged(string key) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    g_settings_backend_writable_changed(cast(GSettingsBackend*)this._cPtr, _key);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from SettingsBackend
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.settings_backend.SettingsBackend), T.stringof ~ " is not derived from gid.gio2.settings_backend.SettingsBackend");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetWritable", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "get_writable");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRead", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "read");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReadUserValue", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "read_user_value");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSubscribe", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "subscribe");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSync", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "sync");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnsubscribe", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "unsubscribe");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWrite", true)[0]) == gid.gio2.settings_backend.SettingsBackend))
      _installVfunc(klass, "write");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GSettingsBackendClass*)klass;

    switch (vfunc)
    {
      case "get_writable":
      {
        static extern(C) gboolean _vfuncGetWritableTramp(GSettingsBackend* backend, const(char)* key) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.getWritable)
              return (cast(typeof(&_vfuncGetWritableTramp))_klass.getWritable)(backend, key);
            return typeof(return).init;
          }

          bool _dretval;
          string _key = key.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetWritable(_key);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncGetWritable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getWritable = cast(typeof(_klass.getWritable))&_vfuncGetWritableTramp;
        break;
      }
      case "read":
      {
        static extern(C) GVariant* _vfuncReadTramp(GSettingsBackend* backend, const(char)* key, const(GVariantType)* expectedType, gboolean defaultValue) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.read)
              return (cast(typeof(&_vfuncReadTramp))_klass.read)(backend, key, expectedType, defaultValue);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;
          string _key = key.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncRead(_key, expectedType ? new gid.glib2.variant_type.VariantType(cast(void*)expectedType, No.Take) : null, cast(bool)defaultValue);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncRead");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.read = cast(typeof(_klass.read))&_vfuncReadTramp;
        break;
      }
      case "read_user_value":
      {
        static extern(C) GVariant* _vfuncReadUserValueTramp(GSettingsBackend* backend, const(char)* key, const(GVariantType)* expectedType) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.readUserValue)
              return (cast(typeof(&_vfuncReadUserValueTramp))_klass.readUserValue)(backend, key, expectedType);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;
          string _key = key.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncReadUserValue(_key, expectedType ? new gid.glib2.variant_type.VariantType(cast(void*)expectedType, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncReadUserValue");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.readUserValue = cast(typeof(_klass.readUserValue))&_vfuncReadUserValueTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(GSettingsBackend* backend, const(char)* key, void* originTag) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(backend, key, originTag);
            return;
          }

          string _key = key.fromCString!(No.Free);

          try
          {
            _obj.vfuncReset(_key, originTag);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncReset");
          }
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "subscribe":
      {
        static extern(C) void _vfuncSubscribeTramp(GSettingsBackend* backend, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.subscribe)
              return (cast(typeof(&_vfuncSubscribeTramp))_klass.subscribe)(backend, name);
            return;
          }

          string _name = name.fromCString!(No.Free);

          try
          {
            _obj.vfuncSubscribe(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncSubscribe");
          }
        }

        _klass.subscribe = cast(typeof(_klass.subscribe))&_vfuncSubscribeTramp;
        break;
      }
      case "sync":
      {
        static extern(C) void _vfuncSyncTramp(GSettingsBackend* backend) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.sync)
              return (cast(typeof(&_vfuncSyncTramp))_klass.sync)(backend);
            return;
          }

          try
          {
            _obj.vfuncSync();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncSync");
          }
        }

        _klass.sync = cast(typeof(_klass.sync))&_vfuncSyncTramp;
        break;
      }
      case "unsubscribe":
      {
        static extern(C) void _vfuncUnsubscribeTramp(GSettingsBackend* backend, const(char)* name) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.unsubscribe)
              return (cast(typeof(&_vfuncUnsubscribeTramp))_klass.unsubscribe)(backend, name);
            return;
          }

          string _name = name.fromCString!(No.Free);

          try
          {
            _obj.vfuncUnsubscribe(_name);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncUnsubscribe");
          }
        }

        _klass.unsubscribe = cast(typeof(_klass.unsubscribe))&_vfuncUnsubscribeTramp;
        break;
      }
      case "write":
      {
        static extern(C) gboolean _vfuncWriteTramp(GSettingsBackend* backend, const(char)* key, GVariant* value, void* originTag) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.settings_backend.SettingsBackend)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)backend);
          if (!_obj)
          {
            auto _klass = cast(GSettingsBackendClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)backend);
            if (_klass.write)
              return (cast(typeof(&_vfuncWriteTramp))_klass.write)(backend, key, value, originTag);
            return typeof(return).init;
          }

          bool _dretval;
          string _key = key.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncWrite(_key, value ? new gid.glib2.variant.Variant(cast(void*)value, No.Take) : null, originTag);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.settings_backend.SettingsBackend.vfuncWrite");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.write = cast(typeof(_klass.write))&_vfuncWriteTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.settings_backend.SettingsBackend]
class SettingsBackendGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.settings_backend.SettingsBackend]
final class SettingsBackendGidBuilder : SettingsBackendGidBuilderImpl!SettingsBackendGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SettingsBackend build() nothrow
  {
    return new SettingsBackend(cast(void*)createGObject(SettingsBackend._getGType), Yes.Take);
  }
}
