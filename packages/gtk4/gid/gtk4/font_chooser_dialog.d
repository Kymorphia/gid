/// Module for [FontChooserDialog] class
module gid.gtk4.font_chooser_dialog;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.dialog;
import gid.gtk4.font_chooser;
import gid.gtk4.font_chooser_mixin;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    The [gid.gtk4.font_chooser_dialog.FontChooserDialog] widget is a dialog for selecting a font.
    
    <picture>
      <source srcset="fontchooser-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkFontChooserDialog" src="fontchooser.png">
    </picture>
    
    [gid.gtk4.font_chooser_dialog.FontChooserDialog] implements the [gid.gtk4.font_chooser.FontChooser] interface
    and does not provide much API of its own.
    
    To create a [gid.gtk4.font_chooser_dialog.FontChooserDialog], use [gid.gtk4.font_chooser_dialog.FontChooserDialog.new_].
    
    # GtkFontChooserDialog as GtkBuildable
    
    The [gid.gtk4.font_chooser_dialog.FontChooserDialog] implementation of the [gid.gtk4.buildable.Buildable]
    interface exposes the buttons with the names “select_button”
    and “cancel_button”.
    
    ## CSS nodes
    
    [gid.gtk4.font_chooser_dialog.FontChooserDialog] has a single CSS node with the name `window` and style
    class `.fontchooser`.

    Deprecated: Use [gid.gtk4.font_dialog.FontDialog] instead
*/
class FontChooserDialog : gid.gtk4.dialog.Dialog, gid.gtk4.font_chooser.FontChooser
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
      Get builder for [gid.gtk4.font_chooser_dialog.FontChooserDialog]
      Returns: New builder object
  */
  static FontChooserDialogGidBuilder builder() nothrow
  {
    return new FontChooserDialogGidBuilder;
  }

  mixin FontChooserT!();

  /**
      Creates a new [gid.gtk4.font_chooser_dialog.FontChooserDialog].
  
      Params:
        title = Title of the dialog
        parent = Transient parent of the dialog
      Returns: a new [gid.gtk4.font_chooser_dialog.FontChooserDialog]
  
      Deprecated: Use [gid.gtk4.font_dialog.FontDialog] instead
  */
  this(string title = null, gid.gtk4.window.Window parent = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, title !is null || parent !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_font_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.font_chooser_dialog.FontChooserDialog]
class FontChooserDialogGidBuilderImpl(T) : gid.gtk4.dialog.DialogGidBuilderImpl!T, gid.gtk4.font_chooser.FontChooserGidBuilderImpl!T
{

  mixin FontChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.font_chooser_dialog.FontChooserDialog]
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
