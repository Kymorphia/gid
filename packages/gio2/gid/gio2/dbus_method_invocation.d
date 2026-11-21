/// Module for [DBusMethodInvocation] class
module gid.gio2.dbus_method_invocation;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_connection;
import gid.gio2.dbus_message;
import gid.gio2.dbus_method_info;
import gid.gio2.dbus_property_info;
import gid.gio2.types;
import gid.gio2.unix_fdlist;
import gid.glib2.error;
import gid.glib2.types;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Instances of the [gid.gio2.dbus_method_invocation.DBusMethodInvocation] class are used when
    handling D-Bus method calls. It provides a way to asynchronously
    return results and errors.
    
    The normal way to obtain a [gid.gio2.dbus_method_invocation.DBusMethodInvocation] object is to receive
    it as an argument to the `handle_method_call()` function in a
    [gid.gio2.types.DBusInterfaceVTable] that was passed to
    [gid.gio2.dbus_connection.DBusConnection.registerObject].
*/
class DBusMethodInvocation : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_dbus_method_invocation_get_type != &gidSymbolNotFound ? g_dbus_method_invocation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusMethodInvocation";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusMethodInvocation self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_method_invocation.DBusMethodInvocation]
      Returns: New builder object
  */
  static DBusMethodInvocationGidBuilder builder() nothrow
  {
    return new DBusMethodInvocationGidBuilder;
  }

  /**
      Gets the #GDBusConnection the method was invoked on.
      Returns: A #GDBusConnection. Do not free, it is owned by invocation.
  */
  gid.gio2.dbus_connection.DBusConnection getConnection() nothrow
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_method_invocation_get_connection(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the D-Bus interface the method was invoked on.
      
      This can be `NULL` if it was not specified by the sender. See
      [gid.gio2.types.DBusInterfaceMethodCallFunc] or the
      [D-Bus Specification](https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-types-method)
      for details on when this can happen and how it should be handled.
      
      If this method call is a property Get, Set or GetAll call that has
      been redirected to the method call handler then
      "org.freedesktop.DBus.Properties" will be returned.  See
      #GDBusInterfaceVTable for more information.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getInterfaceName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_interface_name(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the #GDBusMessage for the method invocation. This is useful if
      you need to use low-level protocol features, such as UNIX file
      descriptor passing, that cannot be properly expressed in the
      #GVariant API.
      
      See this [server][gid.gio2.dbus_connection.DBusConnection]
      and [client][gid.gio2.dbus_connection.DBusConnection]
      for an example of how to use this low-level API to send and receive
      UNIX file descriptors.
      Returns: #GDBusMessage. Do not free, it is owned by invocation.
  */
  gid.gio2.dbus_message.DBusMessage getMessage() nothrow
  {
    GDBusMessage* _cretval;
    _cretval = g_dbus_method_invocation_get_message(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets information about the method call, if any.
      
      If this method invocation is a property Get, Set or GetAll call that
      has been redirected to the method call handler then null will be
      returned.  See [gid.gio2.dbus_method_invocation.DBusMethodInvocation.getPropertyInfo] and
      #GDBusInterfaceVTable for more information.
      Returns: A #GDBusMethodInfo or null. Do not free, it is owned by invocation.
  */
  gid.gio2.dbus_method_info.DBusMethodInfo getMethodInfo() nothrow
  {
    const(GDBusMethodInfo)* _cretval;
    _cretval = g_dbus_method_invocation_get_method_info(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.dbus_method_info.DBusMethodInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the name of the method that was invoked.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getMethodName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_method_name(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the object path the method was invoked on.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getObjectPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_object_path(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the parameters of the method invocation. If there are no input
      parameters then this will return a GVariant with 0 children rather than NULL.
      Returns: A #GVariant tuple. Do not unref this because it is owned by invocation.
  */
  gid.glib2.variant.Variant getParameters() nothrow
  {
    GVariant* _cretval;
    _cretval = g_dbus_method_invocation_get_parameters(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets information about the property that this method call is for, if
      any.
      
      This will only be set in the case of an invocation in response to a
      property Get or Set call that has been directed to the method call
      handler for an object on account of its property_get() or
      property_set() vtable pointers being unset.
      
      See #GDBusInterfaceVTable for more information.
      
      If the call was GetAll, null will be returned.
      Returns: a #GDBusPropertyInfo or null
  */
  gid.gio2.dbus_property_info.DBusPropertyInfo getPropertyInfo() nothrow
  {
    const(GDBusPropertyInfo)* _cretval;
    _cretval = g_dbus_method_invocation_get_property_info(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.dbus_property_info.DBusPropertyInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the bus name that invoked the method.
      
      This can return null if not specified by the caller, e.g. on peer-to-peer
      connections.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getSender() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_sender(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Finishes handling a D-Bus method call by returning an error.
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
  
      Params:
        errorName = A valid D-Bus error name.
        errorMessage = A valid D-Bus error message.
  */
  void returnDbusError(string errorName, string errorMessage) nothrow
  {
    const(char)* _errorName = errorName.toCString!(No.Malloc, No.Nullable);
    const(char)* _errorMessage = errorMessage.toCString!(No.Malloc, No.Nullable);
    g_dbus_method_invocation_return_dbus_error(cast(GDBusMethodInvocation*)this._cPtr(Yes.Dup), _errorName, _errorMessage);
  }

  /**
      Like [gid.gio2.dbus_method_invocation.DBusMethodInvocation.returnError] but without printf()-style formatting.
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
  
      Params:
        domain = A #GQuark for the #GError error domain.
        code = The error code.
        message = The error message.
  */
  void returnErrorLiteral(gid.glib2.types.Quark domain, int code, string message) nothrow
  {
    const(char)* _message = message.toCString!(No.Malloc, No.Nullable);
    g_dbus_method_invocation_return_error_literal(cast(GDBusMethodInvocation*)this._cPtr(Yes.Dup), domain, code, _message);
  }

  /**
      Like [gid.gio2.dbus_method_invocation.DBusMethodInvocation.returnError] but takes a #GError
      instead of the error domain, error code and message.
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
  
      Params:
        error = A #GError.
  */
  void returnGerror(gid.glib2.error.ErrorWrap error) nothrow
  {
    g_dbus_method_invocation_return_gerror(cast(GDBusMethodInvocation*)this._cPtr(Yes.Dup), error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
  }

  /**
      Finishes handling a D-Bus method call by returning parameters.
      If the parameters GVariant is floating, it is consumed.
      
      It is an error if parameters is not of the right format: it must be a tuple
      containing the out-parameters of the D-Bus method. Even if the method has a
      single out-parameter, it must be contained in a tuple. If the method has no
      out-parameters, parameters may be null or an empty tuple.
      
      ```c
      GDBusMethodInvocation *invocation = some_invocation;
      g_autofree gchar *result_string = NULL;
      g_autoptr (GError) error = NULL;
      
      result_string = calculate_result (&error);
      
      if (error != NULL)
        g_dbus_method_invocation_return_gerror (invocation, error);
      else
        g_dbus_method_invocation_return_value (invocation,
                                               g_variant_new ("(s)", result_string));
      
      // Do not free invocation here; returning a value does that
      ```
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
      
      Since 2.48, if the method call requested for a reply not to be sent
      then this call will sink parameters and free invocation, but
      otherwise do nothing (as per the recommendations of the D-Bus
      specification).
  
      Params:
        parameters = A #GVariant tuple with out parameters for the method or null if not passing any parameters.
  */
  void returnValue(gid.glib2.variant.Variant parameters = null) nothrow
  {
    g_dbus_method_invocation_return_value(cast(GDBusMethodInvocation*)this._cPtr(Yes.Dup), parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null);
  }

  /**
      Like [gid.gio2.dbus_method_invocation.DBusMethodInvocation.returnValue] but also takes a #GUnixFDList.
      
      This method is only available on UNIX.
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
  
      Params:
        parameters = A #GVariant tuple with out parameters for the method or null if not passing any parameters.
        fdList = A #GUnixFDList or null.
  */
  void returnValueWithUnixFdList(gid.glib2.variant.Variant parameters = null, gid.gio2.unix_fdlist.UnixFDList fdList = null) nothrow
  {
    g_dbus_method_invocation_return_value_with_unix_fd_list(cast(GDBusMethodInvocation*)this._cPtr(Yes.Dup), parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_method_invocation.DBusMethodInvocation]
class DBusMethodInvocationGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.dbus_method_invocation.DBusMethodInvocation]
final class DBusMethodInvocationGidBuilder : DBusMethodInvocationGidBuilderImpl!DBusMethodInvocationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusMethodInvocation build() nothrow
  {
    return new DBusMethodInvocation(cast(void*)createGObject(DBusMethodInvocation._getGType), Yes.Take);
  }
}
