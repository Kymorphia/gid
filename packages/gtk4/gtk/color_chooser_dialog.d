/// Module for [ColorChooserDialog] class
module gtk.color_chooser_dialog;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.dialog;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.window;

/**
    A dialog for choosing a color.
    
    ![An example GtkColorChooserDialog](colorchooser.png)
    
    [gtk.color_chooser_dialog.ColorChooserDialog] implements the [gtk.color_chooser.ColorChooser] interface
    and does not provide much API of its own.
    
    To create a [gtk.color_chooser_dialog.ColorChooserDialog], use [gtk.color_chooser_dialog.ColorChooserDialog.new_].
    
    To change the initially selected color, use
    [gtk.color_chooser.ColorChooser.setRgba]. To get the selected color use
    [gtk.color_chooser.ColorChooser.getRgba].
    
    [gtk.color_chooser_dialog.ColorChooserDialog] has been deprecated in favor of [gtk.color_dialog.ColorDialog].
    
    ## CSS nodes
    
    [gtk.color_chooser_dialog.ColorChooserDialog] has a single CSS node with the name `window` and style
    class `.colorchooser`.

    Deprecated: Use [gtk.color_dialog.ColorDialog] instead
*/
class ColorChooserDialog : gtk.dialog.Dialog, gtk.color_chooser.ColorChooser
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
    return cast(void function())gtk_color_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_color_chooser_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorChooserDialog self()
  {
    return this;
  }

  /**
      Get builder for [gtk.color_chooser_dialog.ColorChooserDialog]
      Returns: New builder object
  */
  static ColorChooserDialogGidBuilder builder()
  {
    return new ColorChooserDialogGidBuilder;
  }

  /** */
  @property bool showEditor()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /** */
  @property void showEditor(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new [gtk.color_chooser_dialog.ColorChooserDialog].
  
      Params:
        title = Title of the dialog
        parent = Transient parent of the dialog
      Returns: a new [gtk.color_chooser_dialog.ColorChooserDialog]
  
      Deprecated: Use [gtk.color_dialog.ColorDialog] instead
  */
  this(string title = null, gtk.window.Window parent = null)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_color_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.color_chooser_dialog.ColorChooserDialog]
class ColorChooserDialogGidBuilderImpl(T) : gtk.dialog.DialogGidBuilderImpl!T, gtk.color_chooser.ColorChooserGidBuilderImpl!T
{

  mixin ColorChooserGidBuilderT!();

  /** */
  T showEditor(bool propval)
  {
    return setProperty("show-editor", propval);
  }
}

/// Fluent builder for [gtk.color_chooser_dialog.ColorChooserDialog]
final class ColorChooserDialogGidBuilder : ColorChooserDialogGidBuilderImpl!ColorChooserDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorChooserDialog build()
  {
    return new ColorChooserDialog(cast(void*)createGObject(ColorChooserDialog._getGType), No.Take);
  }
}
