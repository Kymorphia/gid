/// Module for [Prompt] class
module gid.secret1.prompt;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_initable;
import gid.gio2.async_initable_mixin;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.dbus_interface;
import gid.gio2.dbus_interface_mixin;
import gid.gio2.dbus_proxy;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.variant;
import gid.glib2.variant_type;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.types;

/**
    A prompt in the Service
    
    A proxy object representing a prompt that the Secret Service will display
    to the user.
    
    Certain actions on the Secret Service require user prompting to complete,
    such as creating a collection, or unlocking a collection. When such a prompt
    is necessary, then a #SecretPrompt object is created by this library, and
    passed to the [gid.secret1.service.Service.prompt] method. In this way it is handled
    automatically.
    
    In order to customize prompt handling, override the
    `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
    methods of the [gid.secret1.service.Service] class.
*/
class Prompt : gid.gio2.dbus_proxy.DBusProxy
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
    return cast(void function())secret_prompt_get_type != &gidSymbolNotFound ? secret_prompt_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SecretPrompt";
  }

  /** Returns `this`, for use in `with` statements. */
  override Prompt self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.secret1.prompt.Prompt]
      Returns: New builder object
  */
  static PromptGidBuilder builder() nothrow
  {
    return new PromptGidBuilder;
  }

  /**
      Runs a prompt and performs the prompting.
      
      Returns true if the prompt was completed and not dismissed.
      
      If window_id is non-null then it is used as an XWindow id on Linux. The API
      expects this id to be converted to a string using the `%d` printf format. The
      Secret Service can make its prompt transient for the window with this id. In
      some Secret Service implementations this is not possible, so the behavior
      depending on this should degrade gracefully.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        windowId = string form of XWindow id for parent window to be transient for
        returnType = the variant type of the prompt result
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  void perform(string windowId, gid.glib2.variant_type.VariantType returnType, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _windowId = windowId.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_prompt_perform(cast(SecretPrompt*)this._cPtr, _windowId, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to run a prompt and perform the prompting.
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is
      defined in the Secret Service DBus API specification.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: null if the prompt was dismissed or an error occurred,
          a variant result if the prompt was successful
      Throws: [ErrorWrap]
  */
  gid.glib2.variant.Variant performFinish(gid.gio2.async_result.AsyncResult result)
  {
    GVariant* _cretval;
    GError *_err;
    _cretval = secret_prompt_perform_finish(cast(SecretPrompt*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Runs a prompt and performs the prompting.
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is defined
      in the Secret Service DBus API specification.
      
      If window_id is non-null then it is used as an XWindow id on Linux. The API
      expects this id to be converted to a string using the `%d` printf format. The
      Secret Service can make its prompt transient for the window with this id. In
      some Secret Service implementations this is not possible, so the behavior
      depending on this should degrade gracefully.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        windowId = string form of XWindow id for parent window to be transient for
        cancellable = optional cancellation object
        returnType = the variant type of the prompt result
      Returns: null if the prompt was dismissed or an error occurred
      Throws: [ErrorWrap]
  */
  gid.glib2.variant.Variant performSync(string windowId, gid.gio2.cancellable.Cancellable cancellable, gid.glib2.variant_type.VariantType returnType)
  {
    GVariant* _cretval;
    const(char)* _windowId = windowId.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = secret_prompt_perform_sync(cast(SecretPrompt*)this._cPtr, _windowId, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Runs a prompt and performs the prompting.
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is defined
      in the Secret Service DBus API specification.
      
      If window_id is non-null then it is used as an XWindow id on Linux. The API
      expects this id to be converted to a string using the `%d` printf format. The
      Secret Service can make its prompt transient for the window with this id. In
      some Secret Service implementations this is not possible, so the behavior
      depending on this should degrade gracefully.
      
      This runs the dialog in a recursive mainloop. When run from a user interface
      thread, this means the user interface will remain responsive. Care should be
      taken that appropriate user interface actions are disabled while running the
      prompt.
  
      Params:
        windowId = string form of XWindow id for parent window to be transient for
        cancellable = optional cancellation object
        returnType = the variant type of the prompt result
      Returns: null if the prompt was dismissed or an error occurred
      Throws: [ErrorWrap]
  */
  gid.glib2.variant.Variant run(string windowId, gid.gio2.cancellable.Cancellable cancellable, gid.glib2.variant_type.VariantType returnType)
  {
    GVariant* _cretval;
    const(char)* _windowId = windowId.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = secret_prompt_run(cast(SecretPrompt*)this._cPtr, _windowId, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.secret1.prompt.Prompt]
class PromptGidBuilderImpl(T) : gid.gio2.dbus_proxy.DBusProxyGidBuilderImpl!T
{

}

/// Fluent builder for [gid.secret1.prompt.Prompt]
final class PromptGidBuilder : PromptGidBuilderImpl!PromptGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Prompt build() nothrow
  {
    return new Prompt(cast(void*)createGObject(Prompt._getGType), Yes.Take);
  }
}
