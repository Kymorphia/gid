/// Module for [SaveDialog] class
module gid.panel1.save_dialog;

public import gid.core.basictypes;
import gid.adw1.message_dialog;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.save_delegate;
import gid.panel1.types;

/** */
class SaveDialog : gid.adw1.message_dialog.MessageDialog
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
    return cast(void function())panel_save_dialog_get_type != &gidSymbolNotFound ? panel_save_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelSaveDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override SaveDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.save_dialog.SaveDialog]
      Returns: New builder object
  */
  static SaveDialogGidBuilder builder() nothrow
  {
    return new SaveDialogGidBuilder;
  }

  /**
      Get `closeAfterSave` property.
      Returns: This property requests that the widget close after saving.
  
      Deprecated: Use `class@PanelChangesDialog`
  */
  @property bool closeAfterSave() nothrow
  {
    return getCloseAfterSave();
  }

  /**
      Set `closeAfterSave` property.
      Params:
        propval = This property requests that the widget close after saving.
  
      Deprecated: Use `class@PanelChangesDialog`
  */
  @property void closeAfterSave(bool propval) nothrow
  {
    setCloseAfterSave(propval);
  }

  /**
      Create a new #PanelSaveDialog.
      Returns: a newly created #PanelSaveDialog
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = panel_save_dialog_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  void addDelegate(gid.panel1.save_delegate.SaveDelegate delegate_) nothrow
  {
    panel_save_dialog_add_delegate(cast(PanelSaveDialog*)this._cPtr, delegate_ ? cast(PanelSaveDelegate*)delegate_._cPtr(No.Dup) : null);
  }

  /** */
  bool getCloseAfterSave() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_save_dialog_get_close_after_save(cast(PanelSaveDialog*)this._cPtr);
    return _retval;
  }

  /** */
  void runAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_save_dialog_run_async(cast(PanelSaveDialog*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool runFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_save_dialog_run_finish(cast(PanelSaveDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  void setCloseAfterSave(bool closeAfterSave) nothrow
  {
    panel_save_dialog_set_close_after_save(cast(PanelSaveDialog*)this._cPtr, closeAfterSave);
  }
}

/// Fluent builder implementation template for [gid.panel1.save_dialog.SaveDialog]
class SaveDialogGidBuilderImpl(T) : gid.adw1.message_dialog.MessageDialogGidBuilderImpl!T
{


  /**
      Set `closeAfterSave` property.
      Params:
        propval = This property requests that the widget close after saving.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use `class@PanelChangesDialog`
  */
  T closeAfterSave(bool propval) nothrow
  {
    return setProperty("close-after-save", propval);
  }
}

/// Fluent builder for [gid.panel1.save_dialog.SaveDialog]
final class SaveDialogGidBuilder : SaveDialogGidBuilderImpl!SaveDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SaveDialog build() nothrow
  {
    return new SaveDialog(cast(void*)createGObject(SaveDialog._getGType), Yes.Take);
  }
}
