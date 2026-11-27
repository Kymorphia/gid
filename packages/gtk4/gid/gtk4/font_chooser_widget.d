/// Module for [FontChooserWidget] class
module gid.gtk4.font_chooser_widget;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.font_chooser;
import gid.gtk4.font_chooser_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    The [gid.gtk4.font_chooser_widget.FontChooserWidget] widget lets the user select a font.
    
    It is used in the [gid.gtk4.font_chooser_dialog.FontChooserDialog] widget to provide a
    dialog for selecting fonts.
    
    To set the font which is initially selected, use
    [gid.gtk4.font_chooser.FontChooser.setFont] or [gid.gtk4.font_chooser.FontChooser.setFontDesc].
    
    To get the selected font use [gid.gtk4.font_chooser.FontChooser.getFont] or
    [gid.gtk4.font_chooser.FontChooser.getFontDesc].
    
    To change the text which is shown in the preview area, use
    [gid.gtk4.font_chooser.FontChooser.setPreviewText].
    
    # CSS nodes
    
    [gid.gtk4.font_chooser_widget.FontChooserWidget] has a single CSS node with name fontchooser.

    Deprecated: Direct use of [gid.gtk4.font_chooser_widget.FontChooserWidget] is deprecated.
*/
@gidGir("FontChooserWidget")
class FontChooserWidget : gid.gtk4.widget.Widget, gid.gtk4.font_chooser.FontChooser
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
      Get builder for [gid.gtk4.font_chooser_widget.FontChooserWidget]
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
      Creates a new [gid.gtk4.font_chooser_widget.FontChooserWidget].
      Returns: a new [gid.gtk4.font_chooser_widget.FontChooserWidget]
  
      Deprecated: Direct use of [gid.gtk4.font_chooser_widget.FontChooserWidget] is deprecated.
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

/// Fluent builder implementation template for [gid.gtk4.font_chooser_widget.FontChooserWidget]
class FontChooserWidgetGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.font_chooser.FontChooserGidBuilderImpl!T
{

  mixin FontChooserGidBuilderT!();
}

/// Fluent builder for [gid.gtk4.font_chooser_widget.FontChooserWidget]
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
