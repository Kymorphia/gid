/// Module for [Seekable] interface mixin
module gid.gio2.seekable_mixin;

public import gid.core.basictypes;
public import gid.gio2.seekable_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.glib2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.seekable.Seekable] is implemented by streams (implementations of
    [gid.gio2.input_stream.InputStream] or [gid.gio2.output_stream.OutputStream]) that support seeking.
    
    Seekable streams largely fall into two categories: resizable and
    fixed-size.
    
    [gid.gio2.seekable.Seekable] on fixed-sized streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a block device (for example: attempting to seek
    past the end of the device is an error).  Fixed streams typically cannot be
    truncated.
    
    [gid.gio2.seekable.Seekable] on resizable streams is approximately the same as POSIX
    [`lseek()`](man:lseek(2)) on a normal file.  Seeking past the end and writing
    data will usually cause the stream to resize by introducing zero bytes.
*/
template SeekableT()
{

  /**
      Tests if the stream supports the #GSeekableIface.
      Returns: true if seekable can be seeked. false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSeekableCanSeek`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSeekableCanSeek()
  {
    auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.seekable.Seekable._getGType);
    if (!_klass || !_klass.canSeek)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canSeek(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Tests if the length of the stream can be adjusted with
      [gid.gio2.seekable.Seekable.truncate].
      Returns: true if the stream can be truncated, false otherwise.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSeekableCanTruncate`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSeekableCanTruncate()
  {
    auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.seekable.Seekable._getGType);
    if (!_klass || !_klass.canTruncate)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canTruncate(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Seeks in the stream by the given offset, modified by type.
      
      Attempting to seek past the end of the stream will have different
      results depending on if the stream is fixed-sized or resizable.  If
      the stream is resizable then seeking past the end and then writing
      will result in zeros filling the empty space.  Seeking past the end
      of a resizable stream and reading will result in EOF.  Seeking past
      the end of a fixed-sized stream will fail.
      
      Any operation that would result in a negative offset will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        offset = a #goffset.
        type = a #GSeekType.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSeekableSeek`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSeekableSeek(long offset, gid.glib2.types.SeekType type, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.seekable.Seekable._getGType);
    if (!_klass || !_klass.seek)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.seek(cast(GSeekable*)this._cPtr, offset, type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tells the current position within the stream.
      Returns: the (positive or zero) offset from the beginning of the
        buffer, zero if the target is not seekable.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSeekableTell`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected long vfuncSeekableTell()
  {
    auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.seekable.Seekable._getGType);
    if (!_klass || !_klass.tell)
      return typeof(return).init;

    long _retval;
    _retval = _klass.tell(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Sets the length of the stream to offset. If the stream was previously
      larger than offset, the extra data is discarded. If the stream was
      previously shorter than offset, it is extended with NUL ('\0') bytes.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
  
      Params:
        offset = new length for seekable, in bytes.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSeekableTruncateFn`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSeekableTruncateFn(long offset, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.seekable.Seekable._getGType);
    if (!_klass || !_klass.truncateFn)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.truncateFn(cast(GSeekable*)this._cPtr, offset, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tests if the stream supports the #GSeekableIface.
      Returns: true if seekable can be seeked. false otherwise.
  */
  override bool canSeek() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_seekable_can_seek(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Tests if the length of the stream can be adjusted with
      [gid.gio2.seekable.Seekable.truncate].
      Returns: true if the stream can be truncated, false otherwise.
  */
  override bool canTruncate() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_seekable_can_truncate(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Seeks in the stream by the given offset, modified by type.
      
      Attempting to seek past the end of the stream will have different
      results depending on if the stream is fixed-sized or resizable.  If
      the stream is resizable then seeking past the end and then writing
      will result in zeros filling the empty space.  Seeking past the end
      of a resizable stream and reading will result in EOF.  Seeking past
      the end of a fixed-sized stream will fail.
      
      Any operation that would result in a negative offset will fail.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        offset = a #goffset.
        type = a #GSeekType.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool seek(long offset, gid.glib2.types.SeekType type, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_seekable_seek(cast(GSeekable*)this._cPtr, offset, type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Tells the current position within the stream.
      Returns: the (positive or zero) offset from the beginning of the
        buffer, zero if the target is not seekable.
  */
  override long tell() nothrow
  {
    long _retval;
    _retval = g_seekable_tell(cast(GSeekable*)this._cPtr);
    return _retval;
  }

  /**
      Sets the length of the stream to offset. If the stream was previously
      larger than offset, the extra data is discarded. If the stream was
      previously shorter than offset, it is extended with NUL ('\0') bytes.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.
  
      Params:
        offset = new length for seekable, in bytes.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: true if successful. If an error
            has occurred, this function will return false and set error
            appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool truncate(long offset, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_seekable_truncate(cast(GSeekable*)this._cPtr, offset, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.seekable.Seekable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_seekable_Seekable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableCanSeek", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableCanTruncate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableSeek", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableTell", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableTruncateFn", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.seekable.Seekable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_seekable_Seekable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableCanSeek", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_seekable_Seekable(iface, "can_seek");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableCanTruncate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_seekable_Seekable(iface, "can_truncate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableSeek", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_seekable_Seekable(iface, "seek");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableTell", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_seekable_Seekable(iface, "tell");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSeekableTruncateFn", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_seekable_Seekable(iface, "truncate_fn");
  }

  private static void _installIfaceVfunc_gid_gio2_seekable_Seekable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GSeekableIface*)iface;

    switch (vfunc)
    {
      case "can_seek":
      {
        static extern(C) gboolean _vfuncSeekableCanSeekTramp(GSeekable* seekable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)seekable);
          if (!_obj)
          {
            auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)seekable), gid.gio2.seekable.Seekable._getGType);
            if (_klass && _klass.canSeek)
              return (cast(typeof(&_vfuncSeekableCanSeekTramp))_klass.canSeek)(seekable);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSeekableCanSeek();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.seekable.Seekable.vfuncSeekableCanSeek");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canSeek = cast(typeof(_klass.canSeek))&_vfuncSeekableCanSeekTramp;
        break;
      }
      case "can_truncate":
      {
        static extern(C) gboolean _vfuncSeekableCanTruncateTramp(GSeekable* seekable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)seekable);
          if (!_obj)
          {
            auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)seekable), gid.gio2.seekable.Seekable._getGType);
            if (_klass && _klass.canTruncate)
              return (cast(typeof(&_vfuncSeekableCanTruncateTramp))_klass.canTruncate)(seekable);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSeekableCanTruncate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.seekable.Seekable.vfuncSeekableCanTruncate");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canTruncate = cast(typeof(_klass.canTruncate))&_vfuncSeekableCanTruncateTramp;
        break;
      }
      case "seek":
      {
        static extern(C) gboolean _vfuncSeekableSeekTramp(GSeekable* seekable, long offset, GSeekType type, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)seekable);
          if (!_obj)
          {
            auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)seekable), gid.gio2.seekable.Seekable._getGType);
            if (_klass && _klass.seek)
              return (cast(typeof(&_vfuncSeekableSeekTramp))_klass.seek)(seekable, offset, type, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSeekableSeek(offset, type, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.seek = cast(typeof(_klass.seek))&_vfuncSeekableSeekTramp;
        break;
      }
      case "tell":
      {
        static extern(C) long _vfuncSeekableTellTramp(GSeekable* seekable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)seekable);
          if (!_obj)
          {
            auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)seekable), gid.gio2.seekable.Seekable._getGType);
            if (_klass && _klass.tell)
              return (cast(typeof(&_vfuncSeekableTellTramp))_klass.tell)(seekable);
            return typeof(return).init;
          }

          long _retval;

          try
          {
            _retval = _obj.vfuncSeekableTell();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.seekable.Seekable.vfuncSeekableTell");
          }
          return _retval;
        }

        _klass.tell = cast(typeof(_klass.tell))&_vfuncSeekableTellTramp;
        break;
      }
      case "truncate_fn":
      {
        static extern(C) gboolean _vfuncSeekableTruncateFnTramp(GSeekable* seekable, long offset, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)seekable);
          if (!_obj)
          {
            auto _klass = cast(GSeekableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)seekable), gid.gio2.seekable.Seekable._getGType);
            if (_klass && _klass.truncateFn)
              return (cast(typeof(&_vfuncSeekableTruncateFnTramp))_klass.truncateFn)(seekable, offset, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSeekableTruncateFn(offset, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.truncateFn = cast(typeof(_klass.truncateFn))&_vfuncSeekableTruncateFnTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.seekable.Seekable]
template SeekableGidBuilderT()
{
}
