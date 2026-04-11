/// Module for [DBusMethodInvocation] class
module gio.dbus_method_invocation;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_connection;
import gio.dbus_message;
import gio.dbus_method_info;
import gio.dbus_property_info;
import gio.types;
import gio.unix_fdlist;
import glib.error;
import glib.types;
import glib.variant;
import gobject.gid_builder;
import gobject.object;

/**
    Instances of the [gio.dbus_method_invocation.DBusMethodInvocation] class are used when
    handling D-Bus method calls. It provides a way to asynchronously
    return results and errors.
    
    The normal way to obtain a [gio.dbus_method_invocation.DBusMethodInvocation] object is to receive
    it as an argument to the `handle_method_call()` function in a
    [gio.types.DBusInterfaceVTable] that was passed to
    [gio.dbus_connection.DBusConnection.registerObject].
*/
class DBusMethodInvocation : gobject.object.ObjectWrap
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
    return cast(void function())g_dbus_method_invocation_get_type != &gidSymbolNotFound ? g_dbus_method_invocation_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusMethodInvocation self()
  {
    return this;
  }

  /**
      Get builder for [gio.dbus_method_invocation.DBusMethodInvocation]
      Returns: New builder object
  */
  static DBusMethodInvocationGidBuilder builder()
  {
    return new DBusMethodInvocationGidBuilder;
  }

  /**
      Gets the #GDBusConnection the method was invoked on.
      Returns: A #GDBusConnection. Do not free, it is owned by invocation.
  */
  gio.dbus_connection.DBusConnection getConnection()
  {
    GDBusConnection* _cretval;
    _cretval = g_dbus_method_invocation_get_connection(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of the D-Bus interface the method was invoked on.
      
      If this method call is a property Get, Set or GetAll call that has
      been redirected to the method call handler then
      "org.freedesktop.DBus.Properties" will be returned.  See
      #GDBusInterfaceVTable for more information.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getInterfaceName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_interface_name(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the #GDBusMessage for the method invocation. This is useful if
      you need to use low-level protocol features, such as UNIX file
      descriptor passing, that cannot be properly expressed in the
      #GVariant API.
      
      See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
      for an example of how to use this low-level API to send and receive
      UNIX file descriptors.
      Returns: #GDBusMessage. Do not free, it is owned by invocation.
  */
  gio.dbus_message.DBusMessage getMessage()
  {
    GDBusMessage* _cretval;
    _cretval = g_dbus_method_invocation_get_message(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_message.DBusMessage)(cast(GDBusMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets information about the method call, if any.
      
      If this method invocation is a property Get, Set or GetAll call that
      has been redirected to the method call handler then null will be
      returned.  See [gio.dbus_method_invocation.DBusMethodInvocation.getPropertyInfo] and
      #GDBusInterfaceVTable for more information.
      Returns: A #GDBusMethodInfo or null. Do not free, it is owned by invocation.
  */
  gio.dbus_method_info.DBusMethodInfo getMethodInfo()
  {
    const(GDBusMethodInfo)* _cretval;
    _cretval = g_dbus_method_invocation_get_method_info(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = _cretval ? new gio.dbus_method_info.DBusMethodInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the name of the method that was invoked.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getMethodName()
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_method_name(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the object path the method was invoked on.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_object_path(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the parameters of the method invocation. If there are no input
      parameters then this will return a GVariant with 0 children rather than NULL.
      Returns: A #GVariant tuple. Do not unref this because it is owned by invocation.
  */
  glib.variant.Variant getParameters()
  {
    GVariant* _cretval;
    _cretval = g_dbus_method_invocation_get_parameters(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
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
  gio.dbus_property_info.DBusPropertyInfo getPropertyInfo()
  {
    const(GDBusPropertyInfo)* _cretval;
    _cretval = g_dbus_method_invocation_get_property_info(cast(GDBusMethodInvocation*)this._cPtr);
    auto _retval = _cretval ? new gio.dbus_property_info.DBusPropertyInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the bus name that invoked the method.
      Returns: A string. Do not free, it is owned by invocation.
  */
  string getSender()
  {
    const(char)* _cretval;
    _cretval = g_dbus_method_invocation_get_sender(cast(GDBusMethodInvocation*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  void returnDbusError(string errorName, string errorMessage)
  {
    const(char)* _errorName = errorName.toCString(No.Alloc);
    const(char)* _errorMessage = errorMessage.toCString(No.Alloc);
    g_dbus_method_invocation_return_dbus_error(cast(GDBusMethodInvocation*)this._cPtr, _errorName, _errorMessage);
  }

  /**
      Like [gio.dbus_method_invocation.DBusMethodInvocation.returnError] but without printf()-style formatting.
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
  
      Params:
        domain = A #GQuark for the #GError error domain.
        code = The error code.
        message = The error message.
  */
  void returnErrorLiteral(glib.types.Quark domain, int code, string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    g_dbus_method_invocation_return_error_literal(cast(GDBusMethodInvocation*)this._cPtr, domain, code, _message);
  }

  /**
      Like [gio.dbus_method_invocation.DBusMethodInvocation.returnError] but takes a #GError
      instead of the error domain, error code and message.
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
  
      Params:
        error = A #GError.
  */
  void returnGerror(glib.error.ErrorWrap error)
  {
    g_dbus_method_invocation_return_gerror(cast(GDBusMethodInvocation*)this._cPtr, error ? cast(const(GError)*)error._cPtr : null);
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
  void returnValue(glib.variant.Variant parameters = null)
  {
    g_dbus_method_invocation_return_value(cast(GDBusMethodInvocation*)this._cPtr, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null);
  }

  /**
      Like [gio.dbus_method_invocation.DBusMethodInvocation.returnValue] but also takes a #GUnixFDList.
      
      This method is only available on UNIX.
      
      This method will take ownership of invocation. See
      #GDBusInterfaceVTable for more information about the ownership of
      invocation.
  
      Params:
        parameters = A #GVariant tuple with out parameters for the method or null if not passing any parameters.
        fdList = A #GUnixFDList or null.
  */
  void returnValueWithUnixFdList(glib.variant.Variant parameters = null, gio.unix_fdlist.UnixFDList fdList = null)
  {
    g_dbus_method_invocation_return_value_with_unix_fd_list(cast(GDBusMethodInvocation*)this._cPtr, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gio.dbus_method_invocation.DBusMethodInvocation]
class DBusMethodInvocationGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gio.dbus_method_invocation.DBusMethodInvocation]
final class DBusMethodInvocationGidBuilder : DBusMethodInvocationGidBuilderImpl!DBusMethodInvocationGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusMethodInvocation build()
  {
    return new DBusMethodInvocation(cast(void*)createGObject(DBusMethodInvocation._getGType), No.Take);
  }
}
