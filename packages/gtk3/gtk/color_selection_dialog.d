/// Module for [ColorSelectionDialog] class
module gtk.color_selection_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.dialog;
import gtk.types;
import gtk.widget;

/** */
class ColorSelectionDialog : gtk.dialog.Dialog
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
    return cast(void function())gtk_color_selection_dialog_get_type != &gidSymbolNotFound ? gtk_color_selection_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorSelectionDialog self()
  {
    return this;
  }

  /**
      Get builder for [gtk.color_selection_dialog.ColorSelectionDialog]
      Returns: New builder object
  */
  static ColorSelectionDialogGidBuilder builder()
  {
    return new ColorSelectionDialogGidBuilder;
  }

  /** */
  @property gtk.widget.Widget cancelButton()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("cancel-button");
  }

  /** */
  @property gtk.widget.Widget colorSelection()
  {
    return getColorSelection();
  }

  /** */
  @property gtk.widget.Widget helpButton()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("help-button");
  }

  /** */
  @property gtk.widget.Widget okButton()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("ok-button");
  }

  /**
      Creates a new #GtkColorSelectionDialog.
  
      Params:
        title = a string containing the title text for the dialog.
      Returns: a #GtkColorSelectionDialog.
  */
  this(string title)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_color_selection_dialog_new(_title);
    this(_cretval, No.Take);
  }

  /**
      Retrieves the #GtkColorSelection widget embedded in the dialog.
      Returns: the embedded #GtkColorSelection
  */
  gtk.widget.Widget getColorSelection()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_selection_dialog_get_color_selection(cast(GtkColorSelectionDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gtk.color_selection_dialog.ColorSelectionDialog]
class ColorSelectionDialogGidBuilderImpl(T) : gtk.dialog.DialogGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.color_selection_dialog.ColorSelectionDialog]
final class ColorSelectionDialogGidBuilder : ColorSelectionDialogGidBuilderImpl!ColorSelectionDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorSelectionDialog build()
  {
    return new ColorSelectionDialog(cast(void*)createGObject(ColorSelectionDialog._getGType), No.Take);
  }
}
