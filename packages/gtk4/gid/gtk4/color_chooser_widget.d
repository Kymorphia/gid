/// Module for [ColorChooserWidget] class
module gid.gtk4.color_chooser_widget;

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
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    The [gid.gtk4.color_chooser_widget.ColorChooserWidget] widget lets the user select a color.
    
    By default, the chooser presents a predefined palette of colors,
    plus a small number of settable custom colors. It is also possible
    to select a different color with the single-color editor.
    
    To enter the single-color editing mode, use the context menu of any
    color of the palette, or use the '+' button to add a new custom color.
    
    The chooser automatically remembers the last selection, as well
    as custom colors.
    
    To create a [gid.gtk4.color_chooser_widget.ColorChooserWidget], use [gid.gtk4.color_chooser_widget.ColorChooserWidget.new_].
    
    To change the initially selected color, use
    [gid.gtk4.color_chooser.ColorChooser.setRgba]. To get the selected color use
    [gid.gtk4.color_chooser.ColorChooser.getRgba].
    
    The [gid.gtk4.color_chooser_widget.ColorChooserWidget] is used in the [gid.gtk4.color_chooser_dialog.ColorChooserDialog]
    to provide a dialog for selecting colors.
    
    # Actions
    
    [gid.gtk4.color_chooser_widget.ColorChooserWidget] defines a set of built-in actions:
    
    - `color.customize` activates the color editor for the given color.
    - `color.select` emits the [gid.gtk4.color_chooser.ColorChooser.colorActivated] signal
      for the given color.
    
    # CSS names
    
    [gid.gtk4.color_chooser_widget.ColorChooserWidget] has a single CSS node with name colorchooser.

    Deprecated: Direct use of [gid.gtk4.color_chooser_widget.ColorChooserWidget] is deprecated.
*/
class ColorChooserWidget : gid.gtk4.widget.Widget, gid.gtk4.color_chooser.ColorChooser
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
      Get builder for [gid.gtk4.color_chooser_widget.ColorChooserWidget]
      Returns: New builder object
  */
  static ColorChooserWidgetGidBuilder builder() nothrow
  {
    return new ColorChooserWidgetGidBuilder;
  }

  /**
      Get `showEditor` property.
      Returns: true when the color chooser is showing the single-color editor.
        
        It can be set to switch the color chooser into single-color editing mode.
  */
  @property bool showEditor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("show-editor");
  }

  /**
      Set `showEditor` property.
      Params:
        propval = true when the color chooser is showing the single-color editor.
          
          It can be set to switch the color chooser into single-color editing mode.
  */
  @property void showEditor(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("show-editor", propval);
  }

  mixin ColorChooserT!();

  /**
      Creates a new [gid.gtk4.color_chooser_widget.ColorChooserWidget].
      Returns: a new [gid.gtk4.color_chooser_widget.ColorChooserWidget]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_color_chooser_widget_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gid.gtk4.color_chooser_widget.ColorChooserWidget]
class ColorChooserWidgetGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.color_chooser.ColorChooserGidBuilderImpl!T
{

  mixin ColorChooserGidBuilderT!();

  /**
      Set `showEditor` property.
      Params:
        propval = true when the color chooser is showing the single-color editor.
          
          It can be set to switch the color chooser into single-color editing mode.
      Returns: Builder instance for fluent chaining
  */
  T showEditor(bool propval) nothrow
  {
    return setProperty("show-editor", propval);
  }
}

/// Fluent builder for [gid.gtk4.color_chooser_widget.ColorChooserWidget]
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
