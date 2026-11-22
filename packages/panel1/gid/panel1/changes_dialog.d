/// Module for [ChangesDialog] class
module gid.panel1.changes_dialog;

public import gid.core.basictypes;
import gid.adw1.alert_dialog;
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
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.widget;
import gid.panel1.c.functions;
import gid.panel1.c.types;
import gid.panel1.save_delegate;
import gid.panel1.types;

/** */
class ChangesDialog : gid.adw1.alert_dialog.AlertDialog
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
    return cast(void function())panel_changes_dialog_get_type != &gidSymbolNotFound ? panel_changes_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PanelChangesDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override ChangesDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.panel1.changes_dialog.ChangesDialog]
      Returns: New builder object
  */
  static ChangesDialogGidBuilder builder() nothrow
  {
    return new ChangesDialogGidBuilder;
  }

  /**
      Get `closeAfterSave` property.
      Returns: This property requests that the widget close after saving.
  */
  @property bool closeAfterSave() nothrow
  {
    return getCloseAfterSave();
  }

  /**
      Set `closeAfterSave` property.
      Params:
        propval = This property requests that the widget close after saving.
  */
  @property void closeAfterSave(bool propval) nothrow
  {
    setCloseAfterSave(propval);
  }

  /**
      Create a new #PanelChangesDialog.
      Returns: a newly created #PanelChangesDialog
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = panel_changes_dialog_new();
    this(_cretval, No.Take);
  }

  /** */
  void addDelegate(gid.panel1.save_delegate.SaveDelegate delegate_) nothrow
  {
    panel_changes_dialog_add_delegate(cast(PanelChangesDialog*)this._cPtr, delegate_ ? cast(PanelSaveDelegate*)delegate_._cPtr(No.Dup) : null);
  }

  /** */
  bool getCloseAfterSave() nothrow
  {
    bool _retval;
    _retval = cast(bool)panel_changes_dialog_get_close_after_save(cast(PanelChangesDialog*)this._cPtr);
    return _retval;
  }

  /** */
  void runAsync(gid.gtk4.widget.Widget parent, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_changes_dialog_run_async(cast(PanelChangesDialog*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool runFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_changes_dialog_run_finish(cast(PanelChangesDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  void setCloseAfterSave(bool closeAfterSave) nothrow
  {
    panel_changes_dialog_set_close_after_save(cast(PanelChangesDialog*)this._cPtr, closeAfterSave);
  }
}

/// Fluent builder implementation template for [gid.panel1.changes_dialog.ChangesDialog]
class ChangesDialogGidBuilderImpl(T) : gid.adw1.alert_dialog.AlertDialogGidBuilderImpl!T
{


  /**
      Set `closeAfterSave` property.
      Params:
        propval = This property requests that the widget close after saving.
      Returns: Builder instance for fluent chaining
  */
  T closeAfterSave(bool propval) nothrow
  {
    return setProperty("close-after-save", propval);
  }
}

/// Fluent builder for [gid.panel1.changes_dialog.ChangesDialog]
final class ChangesDialogGidBuilder : ChangesDialogGidBuilderImpl!ChangesDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ChangesDialog build() nothrow
  {
    return new ChangesDialog(cast(void*)createGObject(ChangesDialog._getGType), Yes.Take);
  }
}
