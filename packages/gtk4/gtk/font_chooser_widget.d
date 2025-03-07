module gtk.font_chooser_widget;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.font_chooser;
import gtk.font_chooser_mixin;
import gtk.types;
import gtk.widget;

/**
    The [gtk.font_chooser_widget.FontChooserWidget] widget lets the user select a font.
  
  It is used in the [gtk.font_chooser_dialog.FontChooserDialog] widget to provide a
  dialog for selecting fonts.
  
  To set the font which is initially selected, use
  [gtk.font_chooser.FontChooser.setFont] or [gtk.font_chooser.FontChooser.setFontDesc].
  
  To get the selected font use [gtk.font_chooser.FontChooser.getFont] or
  [gtk.font_chooser.FontChooser.getFontDesc].
  
  To change the text which is shown in the preview area, use
  [gtk.font_chooser.FontChooser.setPreviewText].
  
  # CSS nodes
  
  [gtk.font_chooser_widget.FontChooserWidget] has a single CSS node with name fontchooser.

  Deprecated:     Direct use of [gtk.font_chooser_widget.FontChooserWidget] is deprecated.
*/
class FontChooserWidget : gtk.widget.Widget, gtk.font_chooser.FontChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_font_chooser_widget_get_type != &gidSymbolNotFound ? gtk_font_chooser_widget_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  mixin FontChooserT!();

  /**
      Creates a new [gtk.font_chooser_widget.FontChooserWidget].
    Returns:     a new [gtk.font_chooser_widget.FontChooserWidget]
  
    Deprecated:     Direct use of [gtk.font_chooser_widget.FontChooserWidget] is deprecated.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_font_chooser_widget_new();
    this(_cretval, No.Take);
  }
}
