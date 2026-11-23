/// Module for [PollableInputStream] interface mixin
module gid.gio2.pollable_input_stream_mixin;

public import gid.core.basictypes;
public import gid.gio2.pollable_input_stream_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.glib2.source;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.pollable_input_stream.PollableInputStream] is implemented by [gid.gio2.input_stream.InputStream]s that
    can be polled for readiness to read. This can be used when
    interfacing with a non-GIO API that expects
    UNIX-file-descriptor-style asynchronous I/O rather than GIO-style.
    
    Some classes may implement [gid.gio2.pollable_input_stream.PollableInputStream] but have only certain
    instances of that class be pollable. If [gid.gio2.pollable_input_stream.PollableInputStream.canPoll]
    returns false, then the behavior of other [gid.gio2.pollable_input_stream.PollableInputStream] methods is
    undefined.
*/
template PollableInputStreamT()
{

  /**
      Checks if stream is actually pollable. Some classes may implement
      #GPollableInputStream but have only certain instances of that class
      be pollable. If this method returns false, then the behavior of
      other #GPollableInputStream methods is undefined.
      
      For any given stream, the value returned by this method is constant;
      a stream cannot switch from pollable to non-pollable or vice versa.
      Returns: true if stream is pollable, false if not.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCanPoll`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncCanPoll()
  {
    auto _klass = cast(GPollableInputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_input_stream.PollableInputStream._getGType);
    if (!_klass || !_klass.canPoll)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.canPoll(cast(GPollableInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #GSource that triggers when stream can be read, or
      cancellable is triggered or an error occurs. The callback on the
      source is of the #GPollableSourceFunc type.
      
      As with [gid.gio2.pollable_input_stream.PollableInputStream.isReadable], it is possible that
      the stream may not actually be readable even after the source
      triggers, so you should use [gid.gio2.pollable_input_stream.PollableInputStream.readNonblocking]
      rather than [gid.gio2.input_stream.InputStream.read] from the callback.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_input_stream.PollableInputStream.canPoll] returns false for stream.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: a new #GSource
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncCreateSource`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.source.Source vfuncCreateSource(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GPollableInputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_input_stream.PollableInputStream._getGType);
    if (!_klass || !_klass.createSource)
      return typeof(return).init;

    GSource* _cretval;
    _cretval = _klass.createSource(cast(GPollableInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.source.Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if stream can be read.
      
      Note that some stream types may not be able to implement this 100%
      reliably, and it is possible that a call to [gid.gio2.input_stream.InputStream.read]
      after this returns true would still block. To guarantee
      non-blocking behavior, you should always use
      [gid.gio2.pollable_input_stream.PollableInputStream.readNonblocking], which will return a
      [gid.gio2.types.IOErrorEnum.WouldBlock] error rather than blocking.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_input_stream.PollableInputStream.canPoll] returns false for stream.
      Returns: true if stream is readable, false if not. If an error
          has occurred on stream, this will result in
          [gid.gio2.pollable_input_stream.PollableInputStream.isReadable] returning true, and the
          next attempt to read will return the error.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsReadable`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsReadable()
  {
    auto _klass = cast(GPollableInputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_input_stream.PollableInputStream._getGType);
    if (!_klass || !_klass.isReadable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isReadable(cast(GPollableInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to read up to count bytes from stream into buffer, as
      with [gid.gio2.input_stream.InputStream.read]. If stream is not currently readable,
      this will immediately return [gid.gio2.types.IOErrorEnum.WouldBlock], and you can
      use [gid.gio2.pollable_input_stream.PollableInputStream.createSource] to create a #GSource
      that will be triggered when stream is readable.
      
      Note that since this method never blocks, you cannot actually
      use cancellable to cancel it. However, it will return an error
      if cancellable has already been cancelled when you call, which
      may happen if you call this method after a source triggers due
      to having been cancelled.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_input_stream.PollableInputStream.canPoll] returns false for stream.
  
      Params:
        buffer = a
              buffer to read data into (which should be at least count bytes long).
      Returns: the number of bytes read, or -1 on error (including
          [gid.gio2.types.IOErrorEnum.WouldBlock]).
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncReadNonblocking`
      to chain up from an override.
      Overriding it from D is not supported (caller allocated output array parameter 'buffer' in callback is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected ptrdiff_t vfuncReadNonblocking(ref ubyte[] buffer)
  {
    auto _klass = cast(GPollableInputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.pollable_input_stream.PollableInputStream._getGType);
    if (!_klass || !_klass.readNonblocking)
      return typeof(return).init;

    ptrdiff_t _retval;
    size_t _count;
    _count = cast(size_t)buffer.length;
    GError *_err;
    _retval = _klass.readNonblocking(cast(GPollableInputStream*)this._cPtr, buffer.ptr, _count, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Checks if stream is actually pollable. Some classes may implement
      #GPollableInputStream but have only certain instances of that class
      be pollable. If this method returns false, then the behavior of
      other #GPollableInputStream methods is undefined.
      
      For any given stream, the value returned by this method is constant;
      a stream cannot switch from pollable to non-pollable or vice versa.
      Returns: true if stream is pollable, false if not.
  */
  override bool canPoll() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_pollable_input_stream_can_poll(cast(GPollableInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #GSource that triggers when stream can be read, or
      cancellable is triggered or an error occurs. The callback on the
      source is of the #GPollableSourceFunc type.
      
      As with [gid.gio2.pollable_input_stream.PollableInputStream.isReadable], it is possible that
      the stream may not actually be readable even after the source
      triggers, so you should use [gid.gio2.pollable_input_stream.PollableInputStream.readNonblocking]
      rather than [gid.gio2.input_stream.InputStream.read] from the callback.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_input_stream.PollableInputStream.canPoll] returns false for stream.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: a new #GSource
  */
  override gid.glib2.source.Source createSource(gid.gio2.cancellable.Cancellable cancellable = null) nothrow
  {
    GSource* _cretval;
    _cretval = g_pollable_input_stream_create_source(cast(GPollableInputStream*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.source.Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks if stream can be read.
      
      Note that some stream types may not be able to implement this 100%
      reliably, and it is possible that a call to [gid.gio2.input_stream.InputStream.read]
      after this returns true would still block. To guarantee
      non-blocking behavior, you should always use
      [gid.gio2.pollable_input_stream.PollableInputStream.readNonblocking], which will return a
      [gid.gio2.types.IOErrorEnum.WouldBlock] error rather than blocking.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_input_stream.PollableInputStream.canPoll] returns false for stream.
      Returns: true if stream is readable, false if not. If an error
          has occurred on stream, this will result in
          [gid.gio2.pollable_input_stream.PollableInputStream.isReadable] returning true, and the
          next attempt to read will return the error.
  */
  override bool isReadable() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_pollable_input_stream_is_readable(cast(GPollableInputStream*)this._cPtr);
    return _retval;
  }

  /**
      Attempts to read up to count bytes from stream into buffer, as
      with [gid.gio2.input_stream.InputStream.read]. If stream is not currently readable,
      this will immediately return [gid.gio2.types.IOErrorEnum.WouldBlock], and you can
      use [gid.gio2.pollable_input_stream.PollableInputStream.createSource] to create a #GSource
      that will be triggered when stream is readable.
      
      Note that since this method never blocks, you cannot actually
      use cancellable to cancel it. However, it will return an error
      if cancellable has already been cancelled when you call, which
      may happen if you call this method after a source triggers due
      to having been cancelled.
      
      The behaviour of this method is undefined if
      [gid.gio2.pollable_input_stream.PollableInputStream.canPoll] returns false for stream.
  
      Params:
        buffer = a
              buffer to read data into (which should be at least count bytes long).
        cancellable = a #GCancellable, or null
      Returns: the number of bytes read, or -1 on error (including
          [gid.gio2.types.IOErrorEnum.WouldBlock]).
      Throws: [ErrorWrap]
  */
  override ptrdiff_t readNonblocking(ref ubyte[] buffer, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    ptrdiff_t _retval;
    size_t _count;
    _count = cast(size_t)buffer.length;
    GError *_err;
    _retval = g_pollable_input_stream_read_nonblocking(cast(GPollableInputStream*)this._cPtr, buffer.ptr, _count, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.pollable_input_stream.PollableInputStream (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_pollable_input_stream_PollableInputStream(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanPoll", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateSource", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsReadable", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadNonblocking", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.pollable_input_stream.PollableInputStream vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_pollable_input_stream_PollableInputStream(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCanPoll", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_input_stream_PollableInputStream(iface, "can_poll");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncCreateSource", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_input_stream_PollableInputStream(iface, "create_source");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsReadable", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_pollable_input_stream_PollableInputStream(iface, "is_readable");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncReadNonblocking", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.pollable_input_stream.PollableInputStream.vfuncReadNonblocking is not supported: caller allocated output array parameter 'buffer' in callback is not supported");
  }

  private static void _installIfaceVfunc_gid_gio2_pollable_input_stream_PollableInputStream(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GPollableInputStreamInterface*)iface;

    switch (vfunc)
    {
      case "can_poll":
      {
        static extern(C) gboolean _vfuncCanPollTramp(GPollableInputStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableInputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_input_stream.PollableInputStream._getGType);
            if (_klass && _klass.canPoll)
              return (cast(typeof(&_vfuncCanPollTramp))_klass.canPoll)(stream);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncCanPoll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.pollable_input_stream.PollableInputStream.vfuncCanPoll");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.canPoll = cast(typeof(_klass.canPoll))&_vfuncCanPollTramp;
        break;
      }
      case "create_source":
      {
        static extern(C) GSource* _vfuncCreateSourceTramp(GPollableInputStream* stream, GCancellable* cancellable) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableInputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_input_stream.PollableInputStream._getGType);
            if (_klass && _klass.createSource)
              return (cast(typeof(&_vfuncCreateSourceTramp))_klass.createSource)(stream, cancellable);
            return typeof(return).init;
          }

          gid.glib2.source.Source _dretval;

          try
          {
            _dretval = _obj.vfuncCreateSource(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.pollable_input_stream.PollableInputStream.vfuncCreateSource");
          }
          auto _retval = _dretval ? cast(GSource*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.createSource = cast(typeof(_klass.createSource))&_vfuncCreateSourceTramp;
        break;
      }
      case "is_readable":
      {
        static extern(C) gboolean _vfuncIsReadableTramp(GPollableInputStream* stream) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)stream);
          if (!_obj)
          {
            auto _klass = cast(GPollableInputStreamInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)stream), gid.gio2.pollable_input_stream.PollableInputStream._getGType);
            if (_klass && _klass.isReadable)
              return (cast(typeof(&_vfuncIsReadableTramp))_klass.isReadable)(stream);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsReadable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.pollable_input_stream.PollableInputStream.vfuncIsReadable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isReadable = cast(typeof(_klass.isReadable))&_vfuncIsReadableTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.pollable_input_stream.PollableInputStream]
template PollableInputStreamGidBuilderT()
{
}
