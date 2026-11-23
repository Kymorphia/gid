/// Module for [Notification] class
module gid.webkit6.notification;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Holds information about a notification that should be shown to the user.
*/
class Notification : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_notification_get_type != &gidSymbolNotFound ? webkit_notification_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitNotification";
  }

  /** Returns `this`, for use in `with` statements. */
  override Notification self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.notification.Notification]
      Returns: New builder object
  */
  static NotificationGidBuilder builder() nothrow
  {
    return new NotificationGidBuilder;
  }

  /**
      Get `body_` property.
      Returns: The body for the notification.
  */
  @property string body_() nothrow
  {
    return getBody();
  }

  /**
      Get `id` property.
      Returns: The unique id for the notification.
  */
  @property ulong id() nothrow
  {
    return getId();
  }

  /**
      Get `tag` property.
      Returns: The tag identifier for the notification.
  */
  @property string tag() nothrow
  {
    return getTag();
  }

  /**
      Get `title` property.
      Returns: The title for the notification.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Tells WebKit the notification has been clicked.
      
      This will emit the
      #WebKitNotification::clicked signal.
  */
  void clicked() nothrow
  {
    webkit_notification_clicked(cast(WebKitNotification*)this._cPtr);
  }

  /**
      Closes the notification.
  */
  void close() nothrow
  {
    webkit_notification_close(cast(WebKitNotification*)this._cPtr);
  }

  /**
      Obtains the body for the notification.
      Returns: the body for the notification
  */
  string getBody() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_notification_get_body(cast(WebKitNotification*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtains the unique id for the notification.
      Returns: the unique id for the notification
  */
  ulong getId() nothrow
  {
    ulong _retval;
    _retval = webkit_notification_get_id(cast(WebKitNotification*)this._cPtr);
    return _retval;
  }

  /**
      Obtains the tag identifier for the notification.
      Returns: the tag for the notification
  */
  string getTag() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_notification_get_tag(cast(WebKitNotification*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtains the title for the notification.
      Returns: the title for the notification
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_notification_get_title(cast(WebKitNotification*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Connect to `Clicked` signal.
  
      Emitted when a notification has been clicked. See [gid.webkit6.notification.Notification.clicked].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkit6.notification.Notification notification)`
  
          `notification` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClicked(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.notification.Notification)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.notification.Notification.clicked");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("clicked", closure, after);
  }

  /**
      Connect to `Closed` signal.
  
      Emitted when a notification has been withdrawn.
        
        The default handler will close the notification using libnotify, if built with
        support for it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkit6.notification.Notification notification)`
  
          `notification` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClosed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.notification.Notification)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.notification.Notification.closed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.webkit6.notification.Notification]
class NotificationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.notification.Notification]
final class NotificationGidBuilder : NotificationGidBuilderImpl!NotificationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Notification build() nothrow
  {
    return new Notification(cast(void*)createGObject(Notification._getGType), Yes.Take);
  }
}
