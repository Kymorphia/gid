/// Module for [FontChooserDialog] class
module gtk.font_chooser_dialog;

import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.window;

/**
    The [gtk.font_chooser_dialog.FontChooserDialog] widget is a dialog for selecting a font.
    
    ![An example GtkFontChooserDialog](fontchooser.png)
    
    [gtk.font_chooser_dialog.FontChooserDialog] implements the [gtk.font_chooser.FontChooser] interface
    and does not provide much API of its own.
    
    To create a [gtk.font_chooser_dialog.FontChooserDialog], use [gtk.font_chooser_dialog.FontChooserDialog.new_].
    
    # GtkFontChooserDialog as GtkBuildable
    
    The [gtk.font_chooser_dialog.FontChooserDialog] implementation of the [gtk.buildable.Buildable]
    interface exposes the buttons with the names “select_button”
    and “cancel_button”.
    
    ## CSS nodes
    
    [gtk.font_chooser_dialog.FontChooserDialog] has a single CSS node with the name `window` and style
    class `.fontchooser`.

    Deprecated: Use [gtk.font_dialog.FontDialog] instead
*/
class FontChooserDialog : gtk.dialog.Dialog, gtk.font_chooser.FontChooser
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
    return cast(void function())gtk_font_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_font_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontChooserDialog self()
  {
    return this;
  }

  /**
  Get builder for [gtk.font_chooser_dialog.FontChooserDialog]
  Returns: New builder object
  */
  static FontChooserDialogGidBuilder builder()
  {
    return new FontChooserDialogGidBuilder;
  }

  mixin FontChooserT!();

  /**
      Creates a new [gtk.font_chooser_dialog.FontChooserDialog].
  
      Params:
        title = Title of the dialog
        parent = Transient parent of the dialog
      Returns: a new [gtk.font_chooser_dialog.FontChooserDialog]
  
      Deprecated: Use [gtk.font_dialog.FontDialog] instead
  */
  this(string title = null, gtk.window.Window parent = null)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_font_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

class FontChooserDialogGidBuilderImpl(T) : gtk.dialog.DialogGidBuilderImpl!T, gtk.font_chooser.FontChooserGidBuilderImpl!T
{

  mixin FontChooserGidBuilderT!();
}

/// Fluent builder for [gtk.font_chooser_dialog.FontChooserDialog]
final class FontChooserDialogGidBuilder : FontChooserDialogGidBuilderImpl!FontChooserDialogGidBuilder
{
  FontChooserDialog build()
  {
    return new FontChooserDialog(cast(void*)createGObject(FontChooserDialog._getGType), No.Take);
  }
}
