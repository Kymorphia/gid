/// Module for [UserMessage] class
module gid.webkit6.user_message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.unix_fdlist;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Message that can be sent between the UI process and web process extensions.
    
    A WebKitUserMessage is a message that can be used for the communication between the UI process
    and web process extensions. A WebKitUserMessage always has a name, and it can also include parameters and
    UNIX file descriptors. Messages can be sent from a #WebKitWebContext to all web process extensions,
    from a web process extension to its corresponding #WebKitWebContext, and from a #WebKitWebView to its
    corresponding #WebKitWebPage (and vice versa). One to one messages can be replied to directly with
    [gid.webkitwebprocessextension6.user_message.UserMessage.sendReply].
*/
class UserMessage : gid.gobject2.initially_unowned.InitiallyUnowned
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
    return cast(void function())webkit_user_message_get_type != &gidSymbolNotFound ? webkit_user_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitUserMessage";
  }

  /** Returns `this`, for use in `with` statements. */
  override UserMessage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.user_message.UserMessage]
      Returns: New builder object
  */
  static UserMessageGidBuilder builder() nothrow
  {
    return new UserMessageGidBuilder;
  }

  /**
      Get `fdList` property.
      Returns: The UNIX file descriptors of the user message.
  */
  @property gid.gio2.unix_fdlist.UnixFDList fdList() nothrow
  {
    return getFdList();
  }

  /**
      Get `name` property.
      Returns: The name of the user message.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `parameters` property.
      Returns: The parameters of the user message as a #GVariant, or null
        if the message doesn't include parameters. Note that only complete types are
        allowed.
  */
  @property gid.glib2.variant.Variant parameters() nothrow
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
  this(string name, gid.glib2.variant.Variant parameters = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      WebKitUserMessage* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      _cretval = webkit_user_message_new(_name, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Create a new #WebKitUserMessage including also a list of UNIX file descriptors to be sent.
  
      Params:
        name = the message name
        parameters = the message parameters as a #GVariant
        fdList = the message file descriptors
      Returns: the newly created #WebKitUserMessage object.
  */
  static gid.webkit6.user_message.UserMessage newWithFdList(string name, gid.glib2.variant.Variant parameters = null, gid.gio2.unix_fdlist.UnixFDList fdList = null) nothrow
  {
    WebKitUserMessage* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_user_message_new_with_fd_list(_name, parameters ? cast(GVariant*)parameters._cPtr(No.Dup) : null, fdList ? cast(GUnixFDList*)fdList._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.user_message.UserMessage)(cast(WebKitUserMessage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the message list of file descritpor.
      Returns: the message list of file descriptors
  */
  gid.gio2.unix_fdlist.UnixFDList getFdList() nothrow
  {
    GUnixFDList* _cretval;
    _cretval = webkit_user_message_get_fd_list(cast(WebKitUserMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.unix_fdlist.UnixFDList)(cast(GUnixFDList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the message name.
      Returns: the message name
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_user_message_get_name(cast(WebKitUserMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the message parameters.
      Returns: the message parameters
  */
  gid.glib2.variant.Variant getParameters() nothrow
  {
    GVariant* _cretval;
    _cretval = webkit_user_message_get_parameters(cast(WebKitUserMessage*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
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
  void sendReply(gid.webkit6.user_message.UserMessage reply) nothrow
  {
    webkit_user_message_send_reply(cast(WebKitUserMessage*)this._cPtr, reply ? cast(WebKitUserMessage*)reply._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.webkit6.user_message.UserMessage]
class UserMessageGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{

  /**
      Set `fdList` property.
      Params:
        propval = The UNIX file descriptors of the user message.
      Returns: Builder instance for fluent chaining
  */
  T fdList(gid.gio2.unix_fdlist.UnixFDList propval) nothrow
  {
    return setProperty("fd-list", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the user message.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
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
  T parameters(gid.glib2.variant.Variant propval) nothrow
  {
    return setProperty("parameters", propval);
  }
}

/// Fluent builder for [gid.webkit6.user_message.UserMessage]
final class UserMessageGidBuilder : UserMessageGidBuilderImpl!UserMessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UserMessage build() nothrow
  {
    return new UserMessage(cast(void*)createGObject(UserMessage._getGType), Yes.Take);
  }
}
