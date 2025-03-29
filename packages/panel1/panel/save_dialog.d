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

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())panel_save_dialog_get_type != &gidSymbolNotFound ? panel_save_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SaveDialog self()
  {
    return this;
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
    panel_save_dialog_add_delegate(cast(PanelSaveDialog*)cPtr, delegate_ ? cast(PanelSaveDelegate*)delegate_.cPtr(No.Dup) : null);
  }

  /** */
  bool getCloseAfterSave()
  {
    bool _retval;
    _retval = panel_save_dialog_get_close_after_save(cast(PanelSaveDialog*)cPtr);
    return _retval;
  }

  /** */
  void runAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!(gobject.object.ObjectG)(cast(void*)sourceObject, No.Take), ObjectG.getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    panel_save_dialog_run_async(cast(PanelSaveDialog*)cPtr, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  bool runFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = panel_save_dialog_run_finish(cast(PanelSaveDialog*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /** */
  void setCloseAfterSave(bool closeAfterSave)
  {
    panel_save_dialog_set_close_after_save(cast(PanelSaveDialog*)cPtr, closeAfterSave);
  }
}
