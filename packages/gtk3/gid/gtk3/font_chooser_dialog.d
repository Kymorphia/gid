/// Module for [FontChooserDialog] class
module gid.gtk3.font_chooser_dialog;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.dialog;
import gid.gtk3.font_chooser;
import gid.gtk3.font_chooser_mixin;
import gid.gtk3.types;
import gid.gtk3.window;

/**
    The #GtkFontChooserDialog widget is a dialog for selecting a font.
    It implements the #GtkFontChooser interface.
    
    # GtkFontChooserDialog as GtkBuildable
    
    The GtkFontChooserDialog implementation of the #GtkBuildable
    interface exposes the buttons with the names “select_button”
    and “cancel_button”.
*/
class FontChooserDialog : gid.gtk3.dialog.Dialog, gid.gtk3.font_chooser.FontChooser
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
    return cast(void function())gtk_font_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_font_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFontChooserDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontChooserDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.font_chooser_dialog.FontChooserDialog]
      Returns: New builder object
  */
  static FontChooserDialogGidBuilder builder() nothrow
  {
    return new FontChooserDialogGidBuilder;
  }

  mixin FontChooserT!();

  /**
      Creates a new #GtkFontChooserDialog.
  
      Params:
        title = Title of the dialog, or null
        parent = Transient parent of the dialog, or null
      Returns: a new #GtkFontChooserDialog
  */
  this(string title = null, gid.gtk3.window.Window parent = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_font_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk3.font_chooser_dialog.FontChooserDialog]
class FontChooserDialogGidBuilderImpl(T) : gid.gtk3.dialog.DialogGidBuilderImpl!T, gid.gtk3.font_chooser.FontChooserGidBuilderImpl!T
{

  mixin FontChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.font_chooser_dialog.FontChooserDialog]
final class FontChooserDialogGidBuilder : FontChooserDialogGidBuilderImpl!FontChooserDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontChooserDialog build() nothrow
  {
    return new FontChooserDialog(cast(void*)createGObject(FontChooserDialog._getGType), Yes.Take);
  }
}
