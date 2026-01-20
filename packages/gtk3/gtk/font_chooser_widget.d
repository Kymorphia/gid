/// Module for [FontChooserWidget] class
module gtk.font_chooser_widget;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.action;
import gobject.object;
import gtk.box;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    The #GtkFontChooserWidget widget lists the available fonts,
    styles and sizes, allowing the user to select a font. It is
    used in the #GtkFontChooserDialog widget to provide a
    dialog box for selecting fonts.
    
    To set the font which is initially selected, use
    [gtk.font_chooser.FontChooser.setFont] or [gtk.font_chooser.FontChooser.setFontDesc].
    
    To get the selected font use [gtk.font_chooser.FontChooser.getFont] or
    [gtk.font_chooser.FontChooser.getFontDesc].
    
    To change the text which is shown in the preview area, use
    [gtk.font_chooser.FontChooser.setPreviewText].
    
    # CSS nodes
    
    GtkFontChooserWidget has a single CSS node with name fontchooser.
*/
class FontChooserWidget : gtk.box.Box, gtk.font_chooser.FontChooser
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
    return cast(void function())gtk_font_chooser_widget_get_type != &gidSymbolNotFound ? gtk_font_chooser_widget_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontChooserWidget self()
  {
    return this;
  }

  /**
      Get `tweakAction` property.
      Returns: A toggle action that can be used to switch to the tweak page
        of the font chooser widget, which lets the user tweak the
        OpenType features and variation axes of the selected font.
        
        The action will be enabled or disabled depending on whether
        the selected font has any features or axes.
  */
  @property gio.action.Action tweakAction()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.action.Action)("tweak-action");
  }

  mixin FontChooserT!();

  /**
      Creates a new #GtkFontChooserWidget.
      Returns: a new #GtkFontChooserWidget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_chooser_widget_new();
    this(_cretval, No.Take);
  }
}
