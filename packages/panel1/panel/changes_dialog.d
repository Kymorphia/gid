/// Module for [ChangesDialog] class
module panel.changes_dialog;

public import gid.basictypes;
import adw.alert_dialog;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import panel.c.functions;
import panel.c.types;
import panel.save_delegate;
import panel.types;

/** */
class ChangesDialog : adw.alert_dialog.AlertDialog
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_changes_dialog_get_type != &gidSymbolNotFound ? panel_changes_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ChangesDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [panel.changes_dialog.ChangesDialog]
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
  void addDelegate(panel.save_delegate.SaveDelegate delegate_) nothrow
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
  void runAsync(gtk.widget.Widget parent, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gio.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_changes_dialog_run_async(cast(PanelChangesDialog*)this._cPtr, parent ? cast(GtkWidget*)parent._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool runFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_changes_dialog_run_finish(cast(PanelChangesDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  void setCloseAfterSave(bool closeAfterSave) nothrow
  {
    panel_changes_dialog_set_close_after_save(cast(PanelChangesDialog*)this._cPtr, closeAfterSave);
  }
}

/// Fluent builder implementation template for [panel.changes_dialog.ChangesDialog]
class ChangesDialogGidBuilderImpl(T) : adw.alert_dialog.AlertDialogGidBuilderImpl!T
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

/// Fluent builder for [panel.changes_dialog.ChangesDialog]
final class ChangesDialogGidBuilder : ChangesDialogGidBuilderImpl!ChangesDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ChangesDialog build() nothrow
  {
    return new ChangesDialog(cast(void*)createGObject(ChangesDialog._getGType), No.Take);
  }
}
