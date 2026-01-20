/// Module for [ColorChooserWidget] class
module gtk.color_chooser_widget;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.color_chooser;
import gtk.color_chooser_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    The #GtkColorChooserWidget widget lets the user select a
    color. By default, the chooser presents a predefined palette
    of colors, plus a small number of settable custom colors.
    It is also possible to select a different color with the
    single-color editor. To enter the single-color editing mode,
    use the context menu of any color of the palette, or use the
    '+' button to add a new custom color.
    
    The chooser automatically remembers the last selection, as well
    as custom colors.
    
    To change the initially selected color, use [gtk.color_chooser.ColorChooser.setRgba].
    To get the selected color use [gtk.color_chooser.ColorChooser.getRgba].
    
    The #GtkColorChooserWidget is used in the #GtkColorChooserDialog
    to provide a dialog for selecting colors.
    
    # CSS names
    
    GtkColorChooserWidget has a single CSS node with name colorchooser.
*/
class ColorChooserWidget : gtk.box.Box, gtk.color_chooser.ColorChooser
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
    return cast(void function())gtk_color_chooser_widget_get_type != &gidSymbolNotFound ? gtk_color_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorChooserWidget self()
  {
    return this;
  }

  /**
      Get `showEditor` property.
      Returns: The ::show-editor property is true when the color chooser
        is showing the single-color editor. It can be set to switch
        the color chooser into single-color editing mode.
  */
  @property bool showEditor()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /**
      Set `showEditor` property.
      Params:
        propval = The ::show-editor property is true when the color chooser
          is showing the single-color editor. It can be set to switch
          the color chooser into single-color editing mode.
  */
  @property void showEditor(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new #GtkColorChooserWidget.
      Returns: a new #GtkColorChooserWidget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_chooser_widget_new();
    this(_cretval, No.Take);
  }
}
