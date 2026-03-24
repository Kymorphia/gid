/// Module for [ColorChooserDialog] class
module gtk.color_chooser_dialog;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.dialog;
import gtk.types;
import gtk.window;

/**
    The #GtkColorChooserDialog widget is a dialog for choosing
    a color. It implements the #GtkColorChooser interface.
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
      Creates a new #GtkColorChooserDialog.
  
      Params:
        title = Title of the dialog, or null
        parent = Transient parent of the dialog, or null
      Returns: a new #GtkColorChooserDialog
  */
  this(string title = null, gtk.window.Window parent = null)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_color_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent._cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}

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
  ColorChooserDialog build()
  {
    return new ColorChooserDialog(cast(void*)createGObject(ColorChooserDialog._getGType), No.Take);
  }
}
