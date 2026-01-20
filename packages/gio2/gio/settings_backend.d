/// Module for [SettingsBackend] class
module gio.settings_backend;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.object;

/**
    The [gio.settings_backend.SettingsBackend] interface defines a generic interface for
    non-strictly-typed data that is stored in a hierarchy. To implement
    an alternative storage backend for [gio.settings.Settings], you need to
    implement the [gio.settings_backend.SettingsBackend] interface and then make it implement the
    extension point `G_SETTINGS_BACKEND_EXTENSION_POINT_NAME`.
    
    The interface defines methods for reading and writing values, a
    method for determining if writing of certain values will fail
    (lockdown) and a change notification mechanism.
    
    The semantics of the interface are very precisely defined and
    implementations must carefully adhere to the expectations of
    callers that are documented on each of the interface methods.
    
    Some of the [gio.settings_backend.SettingsBackend] functions accept or return a
    [glib.tree.Tree]. These trees always have strings as keys and
    [glib.variant.Variant] as values.
    
    The [gio.settings_backend.SettingsBackend] API is exported to allow third-party
    implementations, but does not carry the same stability guarantees
    as the public GIO API. For this reason, you have to define the
    C preprocessor symbol `G_SETTINGS_ENABLE_BACKEND` before including
    `gio/gsettingsbackend.h`.
*/
class SettingsBackend : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_settings_backend_get_type != &gidSymbolNotFound ? g_settings_backend_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SettingsBackend self()
  {
    return this;
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
  static gio.settings_backend.SettingsBackend getDefault()
  {
    GSettingsBackend* _cretval;
    _cretval = g_settings_backend_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings_backend.SettingsBackend)(cast(GSettingsBackend*)_cretval, Yes.Take);
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
  void changed(string key, void* originTag = null)
  {
    const(char)* _key = key.toCString(No.Alloc);
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
      from the contatenation of path with each item in items may have
      changed.
      
      The same rules for when notifications must occur apply as per
      [gio.settings_backend.SettingsBackend.changed].  These two calls can be used
      interchangeably if exactly one item has changed (although in that
      case [gio.settings_backend.SettingsBackend.changed] is definitely preferred).
      
      For efficiency reasons, the implementation should strive for path to
      be as long as possible (ie: the longest common prefix of all of the
      keys that were changed) but this is not strictly required.
  
      Params:
        path = the path containing the changes
        items = the null-terminated list of changed keys
        originTag = the origin tag
  */
  void keysChanged(string path, string[] items, void* originTag = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
    char*[] _tmpitems;
    foreach (s; items)
      _tmpitems ~= s.toCString(No.Alloc);
    _tmpitems ~= null;
    const(char*)* _items = _tmpitems.ptr;

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
      [gio.settings_backend.SettingsBackend.changed].  This call might be an appropriate
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
  void pathChanged(string path, void* originTag = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
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
  void pathWritableChanged(string path)
  {
    const(char)* _path = path.toCString(No.Alloc);
    g_settings_backend_path_writable_changed(cast(GSettingsBackend*)this._cPtr, _path);
  }

  /**
      Signals that the writability of a single key has possibly changed.
      
      Since GSettings performs no locking operations for itself, this call
      will always be made in response to external events.
  
      Params:
        key = the name of the key
  */
  void writableChanged(string key)
  {
    const(char)* _key = key.toCString(No.Alloc);
    g_settings_backend_writable_changed(cast(GSettingsBackend*)this._cPtr, _key);
  }
}
