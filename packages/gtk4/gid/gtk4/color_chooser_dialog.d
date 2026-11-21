/// Module for [ColorChooserDialog] class
module gid.gtk4.color_chooser_dialog;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.color_chooser;
import gid.gtk4.color_chooser_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.dialog;
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.root;
import gid.gtk4.root_mixin;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.window;

/**
    A dialog for choosing a color.
    
    <picture>
      <source srcset="colorchooser-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkColorChooserDialog" src="colorchooser.png">
    </picture>
    
    [gid.gtk4.color_chooser_dialog.ColorChooserDialog] implements the [gid.gtk4.color_chooser.ColorChooser] interface
    and does not provide much API of its own.
    
    To create a [gid.gtk4.color_chooser_dialog.ColorChooserDialog], use [gid.gtk4.color_chooser_dialog.ColorChooserDialog.new_].
    
    To change the initially selected color, use
    [gid.gtk4.color_chooser.ColorChooser.setRgba]. To get the selected color use
    [gid.gtk4.color_chooser.ColorChooser.getRgba].
    
    [gid.gtk4.color_chooser_dialog.ColorChooserDialog] has been deprecated in favor of [gid.gtk4.color_dialog.ColorDialog].
    
    ## CSS nodes
    
    [gid.gtk4.color_chooser_dialog.ColorChooserDialog] has a single CSS node with the name `window` and style
    class `.colorchooser`.

    Deprecated: Use [gid.gtk4.color_dialog.ColorDialog] instead
*/
class ColorChooserDialog : gid.gtk4.dialog.Dialog, gid.gtk4.color_chooser.ColorChooser
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
      Get builder for [gid.gtk4.color_chooser_dialog.ColorChooserDialog]
      Returns: New builder object
  */
  static ColorChooserDialogGidBuilder builder() nothrow
  {
    return new ColorChooserDialogGidBuilder;
  }

  /**
      Get `showEditor` property.
      Returns: Whether the color chooser dialog is showing the single-color editor.
        
        It can be set to switch the color chooser into single-color editing mode.
  */
  @property bool showEditor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /**
      Set `showEditor` property.
      Params:
        propval = Whether the color chooser dialog is showing the single-color editor.
          
          It can be set to switch the color chooser into single-color editing mode.
  */
  @property void showEditor(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new [gid.gtk4.color_chooser_dialog.ColorChooserDialog].
  
      Params:
        title = Title of the dialog
        parent = Transient parent of the dialog
      Returns: a new [gid.gtk4.color_chooser_dialog.ColorChooserDialog]
  
      Deprecated: Use [gid.gtk4.color_dialog.ColorDialog] instead
  */
  this(string title = null, gid.gtk4.window.Window parent = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_color_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk4.color_chooser_dialog.ColorChooserDialog]
class ColorChooserDialogGidBuilderImpl(T) : gid.gtk4.dialog.DialogGidBuilderImpl!T, gid.gtk4.color_chooser.ColorChooserGidBuilderImpl!T
{

  mixin ColorChooserGidBuilderT!();

  /**
      Set `showEditor` property.
      Params:
        propval = Whether the color chooser dialog is showing the single-color editor.
          
          It can be set to switch the color chooser into single-color editing mode.
      Returns: Builder instance for fluent chaining
  */
  T showEditor(bool propval) nothrow
  {
    return setProperty("show-editor", propval);
  }
}

/// Fluent builder for [gid.gtk4.color_chooser_dialog.ColorChooserDialog]
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
