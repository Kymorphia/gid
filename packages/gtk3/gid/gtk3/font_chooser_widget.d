/// Module for [FontChooserWidget] class
module gid.gtk3.font_chooser_widget;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.action;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.box;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.font_chooser;
import gid.gtk3.font_chooser_mixin;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;

/**
    The #GtkFontChooserWidget widget lists the available fonts,
    styles and sizes, allowing the user to select a font. It is
    used in the #GtkFontChooserDialog widget to provide a
    dialog box for selecting fonts.
    
    To set the font which is initially selected, use
    [gid.gtk4.font_chooser.FontChooser.setFont] or [gid.gtk4.font_chooser.FontChooser.setFontDesc].
    
    To get the selected font use [gid.gtk4.font_chooser.FontChooser.getFont] or
    [gid.gtk4.font_chooser.FontChooser.getFontDesc].
    
    To change the text which is shown in the preview area, use
    [gid.gtk4.font_chooser.FontChooser.setPreviewText].
    
    # CSS nodes
    
    GtkFontChooserWidget has a single CSS node with name fontchooser.
*/
@gidGir("FontChooserWidget", "FontChooserWidgetClass")
class FontChooserWidget : gid.gtk3.box.Box, gid.gtk3.font_chooser.FontChooser
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
    return cast(void function())gtk_font_chooser_widget_get_type != &gidSymbolNotFound ? gtk_font_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkFontChooserWidget";
  }

  /** Returns `this`, for use in `with` statements. */
  override FontChooserWidget self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.font_chooser_widget.FontChooserWidget]
      Returns: New builder object
  */
  static FontChooserWidgetGidBuilder builder() nothrow
  {
    return new FontChooserWidgetGidBuilder;
  }

  /**
      Get `tweakAction` property.
      Returns: A toggle action that can be used to switch to the tweak page
        of the font chooser widget, which lets the user tweak the
        OpenType features and variation axes of the selected font.
        
        The action will be enabled or disabled depending on whether
        the selected font has any features or axes.
  */
  @property gid.gio2.action.Action tweakAction() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.action.Action)("tweak-action");
  }

  mixin FontChooserT!();

  /**
      Creates a new #GtkFontChooserWidget.
      Returns: a new #GtkFontChooserWidget
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_font_chooser_widget_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.font_chooser_widget.FontChooserWidget]
class FontChooserWidgetGidBuilderImpl(T) : gid.gtk3.box.BoxGidBuilderImpl!T, gid.gtk3.font_chooser.FontChooserGidBuilderImpl!T
{

  mixin FontChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtk3.font_chooser_widget.FontChooserWidget]
final class FontChooserWidgetGidBuilder : FontChooserWidgetGidBuilderImpl!FontChooserWidgetGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FontChooserWidget build() nothrow
  {
    return new FontChooserWidget(cast(void*)createGObject(FontChooserWidget._getGType), Yes.Take);
  }
}
