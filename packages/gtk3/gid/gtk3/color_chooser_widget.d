/// Module for [ColorChooserWidget] class
module gid.gtk3.color_chooser_widget;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.color_chooser;
import gid.gtk3.color_chooser_mixin;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

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
    
    To change the initially selected color, use [gid.gtk4.color_chooser.ColorChooser.setRgba].
    To get the selected color use [gid.gtk4.color_chooser.ColorChooser.getRgba].
    
    The #GtkColorChooserWidget is used in the #GtkColorChooserDialog
    to provide a dialog for selecting colors.
    
    # CSS names
    
    GtkColorChooserWidget has a single CSS node with name colorchooser.
*/
class ColorChooserWidget : gid.gtk3.box.Box, gid.gtk3.color_chooser.ColorChooser
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
    return cast(void function())gtk_color_chooser_widget_get_type != &gidSymbolNotFound ? gtk_color_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkColorChooserWidget";
  }

  /** Returns `this`, for use in `with` statements. */
  override ColorChooserWidget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.color_chooser_widget.ColorChooserWidget]
      Returns: New builder object
  */
  static ColorChooserWidgetGidBuilder builder() nothrow
  {
    return new ColorChooserWidgetGidBuilder;
  }

  /**
      Get `showEditor` property.
      Returns: The ::show-editor property is true when the color chooser
        is showing the single-color editor. It can be set to switch
        the color chooser into single-color editing mode.
  */
  @property bool showEditor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /**
      Set `showEditor` property.
      Params:
        propval = The ::show-editor property is true when the color chooser
          is showing the single-color editor. It can be set to switch
          the color chooser into single-color editing mode.
  */
  @property void showEditor(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new #GtkColorChooserWidget.
      Returns: a new #GtkColorChooserWidget
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_color_chooser_widget_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.color_chooser_widget.ColorChooserWidget]
class ColorChooserWidgetGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T, gid.gtk3.color_chooser.ColorChooserGidBuilderImpl!T
{

  mixin ColorChooserGidBuilderT!();

  /**
      Set `showEditor` property.
      Params:
        propval = The ::show-editor property is true when the color chooser
          is showing the single-color editor. It can be set to switch
          the color chooser into single-color editing mode.
      Returns: Builder instance for fluent chaining
  */
  T showEditor(bool propval) nothrow
  {
    return setProperty("show-editor", propval);
  }
}

/// Fluent builder for [gid.gtk3.color_chooser_widget.ColorChooserWidget]
final class ColorChooserWidgetGidBuilder : ColorChooserWidgetGidBuilderImpl!ColorChooserWidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ColorChooserWidget build() nothrow
  {
    return new ColorChooserWidget(cast(void*)createGObject(ColorChooserWidget._getGType), Yes.Take);
  }
}
