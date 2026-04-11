/// Module for [UserMessage] class
module webkitwebprocessextension.user_message;

import gid.gid;
import gio.unix_fdlist;
import glib.variant;
import gobject.gid_builder;
import gobject.initially_unowned;
import gobject.object;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.types;

/**
    Message that can be sent between the UI process and web process extensions.
    
    A WebKitUserMessage is a message that can be used for the communication between the UI process
    and web process extensions. A WebKitUserMessage always has a name, and it can also include parameters and
    UNIX file descriptors. Messages can be sent from a #WebKitWebContext to all web process extensions,
    from a web process extension to its corresponding #WebKitWebContext, and from a #WebKitWebView to its
    corresponding #WebKitWebPage (and vice versa). One to one messages can be replied to directly with
    [webkitwebprocessextension.user_message.UserMessage.sendReply].
*/
class UserMessage : gobject.initially_unowned.InitiallyUnowned
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
    return cast(void function())webkit_user_message_get_type != &gidSymbolNotFound ? webkit_user_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UserMessage self()
  {
    return this;
  }

  /**
      Get builder for [webkitwebprocessextension.user_message.UserMessage]
      Returns: New builder object
  */
  static UserMessageGidBuilder builder()
  {
    return new UserMessageGidBuilder;
  }

  /**
      Get `fdList` property.
      Returns: The UNIX file descriptors of the user message.
  */
  @property gio.unix_fdlist.UnixFDList fdList()
  {
    return getFdList();
  }

  /**
      Get `name` property.
      Returns: The name of the user message.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Get `parameters` property.
      Returns: The parameters of the user message as a #GVariant, or null
        if the message doesn't include parameters. Note that only complete types are
        allowed.
  */
  @property glib.variant.Variant parameters()
  {
    return getParameters();
  }

  /**
      Create a new #WebKitUserMessage with name.
  
      Params:
        name = the message name
        parameters = the message parameters as a #GVariant, or null
      Returns: the newly created #WebKitUserMessage object.
  */
  this(string name, glib.variant.Variant parameters = null)
  {
    WebKitUserMessage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = webkit_user_message_new(_name, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Create a new #WebKitUserMessage including also a list of UNIX file descriptors to be sent.
  
      Params:
        name = the message name
        parameters = the message parameters as a #GVariant
        fdList = the message file descriptors
      Returns: the newly created #WebKitUserMessage object.
  */
  static webkitwebprocessextension.user_message.UserMessage newWithFdList(string name, glib.variant.Variant parameters = null, gio.unix_fdlist.UnixFDList fdList = null)
  {
    WebKitUserMessage* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = webkit_user_message_new_with_fd_list(_name, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkitwebprocessextension.user_message.UserMessage)(cast(WebKitUserMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the message list of file descritpor.
      Returns: the message list of file descriptors
  */
  gio.unix_fdlist.UnixFDList getFdList()
  {
    GUnixFDList* _cretval;
    _cretval = webkit_user_message_get_fd_list(cast(WebKitUserMessage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.unix_fdlist.UnixFDList)(cast(GUnixFDList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the message name.
      Returns: the message name
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = webkit_user_message_get_name(cast(WebKitUserMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the message parameters.
      Returns: the message parameters
  */
  glib.variant.Variant getParameters()
  {
    GVariant* _cretval;
    _cretval = webkit_user_message_get_parameters(cast(WebKitUserMessage*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Send a reply to an user message.
      
      If reply is floating, it's consumed.
      You can only send a reply to a #WebKitUserMessage that has been
      received.
  
      Params:
        reply = a #WebKitUserMessage to send as reply
  */
  void sendReply(webkitwebprocessextension.user_message.UserMessage reply)
  {
    webkit_user_message_send_reply(cast(WebKitUserMessage*)this._cPtr, reply ? cast(WebKitUserMessage*)reply._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [webkitwebprocessextension.user_message.UserMessage]
class UserMessageGidBuilderImpl(T) : gobject.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{

  /**
      Set `fdList` property.
      Params:
        propval = The UNIX file descriptors of the user message.
      Returns: Builder instance for fluent chaining
  */
  T fdList(gio.unix_fdlist.UnixFDList propval)
  {
    return setProperty("fd-list", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the user message.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval)
  {
    return setProperty("name", propval);
  }

  /**
      Set `parameters` property.
      Params:
        propval = The parameters of the user message as a #GVariant, or null
          if the message doesn't include parameters. Note that only complete types are
          allowed.
      Returns: Builder instance for fluent chaining
  */
  T parameters(glib.variant.Variant propval)
  {
    return setProperty("parameters", propval);
  }
}

/// Fluent builder for [webkitwebprocessextension.user_message.UserMessage]
final class UserMessageGidBuilder : UserMessageGidBuilderImpl!UserMessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UserMessage build()
  {
    return new UserMessage(cast(void*)createGObject(UserMessage._getGType), No.Take);
  }
}
