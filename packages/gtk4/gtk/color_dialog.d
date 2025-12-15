/// Module for [ColorDialog] class
module gtk.color_dialog;

import gdk.rgba;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.window;

/**
    A [gtk.color_dialog.ColorDialog] object collects the arguments that
    are needed to present a color chooser dialog to the
    user, such as a title for the dialog and whether it
    should be modal.
    
    The dialog is shown with the [gtk.color_dialog.ColorDialog.chooseRgba]
    function. This API follows the GIO async pattern, and the
    result can be obtained by calling
    [gtk.color_dialog.ColorDialog.chooseRgbaFinish].
    
    See [gtk.color_dialog_button.ColorDialogButton] for a convenient control
    that uses [gtk.color_dialog.ColorDialog] and presents the results.
*/
class ColorDialog : gobject.object.ObjectWrap
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
    return cast(void function())gtk_color_dialog_get_type != &gidSymbolNotFound ? gtk_color_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorDialog self()
  {
    return this;
  }

  /**
      Get `modal` property.
      Returns: Whether the color chooser dialog is modal.
  */
  @property bool modal()
  {
    return getModal();
  }

  /**
      Set `modal` property.
      Params:
        propval = Whether the color chooser dialog is modal.
  */
  @property void modal(bool propval)
  {
    return setModal(propval);
  }

  /**
      Get `title` property.
      Returns: A title that may be shown on the color chooser
      dialog that is presented by [gtk.color_dialog.ColorDialog.chooseRgba].
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = A title that may be shown on the color chooser
        dialog that is presented by [gtk.color_dialog.ColorDialog.chooseRgba].
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `withAlpha` property.
      Returns: Whether colors may have alpha (translucency).
      
      When with-alpha is false, the color that is selected
      will be forced to have alpha == 1.
  */
  @property bool withAlpha()
  {
    return getWithAlpha();
  }

  /**
      Set `withAlpha` property.
      Params:
        propval = Whether colors may have alpha (translucency).
        
        When with-alpha is false, the color that is selected
        will be forced to have alpha == 1.
  */
  @property void withAlpha(bool propval)
  {
    return setWithAlpha(propval);
  }

  /**
      Creates a new [gtk.color_dialog.ColorDialog] object.
      Returns: the new [gtk.color_dialog.ColorDialog]
  */
  this()
  {
    GtkColorDialog* _cretval;
    _cretval = gtk_color_dialog_new();
    this(_cretval, Yes.Take);
  }

  /**
      This function initiates a color choice operation by
      presenting a color chooser dialog to the user.
      
      The callback will be called when the dialog is dismissed.
      It should call [gtk.color_dialog.ColorDialog.chooseRgbaFinish]
      to obtain the result.
  
      Params:
        parent = the parent [gtk.window.Window]
        initialColor = the color to select initially
        cancellable = a [gio.cancellable.Cancellable] to cancel the operation
        callback = a callback to call when the operation is complete
  */
  void chooseRgba(gtk.window.Window parent = null, gdk.rgba.RGBA initialColor = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_color_dialog_choose_rgba(cast(GtkColorDialog*)this._cPtr, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null, initialColor ? cast(const(GdkRGBA)*)initialColor._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes the [gtk.color_dialog.ColorDialog.chooseRgba] call and
      returns the resulting color.
  
      Params:
        result = a [gio.async_result.AsyncResult]
      Returns: the selected color, or
          `NULL` and error is set
      Throws: [ErrorWrap]
  */
  gdk.rgba.RGBA chooseRgbaFinish(gio.async_result.AsyncResult result)
  {
    GdkRGBA* _cretval;
    GError *_err;
    _cretval = gtk_color_dialog_choose_rgba_finish(cast(GtkColorDialog*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gdk.rgba.RGBA(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns whether the color chooser dialog
      blocks interaction with the parent window
      while it is presented.
      Returns: `TRUE` if the color chooser dialog is modal
  */
  bool getModal()
  {
    bool _retval;
    _retval = cast(bool)gtk_color_dialog_get_modal(cast(GtkColorDialog*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title that will be shown on the
      color chooser dialog.
      Returns: the title
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_color_dialog_get_title(cast(GtkColorDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether colors may have alpha.
      Returns: `TRUE` if colors may have alpha
  */
  bool getWithAlpha()
  {
    bool _retval;
    _retval = cast(bool)gtk_color_dialog_get_with_alpha(cast(GtkColorDialog*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the color chooser dialog
      blocks interaction with the parent window
      while it is presented.
  
      Params:
        modal = the new value
  */
  void setModal(bool modal)
  {
    gtk_color_dialog_set_modal(cast(GtkColorDialog*)this._cPtr, modal);
  }

  /**
      Sets the title that will be shown on the
      color chooser dialog.
  
      Params:
        title = the new title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_color_dialog_set_title(cast(GtkColorDialog*)this._cPtr, _title);
  }

  /**
      Sets whether colors may have alpha.
  
      Params:
        withAlpha = the new value
  */
  void setWithAlpha(bool withAlpha)
  {
    gtk_color_dialog_set_with_alpha(cast(GtkColorDialog*)this._cPtr, withAlpha);
  }
}
