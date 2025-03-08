module gtksource.gutter_renderer_text;

import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;

/**
    Renders text in the gutter.
  
  A [gtksource.gutter_renderer_text.GutterRendererText] can be used to render text in a cell of
  `class@Gutter`.
*/
class GutterRendererText : gtksource.gutter_renderer.GutterRenderer
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_text_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_text_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Create a new #GtkSourceGutterRendererText.
    Returns:     A #GtkSourceGutterRenderer
  */
  this()
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_renderer_text_new();
    this(_cretval, Yes.take);
  }

  alias measure = gtk.widget.Widget.measure;

  /**
      Measures the text provided using the pango layout used by the
    #GtkSourceGutterRendererText.
    Params:
      text =       the text to measure.
      width =       location to store the width of the text in pixels,
          or null.
      height =       location to store the height of the text in
          pixels, or null.
  */
  void measure(string text, out int width, out int height)
  {
    const(char)* _text = text.toCString(No.alloc);
    gtk_source_gutter_renderer_text_measure(cast(GtkSourceGutterRendererText*)cPtr, _text, cast(int*)&width, cast(int*)&height);
  }

  /**
      Measures the pango markup provided using the pango layout used by the
    #GtkSourceGutterRendererText.
    Params:
      markup =       the pango markup to measure.
      width =       location to store the width of the text in pixels,
          or null.
      height =       location to store the height of the text in
          pixels, or null.
  */
  void measureMarkup(string markup, out int width, out int height)
  {
    const(char)* _markup = markup.toCString(No.alloc);
    gtk_source_gutter_renderer_text_measure_markup(cast(GtkSourceGutterRendererText*)cPtr, _markup, cast(int*)&width, cast(int*)&height);
  }

  /** */
  void setMarkup(string markup, int length)
  {
    const(char)* _markup = markup.toCString(No.alloc);
    gtk_source_gutter_renderer_text_set_markup(cast(GtkSourceGutterRendererText*)cPtr, _markup, length);
  }

  /** */
  void setText(string text, int length)
  {
    const(char)* _text = text.toCString(No.alloc);
    gtk_source_gutter_renderer_text_set_text(cast(GtkSourceGutterRendererText*)cPtr, _text, length);
  }
}
