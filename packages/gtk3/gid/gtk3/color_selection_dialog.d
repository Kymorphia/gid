/// Module for [ColorSelectionDialog] class
module gid.gtk3.color_selection_dialog;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.dialog;
import gid.gtk3.types;
import gid.gtk3.widget;

/** */
class ColorSelectionDialog : gid.gtk3.dialog.Dialog
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
    return cast(void function())gtk_color_selection_dialog_get_type != &gidSymbolNotFound ? gtk_color_selection_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkColorSelectionDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorSelectionDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.color_selection_dialog.ColorSelectionDialog]
      Returns: New builder object
  */
  static ColorSelectionDialogGidBuilder builder() nothrow
  {
    return new ColorSelectionDialogGidBuilder;
  }

  /** */
  @property gid.gtk3.widget.Widget cancelButton() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.widget.Widget)("cancel-button");
  }

  /** */
  @property gid.gtk3.widget.Widget colorSelection() nothrow
  {
    return getColorSelection();
  }

  /** */
  @property gid.gtk3.widget.Widget helpButton() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.widget.Widget)("help-button");
  }

  /** */
  @property gid.gtk3.widget.Widget okButton() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.widget.Widget)("ok-button");
  }

  /**
      Creates a new #GtkColorSelectionDialog.
  
      Params:
        title = a string containing the title text for the dialog.
      Returns: a #GtkColorSelectionDialog.
  */
  this(string title) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_color_selection_dialog_new(_title);
    this(_cretval, No.Take);
  }

  /**
      Retrieves the #GtkColorSelection widget embedded in the dialog.
      Returns: the embedded #GtkColorSelection
  */
  gid.gtk3.widget.Widget getColorSelection() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_selection_dialog_get_color_selection(cast(GtkColorSelectionDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk3.color_selection_dialog.ColorSelectionDialog]
class ColorSelectionDialogGidBuilderImpl(T) : gid.gtk3.dialog.DialogGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.color_selection_dialog.ColorSelectionDialog]
final class ColorSelectionDialogGidBuilder : ColorSelectionDialogGidBuilderImpl!ColorSelectionDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorSelectionDialog build() nothrow
  {
    return new ColorSelectionDialog(cast(void*)createGObject(ColorSelectionDialog._getGType), Yes.Take);
  }
}
