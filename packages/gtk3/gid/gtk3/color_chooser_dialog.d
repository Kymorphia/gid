/// Module for [ColorChooserDialog] class
module gid.gtk3.color_chooser_dialog;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.color_chooser;
import gid.gtk3.color_chooser_mixin;
import gid.gtk3.dialog;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    The #GtkColorChooserDialog widget is a dialog for choosing
    a color. It implements the #GtkColorChooser interface.
*/
class ColorChooserDialog : gid.gtk3.dialog.Dialog, gid.gtk3.color_chooser.ColorChooser
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
    return cast(void function())gtk_color_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_color_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkColorChooserDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorChooserDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.color_chooser_dialog.ColorChooserDialog]
      Returns: New builder object
  */
  static ColorChooserDialogGidBuilder builder() nothrow
  {
    return new ColorChooserDialogGidBuilder;
  }

  /** */
  @property bool showEditor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /** */
  @property void showEditor(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new #GtkColorChooserDialog.
  
      Params:
        title = Title of the dialog, or null
        parent = Transient parent of the dialog, or null
      Returns: a new #GtkColorChooserDialog
  */
  this(string title = null, gid.gtk3.window.Window parent = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, title !is null || parent !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_color_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.color_chooser_dialog.ColorChooserDialog]
class ColorChooserDialogGidBuilderImpl(T) : gid.gtk3.dialog.DialogGidBuilderImpl!T, gid.gtk3.color_chooser.ColorChooserGidBuilderImpl!T
{

  mixin ColorChooserGidBuilderT!();

  /** */
  T showEditor(bool propval) nothrow
  {
    return setProperty("show-editor", propval);
  }
}

/// Fluent builder for [gid.gtk3.color_chooser_dialog.ColorChooserDialog]
final class ColorChooserDialogGidBuilder : ColorChooserDialogGidBuilderImpl!ColorChooserDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorChooserDialog build() nothrow
  {
    return new ColorChooserDialog(cast(void*)createGObject(ColorChooserDialog._getGType), Yes.Take);
  }
}
