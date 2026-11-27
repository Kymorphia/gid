/// Module for [NativeDialog] class
module gid.gtk3.native_dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    Native dialogs are platform dialogs that don't use #GtkDialog or
    #GtkWindow. They are used in order to integrate better with a
    platform, by looking the same as other native applications and
    supporting platform specific features.
    
    The #GtkDialog functions cannot be used on such objects, but we
    need a similar API in order to drive them. The #GtkNativeDialog
    object is an API that allows you to do this. It allows you to set
    various common properties on the dialog, as well as show and hide
    it and get a #GtkNativeDialog::response signal when the user finished
    with the dialog.
    
    There is also a [gid.gtk3.native_dialog.NativeDialog.run] helper that makes it easy
    to run any native dialog in a modal way with a recursive mainloop,
    similar to [gid.gtk3.dialog.Dialog.run].
*/
@gidGir("NativeDialog", "NativeDialogClass")
class NativeDialog : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_native_dialog_get_type != &gidSymbolNotFound ? gtk_native_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkNativeDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override NativeDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.native_dialog.NativeDialog]
      Returns: New builder object
  */
  static NativeDialogGidBuilder builder() nothrow
  {
    return new NativeDialogGidBuilder;
  }

  /**
      Get `modal` property.
      Returns: Whether the window should be modal with respect to its transient parent.
  */
  @property bool modal() nothrow
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the window should be modal with respect to its transient parent.
  */
  @property void modal(bool propval) nothrow
  {
    setModal(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the dialog window
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the dialog window
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `transientFor` property.
      Returns: The transient parent of the dialog, or null for none.
  */
  @property gid.gtk3.window.Window transientFor() nothrow
  {
    return getTransientFor();
  }

  /**
      Set `transientFor` property.
      Params:
        propval = The transient parent of the dialog, or null for none.
  */
  @property void transientFor(gid.gtk3.window.Window propval) nothrow
  {
    setTransientFor(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether the window is currenlty visible.
  */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the window is currenlty visible.
  */
  @property void visible(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("visible", propval);
  }

  /**
      Hides the dialog if it is visilbe, aborting any interaction. Once this
      is called the  #GtkNativeDialog::response signal will not be emitted
      until after the next call to [gid.gtk4.native_dialog.NativeDialog.show].
      
      If the dialog is not visible this does nothing.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncHide` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncHide()
  {
    auto _klass = cast(GtkNativeDialogClass*)_vfuncClass;
    if (!_klass.hide)
      return;

    _klass.hide(cast(GtkNativeDialog*)this._cPtr);
  }

  /** */
  protected void vfuncResponse(int responseId)
  {
    auto _klass = cast(GtkNativeDialogClass*)_vfuncClass;
    if (!_klass.response)
      return;

    _klass.response(cast(GtkNativeDialog*)this._cPtr, responseId);
  }

  /**
      Shows the dialog on the display, allowing the user to interact with
      it. When the user accepts the state of the dialog the dialog will
      be automatically hidden and the #GtkNativeDialog::response signal
      will be emitted.
      
      Multiple calls while the dialog is visible will be ignored.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncShow` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncShow()
  {
    auto _klass = cast(GtkNativeDialogClass*)_vfuncClass;
    if (!_klass.show)
      return;

    _klass.show(cast(GtkNativeDialog*)this._cPtr);
  }

  /**
      Destroys a dialog.
      
      When a dialog is destroyed, it will break any references it holds
      to other objects. If it is visible it will be hidden and any underlying
      window system resources will be destroyed.
      
      Note that this does not release any reference to the object (as opposed to
      destroying a GtkWindow) because there is no reference from the windowing
      system to the #GtkNativeDialog.
  */
  void destroy() nothrow
  {
    gtk_native_dialog_destroy(cast(GtkNativeDialog*)this._cPtr);
  }

  /**
      Returns whether the dialog is modal. See [gid.gtk4.native_dialog.NativeDialog.setModal].
      Returns: true if the dialog is set to be modal
  */
  bool getModal() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_native_dialog_get_modal(cast(GtkNativeDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the title of the #GtkNativeDialog.
      Returns: the title of the dialog, or null if none has
           been set explicitly. The returned string is owned by the widget
           and must not be modified or freed.
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_native_dialog_get_title(cast(GtkNativeDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Fetches the transient parent for this window. See
      [gid.gtk4.native_dialog.NativeDialog.setTransientFor].
      Returns: the transient parent for this window,
        or null if no transient parent has been set.
  */
  gid.gtk3.window.Window getTransientFor() nothrow
  {
    GtkWindow* _cretval;
    _cretval = gtk_native_dialog_get_transient_for(cast(GtkNativeDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.window.Window)(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Determines whether the dialog is visible.
      Returns: true if the dialog is visible
  */
  bool getVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_native_dialog_get_visible(cast(GtkNativeDialog*)this._cPtr);
    return _retval;
  }

  /**
      Hides the dialog if it is visilbe, aborting any interaction. Once this
      is called the  #GtkNativeDialog::response signal will not be emitted
      until after the next call to [gid.gtk4.native_dialog.NativeDialog.show].
      
      If the dialog is not visible this does nothing.
  */
  void hide() nothrow
  {
    gtk_native_dialog_hide(cast(GtkNativeDialog*)this._cPtr);
  }

  /**
      Blocks in a recursive main loop until self emits the
      #GtkNativeDialog::response signal. It then returns the response ID
      from the ::response signal emission.
      
      Before entering the recursive main loop, [gid.gtk3.native_dialog.NativeDialog.run]
      calls [gid.gtk4.native_dialog.NativeDialog.show] on the dialog for you.
      
      After [gid.gtk3.native_dialog.NativeDialog.run] returns, then dialog will be hidden.
      
      Typical usage of this function might be:
      ```c
        gint result = gtk_native_dialog_run (GTK_NATIVE_DIALOG (dialog));
        switch (result)
          {
            case GTK_RESPONSE_ACCEPT:
               do_application_specific_something ();
               break;
            default:
               do_nothing_since_dialog_was_cancelled ();
               break;
          }
        g_object_unref (dialog);
      ```
      
      Note that even though the recursive main loop gives the effect of a
      modal dialog (it prevents the user from interacting with other
      windows in the same window group while the dialog is run), callbacks
      such as timeouts, IO channel watches, DND drops, etc, will
      be triggered during a [gid.gtk3.native_dialog.NativeDialog.run] call.
      Returns: response ID
  */
  int run() nothrow
  {
    int _retval;
    _retval = gtk_native_dialog_run(cast(GtkNativeDialog*)this._cPtr);
    return _retval;
  }

  /**
      Sets a dialog modal or non-modal. Modal dialogs prevent interaction
      with other windows in the same application. To keep modal dialogs
      on top of main application windows, use
      [gid.gtk4.native_dialog.NativeDialog.setTransientFor] to make the dialog transient for the
      parent; most [window managers][gtk-X11-arch]
      will then disallow lowering the dialog below the parent.
  
      Params:
        modal = whether the window is modal
  */
  void setModal(bool modal) nothrow
  {
    gtk_native_dialog_set_modal(cast(GtkNativeDialog*)this._cPtr, modal);
  }

  /**
      Sets the title of the #GtkNativeDialog.
  
      Params:
        title = title of the dialog
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    gtk_native_dialog_set_title(cast(GtkNativeDialog*)this._cPtr, _title);
  }

  /**
      Dialog windows should be set transient for the main application
      window they were spawned from. This allows
      [window managers][gtk-X11-arch] to e.g. keep the
      dialog on top of the main window, or center the dialog over the
      main window.
      
      Passing null for parent unsets the current transient window.
  
      Params:
        parent = parent window, or null
  */
  void setTransientFor(gid.gtk3.window.Window parent = null) nothrow
  {
    gtk_native_dialog_set_transient_for(cast(GtkNativeDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
  }

  /**
      Shows the dialog on the display, allowing the user to interact with
      it. When the user accepts the state of the dialog the dialog will
      be automatically hidden and the #GtkNativeDialog::response signal
      will be emitted.
      
      Multiple calls while the dialog is visible will be ignored.
  */
  void show() nothrow
  {
    gtk_native_dialog_show(cast(GtkNativeDialog*)this._cPtr);
  }

  /**
      Connect to `Response` signal.
  
      Emitted when the user responds to the dialog.
        
        When this is called the dialog has been hidden.
        
        If you call [gid.gtk4.native_dialog.NativeDialog.hide] before the user responds to
        the dialog this signal will not be emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int responseId, gid.gtk3.native_dialog.NativeDialog nativeDialog)`
  
          `responseId` the response ID (optional)
  
          `nativeDialog` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectResponse(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.native_dialog.NativeDialog)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.native_dialog.NativeDialog.response");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("response", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from NativeDialog
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.native_dialog.NativeDialog), T.stringof ~ " is not derived from gid.gtk3.native_dialog.NativeDialog");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncHide", true)[0]) == gid.gtk3.native_dialog.NativeDialog))
      _installVfunc(klass, "hide");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResponse", true)[0]) == gid.gtk3.native_dialog.NativeDialog))
      _installVfunc(klass, "response");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncShow", true)[0]) == gid.gtk3.native_dialog.NativeDialog))
      _installVfunc(klass, "show");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkNativeDialogClass*)klass;

    switch (vfunc)
    {
      case "hide":
      {
        static extern(C) void _vfuncHideTramp(GtkNativeDialog* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.native_dialog.NativeDialog)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkNativeDialogClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.hide)
              return (cast(typeof(&_vfuncHideTramp))_klass.hide)(self);
            return;
          }

          try
          {
            _obj.vfuncHide();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.native_dialog.NativeDialog.vfuncHide");
          }
        }

        _klass.hide = cast(typeof(_klass.hide))&_vfuncHideTramp;
        break;
      }
      case "response":
      {
        static extern(C) void _vfuncResponseTramp(GtkNativeDialog* self, int responseId) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.native_dialog.NativeDialog)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkNativeDialogClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.response)
              return (cast(typeof(&_vfuncResponseTramp))_klass.response)(self, responseId);
            return;
          }

          try
          {
            _obj.vfuncResponse(responseId);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.native_dialog.NativeDialog.vfuncResponse");
          }
        }

        _klass.response = cast(typeof(_klass.response))&_vfuncResponseTramp;
        break;
      }
      case "show":
      {
        static extern(C) void _vfuncShowTramp(GtkNativeDialog* self) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.native_dialog.NativeDialog)(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkNativeDialogClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.show)
              return (cast(typeof(&_vfuncShowTramp))_klass.show)(self);
            return;
          }

          try
          {
            _obj.vfuncShow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.native_dialog.NativeDialog.vfuncShow");
          }
        }

        _klass.show = cast(typeof(_klass.show))&_vfuncShowTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.native_dialog.NativeDialog]
class NativeDialogGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `modal` property.
      Params:
        propval = Whether the window should be modal with respect to its transient parent.
      Returns: Builder instance for fluent chaining
  */
  T modal(bool propval) nothrow
  {
    return setProperty("modal", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the dialog window
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `transientFor` property.
      Params:
        propval = The transient parent of the dialog, or null for none.
      Returns: Builder instance for fluent chaining
  */
  T transientFor(gid.gtk3.window.Window propval) nothrow
  {
    return setProperty("transient-for", propval);
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the window is currenlty visible.
      Returns: Builder instance for fluent chaining
  */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }
}

/// Fluent builder for [gid.gtk3.native_dialog.NativeDialog]
final class NativeDialogGidBuilder : NativeDialogGidBuilderImpl!NativeDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NativeDialog build() nothrow
  {
    return new NativeDialog(cast(void*)createGObject(NativeDialog._getGType), Yes.Take);
  }
}
