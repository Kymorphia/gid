/// Module for [Bus] class
module gid.gst1.bus;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.source;
import gid.glib2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.message;
import gid.gst1.object;
import gid.gst1.types;

/**
    The #GstBus is an object responsible for delivering #GstMessage packets in
    a first-in first-out way from the streaming threads (see #GstTask) to the
    application.
    
    Since the application typically only wants to deal with delivery of these
    messages from one thread, the GstBus will marshall the messages between
    different threads. This is important since the actual streaming of media
    is done in another thread than the application.
    
    The GstBus provides support for #GSource based notifications. This makes it
    possible to handle the delivery in the glib #GMainLoop.
    
    The #GSource callback function [gid.gst1.bus.Bus.asyncSignalFunc] can be used to
    convert all bus messages into signal emissions.
    
    A message is posted on the bus with the [gid.gst1.bus.Bus.post] method. With the
    [gid.gst1.bus.Bus.peek] and [gid.gst1.bus.Bus.pop] methods one can look at or retrieve a
    previously posted message.
    
    The bus can be polled with the [gid.gst1.bus.Bus.poll] method. This methods blocks
    up to the specified timeout value until one of the specified messages types
    is posted on the bus. The application can then [gid.gst1.bus.Bus.pop] the messages
    from the bus to handle them.
    Alternatively the application can register an asynchronous bus function
    using [gid.gst1.bus.Bus.addWatchFull] or [gid.gst1.bus.Bus.addWatch]. This function will
    install a #GSource in the default glib main loop and will deliver messages
    a short while after they have been posted. Note that the main loop should
    be running for the asynchronous callbacks.
    
    It is also possible to get messages from the bus without any thread
    marshalling with the [gid.gst1.bus.Bus.setSyncHandler] method. This makes it
    possible to react to a message in the same thread that posted the
    message on the bus. This should only be used if the application is able
    to deal with messages from different threads.
    
    Every #GstPipeline has one bus.
    
    Note that a #GstPipeline will set its bus into flushing state when changing
    from READY to NULL state.
*/
@gidGir("Bus", "BusClass")
class Bus : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_bus_get_type != &gidSymbolNotFound ? gst_bus_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstBus";
  }

  /** Returns `this`, for use in `with` statements. */
  override Bus self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.bus.Bus]
      Returns: New builder object
  */
  static BusGidBuilder builder() nothrow
  {
    return new BusGidBuilder;
  }

  /**
      Creates a new #GstBus instance.
      Returns: a new #GstBus instance
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GstBus* _cretval;
      _cretval = gst_bus_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      A message has been posted on the bus.
  
      Params:
        message = the message that has been posted asynchronously (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMessage` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncMessage(gid.gst1.message.Message message)
  {
    auto _klass = cast(GstBusClass*)_vfuncClass;
    if (!_klass.message)
      return;

    _klass.message(cast(GstBus*)this._cPtr, message ? cast(GstMessage*)message._cPtr(No.Dup) : null);
  }

  /**
      A message has been posted on the bus.
  
      Params:
        message = the message that has been posted synchronously (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSyncMessage` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSyncMessage(gid.gst1.message.Message message)
  {
    auto _klass = cast(GstBusClass*)_vfuncClass;
    if (!_klass.syncMessage)
      return;

    _klass.syncMessage(cast(GstBus*)this._cPtr, message ? cast(GstMessage*)message._cPtr(No.Dup) : null);
  }

  /**
      Adds a bus signal watch to the default main context with the default priority
      ( [gid.glib2.types.PRIORITY_DEFAULT] ). It is also possible to use a non-default
      main context set up using [gid.glib2.main_context.MainContext.pushThreadDefault] (before
      one had to create a bus watch source and attach it to the desired main
      context 'manually').
      
      After calling this statement, the bus will emit the "message" signal for each
      message posted on the bus.
      
      This function may be called multiple times. To clean up, the caller is
      responsible for calling [gid.gst1.bus.Bus.removeSignalWatch] as many times as this
      function is called.
  */
  void addSignalWatch() nothrow
  {
    gst_bus_add_signal_watch(cast(GstBus*)this._cPtr);
  }

  /**
      Adds a bus signal watch to the default main context with the given priority
      (e.g. [gid.glib2.types.PRIORITY_DEFAULT]). It is also possible to use a non-default main
      context set up using [gid.glib2.main_context.MainContext.pushThreadDefault]
      (before one had to create a bus watch source and attach it to the desired
      main context 'manually').
      
      After calling this statement, the bus will emit the "message" signal for each
      message posted on the bus when the #GMainLoop is running.
      
      This function may be called multiple times. To clean up, the caller is
      responsible for calling [gid.gst1.bus.Bus.removeSignalWatch] as many times as this
      function is called.
      
      There can only be a single bus watch per bus, you must remove any signal
      watch before you can set another type of watch.
  
      Params:
        priority = The priority of the watch.
  */
  void addSignalWatchFull(int priority) nothrow
  {
    gst_bus_add_signal_watch_full(cast(GstBus*)this._cPtr, priority);
  }

  /**
      Adds a bus watch to the default main context with the given priority (e.g.
      [gid.glib2.types.PRIORITY_DEFAULT]). It is also possible to use a non-default  main
      context set up using [gid.glib2.main_context.MainContext.pushThreadDefault] (before
      one had to create a bus watch source and attach it to the desired main
      context 'manually').
      
      This function is used to receive asynchronous messages in the main loop.
      There can only be a single bus watch per bus, you must remove it before you
      can set a new one.
      
      The bus watch will only work if a #GMainLoop is being run.
      
      When func is called, the message belongs to the caller; if you want to
      keep a copy of it, call [gid.gst1.message.Message.ref_] before leaving func.
      
      The watch can be removed using [gid.gst1.bus.Bus.removeWatch] or by returning false
      from func. If the watch was added to the default main context it is also
      possible to remove the watch using [gid.glib2.source.Source.remove].
      
      The bus watch will take its own reference to the bus, so it is safe to unref
      bus using [gid.gst1.object.ObjectWrap.unref] after setting the bus watch.
  
      Params:
        priority = The priority of the watch.
        func = A function to call when a message is received.
      Returns: The event source id or 0 if bus already got an event source.
  */
  uint addWatch(int priority, gid.gst1.types.BusFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GstBus* bus, GstMessage* message, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gst1.types.BusFunc*)userData;
      auto _message = message ? new gid.gst1.message.Message(cast(void*)message, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.bus.Bus)(cast(void*)bus, No.Take), _message);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.BusFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_message)
        _message._cUnborrow;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    uint _retval;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _retval = gst_bus_add_watch_full(cast(GstBus*)this._cPtr, priority, _funcCB, _func, _funcDestroyCB);
    return _retval;
  }

  /**
      A helper #GstBusFunc that can be used to convert all asynchronous messages
      into signals.
  
      Params:
        message = the #GstMessage received
        data = user data
      Returns: true
  */
  bool asyncSignalFunc(gid.gst1.message.Message message, void* data = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_bus_async_signal_func(cast(GstBus*)this._cPtr, message ? cast(GstMessage*)message._cPtr(No.Dup) : null, data);
    return _retval;
  }

  /**
      Create watch for this bus. The #GSource will be dispatched whenever
      a message is on the bus. After the GSource is dispatched, the
      message is popped off the bus and unreffed.
      
      As with other watches, there can only be one watch on the bus, including
      any signal watch added with #gst_bus_add_signal_watch.
      Returns: a #GSource that can be added to a #GMainLoop.
  */
  gid.glib2.source.Source createWatch() nothrow
  {
    GSource* _cretval;
    _cretval = gst_bus_create_watch(cast(GstBus*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.source.Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Instructs GStreamer to stop emitting the "sync-message" signal for this bus.
      See [gid.gst1.bus.Bus.enableSyncMessageEmission] for more information.
      
      In the event that multiple pieces of code have called
      [gid.gst1.bus.Bus.enableSyncMessageEmission], the sync-message emissions will only
      be stopped after all calls to [gid.gst1.bus.Bus.enableSyncMessageEmission] were
      "cancelled" by calling this function. In this way the semantics are exactly
      the same as [gid.gst1.object.ObjectWrap.ref_] that which calls enable should also call
      disable.
  */
  void disableSyncMessageEmission() nothrow
  {
    gst_bus_disable_sync_message_emission(cast(GstBus*)this._cPtr);
  }

  /**
      Instructs GStreamer to emit the "sync-message" signal after running the bus's
      sync handler. This function is here so that code can ensure that they can
      synchronously receive messages without having to affect what the bin's sync
      handler is.
      
      This function may be called multiple times. To clean up, the caller is
      responsible for calling [gid.gst1.bus.Bus.disableSyncMessageEmission] as many times
      as this function is called.
      
      While this function looks similar to [gid.gst1.bus.Bus.addSignalWatch], it is not
      exactly the same -- this function enables *synchronous* emission of
      signals when messages arrive; [gid.gst1.bus.Bus.addSignalWatch] adds an idle callback
      to pop messages off the bus *asynchronously*. The sync-message signal
      comes from the thread of whatever object posted the message; the "message"
      signal is marshalled to the main thread via the #GMainLoop.
  */
  void enableSyncMessageEmission() nothrow
  {
    gst_bus_enable_sync_message_emission(cast(GstBus*)this._cPtr);
  }

  /**
      Gets the file descriptor from the bus which can be used to get notified about
      messages being available with functions like [gid.glib2.global.poll], and allows integration
      into other event loops based on file descriptors.
      Whenever a message is available, the POLLIN / [gid.glib2.types.IOCondition.In] event is set.
      
      Warning: NEVER read or write anything to the returned fd but only use it
      for getting notifications via [gid.glib2.global.poll] or similar and then use the normal
      GstBus API, e.g. [gid.gst1.bus.Bus.pop].
  
      Params:
        fd = A GPollFD to fill
  */
  void getPollfd(out gid.glib2.types.PollFD fd) nothrow
  {
    gst_bus_get_pollfd(cast(GstBus*)this._cPtr, cast(GPollFD*)&fd);
  }

  /**
      Checks if there are pending messages on the bus that
      should be handled.
      Returns: true if there are messages on the bus to be handled, false
        otherwise.
  */
  bool havePending() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_bus_have_pending(cast(GstBus*)this._cPtr);
    return _retval;
  }

  /**
      Peeks the message on the top of the bus' queue. The message will remain
      on the bus' message queue.
      Returns: the #GstMessage that is on the
            bus, or null if the bus is empty.
  */
  gid.gst1.message.Message peek() nothrow
  {
    GstMessage* _cretval;
    _cretval = gst_bus_peek(cast(GstBus*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Polls the bus for messages. Will block while waiting for messages to come.
      You can specify a maximum time to poll with the timeout parameter. If
      timeout is negative, this function will block indefinitely.
      
      All messages not in events will be popped off the bus and will be ignored.
      It is not possible to use message enums beyond #GST_MESSAGE_EXTENDED in the
      events mask
      
      Because poll is implemented using the "message" signal enabled by
      [gid.gst1.bus.Bus.addSignalWatch], calling [gid.gst1.bus.Bus.poll] will cause the "message"
      signal to be emitted for every message that poll sees. Thus a "message"
      signal handler will see the same messages that this function sees -- neither
      will steal messages from the other.
      
      This function will run a #GMainLoop from the default main context when
      polling.
      
      You should never use this function, since it is pure evil. This is
      especially true for GUI applications based on Gtk+ or Qt, but also for any
      other non-trivial application that uses the GLib main loop. As this function
      runs a GLib main loop, any callback attached to the default GLib main
      context may be invoked. This could be timeouts, GUI events, I/O events etc.;
      even if [gid.gst1.bus.Bus.poll] is called with a 0 timeout. Any of these callbacks
      may do things you do not expect, e.g. destroy the main application window or
      some other resource; change other application state; display a dialog and
      run another main loop until the user clicks it away. In short, using this
      function may add a lot of complexity to your code through unexpected
      re-entrancy and unexpected changes to your application's state.
      
      For 0 timeouts use [gid.gst1.bus.Bus.popFiltered] instead of this function; for
      other short timeouts use [gid.gst1.bus.Bus.timedPopFiltered]; everything else is
      better handled by setting up an asynchronous bus watch and doing things
      from there.
  
      Params:
        events = a mask of #GstMessageType, representing the set of message types to
          poll for (note special handling of extended message types below)
        timeout = the poll timeout, as a #GstClockTime, or #GST_CLOCK_TIME_NONE to poll
          indefinitely.
      Returns: the message that was received,
            or null if the poll timed out.
  */
  gid.gst1.message.Message poll(gid.gst1.types.MessageType events, gid.gst1.types.ClockTime timeout) nothrow
  {
    GstMessage* _cretval;
    _cretval = gst_bus_poll(cast(GstBus*)this._cPtr, events, timeout);
    auto _retval = _cretval ? new gid.gst1.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a message from the bus.
      Returns: the #GstMessage that is on the
            bus, or null if the bus is empty.
  */
  gid.gst1.message.Message pop() nothrow
  {
    GstMessage* _cretval;
    _cretval = gst_bus_pop(cast(GstBus*)this._cPtr);
    auto _retval = _cretval ? new gid.gst1.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a message matching type from the bus.  Will discard all messages on
      the bus that do not match type and that have been posted before the first
      message that does match type.  If there is no message matching type on
      the bus, all messages will be discarded. It is not possible to use message
      enums beyond #GST_MESSAGE_EXTENDED in the events mask.
  
      Params:
        types = message types to take into account
      Returns: the next #GstMessage matching
            type that is on the bus, or null if the bus is empty or there
            is no message matching type.
  */
  gid.gst1.message.Message popFiltered(gid.gst1.types.MessageType types) nothrow
  {
    GstMessage* _cretval;
    _cretval = gst_bus_pop_filtered(cast(GstBus*)this._cPtr, types);
    auto _retval = _cretval ? new gid.gst1.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Posts a message on the given bus. Ownership of the message
      is taken by the bus.
  
      Params:
        message = the #GstMessage to post
      Returns: true if the message could be posted, false if the bus is flushing.
  */
  bool post(gid.gst1.message.Message message) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_bus_post(cast(GstBus*)this._cPtr, message ? cast(GstMessage*)message._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Removes a signal watch previously added with [gid.gst1.bus.Bus.addSignalWatch].
  */
  void removeSignalWatch() nothrow
  {
    gst_bus_remove_signal_watch(cast(GstBus*)this._cPtr);
  }

  /**
      Removes an installed bus watch from bus.
      Returns: true on success or false if bus has no event source.
  */
  bool removeWatch() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_bus_remove_watch(cast(GstBus*)this._cPtr);
    return _retval;
  }

  /**
      If flushing, flushes out and unrefs any messages queued in the bus. Releases
      references to the message origin objects. Will flush future messages until
      [gid.gst1.bus.Bus.setFlushing] sets flushing to false.
  
      Params:
        flushing = whether or not to flush the bus
  */
  void setFlushing(bool flushing) nothrow
  {
    gst_bus_set_flushing(cast(GstBus*)this._cPtr, flushing);
  }

  /**
      Sets the synchronous handler on the bus. The function will be called
      every time a new message is posted on the bus. Note that the function
      will be called in the same thread context as the posting object. This
      function is usually only called by the creator of the bus. Applications
      should handle messages asynchronously using the gst_bus watch and poll
      functions.
      
      Before 1.16.3 it was not possible to replace an existing handler and
      clearing an existing handler with null was not thread-safe.
  
      Params:
        func = The handler function to install
  */
  void setSyncHandler(gid.gst1.types.BusSyncHandler func = null) nothrow
  {
    extern(C) GstBusSyncReply _funcCallback(GstBus* bus, GstMessage* message, void* userData) nothrow
    {
      gidAttachThread();
      gid.gst1.types.BusSyncReply _dretval;
      auto _dlg = cast(gid.gst1.types.BusSyncHandler*)userData;
      auto _message = message ? new gid.gst1.message.Message(cast(void*)message, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gst1.bus.Bus)(cast(void*)bus, No.Take), _message);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.BusSyncHandler");
      }
      auto _retval = cast(GstBusSyncReply)_dretval;
      if (_message)
        _message._cUnborrow;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gst_bus_set_sync_handler(cast(GstBus*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      A helper #GstBusSyncHandler that can be used to convert all synchronous
      messages into signals.
  
      Params:
        message = the #GstMessage received
        data = user data
      Returns: [gid.gst1.types.BusSyncReply.Pass]
  */
  gid.gst1.types.BusSyncReply syncSignalHandler(gid.gst1.message.Message message, void* data = null) nothrow
  {
    GstBusSyncReply _cretval;
    _cretval = gst_bus_sync_signal_handler(cast(GstBus*)this._cPtr, message ? cast(GstMessage*)message._cPtr(No.Dup) : null, data);
    gid.gst1.types.BusSyncReply _retval = cast(gid.gst1.types.BusSyncReply)_cretval;
    return _retval;
  }

  /**
      Gets a message from the bus, waiting up to the specified timeout.
      
      If timeout is 0, this function behaves like [gid.gst1.bus.Bus.pop]. If timeout is
      #GST_CLOCK_TIME_NONE, this function will block forever until a message was
      posted on the bus.
  
      Params:
        timeout = a timeout
      Returns: the #GstMessage that is on the
            bus after the specified timeout or null if the bus is empty
            after the timeout expired.
  */
  gid.gst1.message.Message timedPop(gid.gst1.types.ClockTime timeout) nothrow
  {
    GstMessage* _cretval;
    _cretval = gst_bus_timed_pop(cast(GstBus*)this._cPtr, timeout);
    auto _retval = _cretval ? new gid.gst1.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets a message from the bus whose type matches the message type mask types,
      waiting up to the specified timeout (and discarding any messages that do not
      match the mask provided).
      
      If timeout is 0, this function behaves like [gid.gst1.bus.Bus.popFiltered]. If
      timeout is #GST_CLOCK_TIME_NONE, this function will block forever until a
      matching message was posted on the bus.
  
      Params:
        timeout = a timeout in nanoseconds, or [gid.gst1.types.CLOCK_TIME_NONE] to wait forever
        types = message types to take into account, [gid.gst1.types.MessageType.Any] for any type
      Returns: a #GstMessage matching the
            filter in types, or null if no matching message was found on
            the bus until the timeout expired.
  */
  gid.gst1.message.Message timedPopFiltered(gid.gst1.types.ClockTime timeout, gid.gst1.types.MessageType types) nothrow
  {
    GstMessage* _cretval;
    _cretval = gst_bus_timed_pop_filtered(cast(GstBus*)this._cPtr, timeout, types);
    auto _retval = _cretval ? new gid.gst1.message.Message(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Connect to `Message` signal.
  
      A message has been posted on the bus. This signal is emitted from a
        #GSource added to the mainloop. this signal will only be emitted when
        there is a #GMainLoop running.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.message.Message message, gid.gst1.bus.Bus bus)`
  
          `message` the message that has been posted asynchronously (optional)
  
          `bus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMessage(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gst1.message.Message)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gst1.bus.Bus)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.bus.Bus.message");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("message"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `SyncMessage` signal.
  
      A message has been posted on the bus. This signal is emitted from the
        thread that posted the message so one has to be careful with locking.
        
        This signal will not be emitted by default, you have to call
        [gid.gst1.bus.Bus.enableSyncMessageEmission] before.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gst1.message.Message message, gid.gst1.bus.Bus bus)`
  
          `message` the message that has been posted synchronously (optional)
  
          `bus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSyncMessage(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gst1.message.Message)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gst1.bus.Bus)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.bus.Bus.syncMessage");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("sync-message"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Bus
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gst1.bus.Bus), T.stringof ~ " is not derived from gid.gst1.bus.Bus");

    gid.gst1.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMessage", true)[0]) == gid.gst1.bus.Bus))
      _installVfunc(klass, "message");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSyncMessage", true)[0]) == gid.gst1.bus.Bus))
      _installVfunc(klass, "sync_message");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GstBusClass*)klass;

    switch (vfunc)
    {
      case "message":
      {
        static extern(C) void _vfuncMessageTramp(GstBus* bus, GstMessage* message) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.bus.Bus)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)bus);
          if (!_obj)
          {
            auto _klass = cast(GstBusClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)bus);
            if (_klass.message)
              return (cast(typeof(&_vfuncMessageTramp))_klass.message)(bus, message);
            return;
          }

          auto _message = message ? new gid.gst1.message.Message(cast(void*)message, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncMessage(_message);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.bus.Bus.vfuncMessage");
          }
          if (_message)
            _message._cUnborrow;

        }

        _klass.message = cast(typeof(_klass.message))&_vfuncMessageTramp;
        break;
      }
      case "sync_message":
      {
        static extern(C) void _vfuncSyncMessageTramp(GstBus* bus, GstMessage* message) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gst1.bus.Bus)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)bus);
          if (!_obj)
          {
            auto _klass = cast(GstBusClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)bus);
            if (_klass.syncMessage)
              return (cast(typeof(&_vfuncSyncMessageTramp))_klass.syncMessage)(bus, message);
            return;
          }

          auto _message = message ? new gid.gst1.message.Message(cast(void*)message, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncSyncMessage(_message);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gst1.bus.Bus.vfuncSyncMessage");
          }
          if (_message)
            _message._cUnborrow;

        }

        _klass.syncMessage = cast(typeof(_klass.syncMessage))&_vfuncSyncMessageTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gst1.bus.Bus]
class BusGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `enableAsync` property.
      Params:
        propval = Enables async message delivery support for bus watches,
          [gid.gst1.bus.Bus.pop] and similar API. Without this only the
          synchronous message handlers are called.
          
          This property is used to create the child element buses
          in #GstBin.
      Returns: Builder instance for fluent chaining
  */
  T enableAsync(bool propval) nothrow
  {
    return setProperty("enable-async", propval);
  }
}

/// Fluent builder for [gid.gst1.bus.Bus]
final class BusGidBuilder : BusGidBuilderImpl!BusGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Bus build() nothrow
  {
    return new Bus(cast(void*)createGObject(Bus._getGType), Yes.Take);
  }
}
