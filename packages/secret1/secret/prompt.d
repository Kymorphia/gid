/// Module for [Prompt] class
module secret.prompt;

import gid.gid;
import gio.async_initable;
import gio.async_initable_mixin;
import gio.async_result;
import gio.cancellable;
import gio.dbus_interface;
import gio.dbus_interface_mixin;
import gio.dbus_proxy;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import glib.variant;
import glib.variant_type;
import gobject.object;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
    A prompt in the Service
    
    A proxy object representing a prompt that the Secret Service will display
    to the user.
    
    Certain actions on the Secret Service require user prompting to complete,
    such as creating a collection, or unlocking a collection. When such a prompt
    is necessary, then a #SecretPrompt object is created by this library, and
    passed to the [secret.service.Service.prompt] method. In this way it is handled
    automatically.
    
    In order to customize prompt handling, override the
    `vfunc@Service.prompt_async` and `vfunc@Service.prompt_finish` virtual
    methods of the `class@Service` class.
*/
class Prompt : gio.dbus_proxy.DBusProxy
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
    return cast(void function())secret_prompt_get_type != &gidSymbolNotFound ? secret_prompt_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Prompt self()
  {
    return this;
  }

  /**
      Runs a prompt and performs the prompting.
      
      Returns true if the prompt was completed and not dismissed.
      
      If window_id is non-null then it is used as an XWindow id on Linux. The API
      expects this id to be converted to a string using the ``d`` printf format. The
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
  void perform(string windowId, glib.variant_type.VariantType returnType, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _windowId = windowId.toCString(No.Alloc);
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
  glib.variant.Variant performFinish(gio.async_result.AsyncResult result)
  {
    GVariant* _cretval;
    GError *_err;
    _cretval = secret_prompt_perform_finish(cast(SecretPrompt*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Runs a prompt and performs the prompting.
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is defined
      in the Secret Service DBus API specification.
      
      If window_id is non-null then it is used as an XWindow id on Linux. The API
      expects this id to be converted to a string using the ``d`` printf format. The
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
  glib.variant.Variant performSync(string windowId, gio.cancellable.Cancellable cancellable, glib.variant_type.VariantType returnType)
  {
    GVariant* _cretval;
    const(char)* _windowId = windowId.toCString(No.Alloc);
    GError *_err;
    _cretval = secret_prompt_perform_sync(cast(SecretPrompt*)this._cPtr, _windowId, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Runs a prompt and performs the prompting.
      
      Returns a variant result if the prompt was completed and not dismissed. The
      type of result depends on the action the prompt is completing, and is defined
      in the Secret Service DBus API specification.
      
      If window_id is non-null then it is used as an XWindow id on Linux. The API
      expects this id to be converted to a string using the ``d`` printf format. The
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
  glib.variant.Variant run(string windowId, gio.cancellable.Cancellable cancellable, glib.variant_type.VariantType returnType)
  {
    GVariant* _cretval;
    const(char)* _windowId = windowId.toCString(No.Alloc);
    GError *_err;
    _cretval = secret_prompt_run(cast(SecretPrompt*)this._cPtr, _windowId, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, returnType ? cast(const(GVariantType)*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
