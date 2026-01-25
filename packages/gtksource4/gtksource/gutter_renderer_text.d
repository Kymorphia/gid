/// Module for [GutterRendererText] class
module gtksource.gutter_renderer_text;

import gid.gid;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;

/** */
class GutterRendererText : gtksource.gutter_renderer.GutterRenderer
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
    return cast(void function())gtk_source_gutter_renderer_text_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterRendererText self()
  {
    return this;
  }

  /** */
  @property string markup()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("markup");
  }

  /** */
  @property void markup(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("markup", propval);
  }

  /** */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /** */
  @property void text(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Create a new #GtkSourceGutterRendererText.
      Returns: A #GtkSourceGutterRenderer
  */
  this()
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_renderer_text_new();
    this(_cretval, Yes.Take);
  }

  /**
      Measures the text provided using the pango layout used by the
      #GtkSourceGutterRendererText.
  
      Params:
        text = the text to measure.
        width = location to store the width of the text in pixels,
            or null.
        height = location to store the height of the text in
            pixels, or null.
  */
  void measure(string text, out int width, out int height)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_gutter_renderer_text_measure(cast(GtkSourceGutterRendererText*)this._cPtr, _text, cast(int*)&width, cast(int*)&height);
  }

  /**
      Measures the pango markup provided using the pango layout used by the
      #GtkSourceGutterRendererText.
  
      Params:
        markup = the pango markup to measure.
        width = location to store the width of the text in pixels,
            or null.
        height = location to store the height of the text in
            pixels, or null.
  */
  void measureMarkup(string markup, out int width, out int height)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_source_gutter_renderer_text_measure_markup(cast(GtkSourceGutterRendererText*)this._cPtr, _markup, cast(int*)&width, cast(int*)&height);
  }

  /** */
  void setMarkup(string markup)
  {
    int _length;
    if (markup)
      _length = cast(int)markup.length;

    auto _markup = cast(const(char)*)markup.ptr;
    gtk_source_gutter_renderer_text_set_markup(cast(GtkSourceGutterRendererText*)this._cPtr, _markup, _length);
  }

  /** */
  void setText(string text)
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    gtk_source_gutter_renderer_text_set_text(cast(GtkSourceGutterRendererText*)this._cPtr, _text, _length);
  }
}
