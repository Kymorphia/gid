/// Module for [SaveDialog] class
module panel.save_dialog;

import adw.message_dialog;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import panel.c.functions;
import panel.c.types;
import panel.save_delegate;
import panel.types;

/** */
class SaveDialog : adw.message_dialog.MessageDialog
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
    return cast(void function())panel_save_dialog_get_type != &gidSymbolNotFound ? panel_save_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SaveDialog self()
  {
    return this;
  }

  /**
      Get `closeAfterSave` property.
      Returns: This property requests that the widget close after saving.
  
      Deprecated: Use `class@PanelChangesDialog`
  */
  @property bool closeAfterSave()
  {
    return getCloseAfterSave();
  }

  /**
      Set `closeAfterSave` property.
      Params:
        propval = This property requests that the widget close after saving.
  
      Deprecated: Use `class@PanelChangesDialog`
  */
  @property void closeAfterSave(bool propval)
  {
    return setCloseAfterSave(propval);
  }

  /**
      Create a new #PanelSaveDialog.
      Returns: a newly created #PanelSaveDialog
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = panel_save_dialog_new();
    this(_cretval, No.Take);
  }

  /** */
  void addDelegate(panel.save_delegate.SaveDelegate delegate_)
  {
    panel_save_dialog_add_delegate(cast(PanelSaveDialog*)this._cPtr, delegate_ ? cast(PanelSaveDelegate*)delegate_._cPtr(No.Dup) : null);
  }

  /** */
  bool getCloseAfterSave()
  {
    bool _retval;
    _retval = cast(bool)panel_save_dialog_get_close_after_save(cast(PanelSaveDialog*)this._cPtr);
    return _retval;
  }

  /** */
  void runAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_save_dialog_run_async(cast(PanelSaveDialog*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool runFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)panel_save_dialog_run_finish(cast(PanelSaveDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  void setCloseAfterSave(bool closeAfterSave)
  {
    panel_save_dialog_set_close_after_save(cast(PanelSaveDialog*)this._cPtr, closeAfterSave);
  }
}
