/// Module for [Initable] interface mixin
module gio.initable_mixin;

public import gio.initable_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.types;
public import glib.error;

/**
    [gio.initable.Initable] is implemented by objects that can fail during
    initialization. If an object implements this interface then
    it must be initialized as the first thing after construction,
    either via [gio.initable.Initable.init_] or [gio.async_initable.AsyncInitable.initAsync]
    (the latter is only available if it also implements [gio.async_initable.AsyncInitable]).
    
    If the object is not initialized, or initialization returns with an
    error, then all operations on the object except `[gobject.object.ObjectWrap.ref_]` and
    `[gobject.object.ObjectWrap.unref]` are considered to be invalid, and have undefined
    behaviour. They will often fail with `func@GLib.critical` or
    `func@GLib.warning`, but this must not be relied on.
    
    Users of objects implementing this are not intended to use
    the interface method directly, instead it will be used automatically
    in various ways. For C applications you generally just call
    [gio.initable.Initable.new_] directly, or indirectly via a `foo_thing_new()` wrapper.
    This will call [gio.initable.Initable.init_] under the cover, returning `NULL`
    and setting a [glib.error.ErrorWrap] on failure (at which point the instance is
    unreferenced).
    
    For bindings in languages where the native constructor supports
    exceptions the binding could check for objects implementing [gio.initable.Initable]
    during normal construction and automatically initialize them, throwing
    an exception on failure.
*/
template InitableT()
{

  /**
      Initializes the object implementing the interface.
      
      This method is intended for language bindings. If writing in C,
      [gio.initable.Initable.new_] should typically be used instead.
      
      The object must be initialized before any real use after initial
      construction, either with this function or [gio.async_initable.AsyncInitable.initAsync].
      
      Implementations may also support cancellation. If cancellable is not null,
      then initialization can be cancelled by triggering the cancellable object
      from another thread. If the operation was cancelled, the error
      [gio.types.IOErrorEnum.Cancelled] will be returned. If cancellable is not null and
      the object doesn't support cancellable initialization the error
      [gio.types.IOErrorEnum.NotSupported] will be returned.
      
      If the object is not initialized, or initialization returns with an
      error, then all operations on the object except [gobject.object.ObjectWrap.ref_] and
      [gobject.object.ObjectWrap.unref] are considered to be invalid, and have undefined
      behaviour. See the [introduction][ginitable] for more details.
      
      Callers should not assume that a class which implements #GInitable can be
      initialized multiple times, unless the class explicitly documents itself as
      supporting this. Generally, a class’ implementation of init() can assume
      (and assert) that it will only be called once. Previously, this documentation
      recommended all #GInitable implementations should be idempotent; that
      recommendation was relaxed in GLib 2.54.
      
      If a class explicitly supports being initialized multiple times, it is
      recommended that the method is idempotent: multiple calls with the same
      arguments should return the same results. Only the first call initializes
      the object; further calls return the result of the first call.
      
      One reason why a class might need to support idempotent initialization is if
      it is designed to be used via the singleton pattern, with a
      #GObjectClass.constructor that sometimes returns an existing instance.
      In this pattern, a caller would expect to be able to call [gio.initable.Initable.init_]
      on the result of [gobject.object.ObjectWrap.new_], regardless of whether it is in fact a new
      instance.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error has occurred, this function will
            return false and set error appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool init_(gio.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_initable_init(cast(GInitable*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
