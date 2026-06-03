/// Module for [GutterRendererText] class
module gtksource.gutter_renderer_text;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
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
    [gtksource.gutter.Gutter].
*/
class GutterRendererText : gtksource.gutter_renderer.GutterRenderer
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_text_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_text_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterRendererText self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.gutter_renderer_text.GutterRendererText]
      Returns: New builder object
  */
  static GutterRendererTextGidBuilder builder() nothrow
  {
    return new GutterRendererTextGidBuilder;
  }

  /** */
  @property string markup() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("markup");
  }

  /** */
  @property void markup(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("markup", propval);
  }

  /** */
  @property string text() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /** */
  @property void text(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("text", propval);
  }

  /**
      Create a new #GtkSourceGutterRendererText.
      Returns: A #GtkSourceGutterRenderer
  */
  this() nothrow
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_renderer_text_new();
    this(_cretval, Yes.Take);
  }

  alias measure = gtk.widget.Widget.measure;

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
  void measure(string text, out int width, out int height) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
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
  void measureMarkup(string markup, out int width, out int height) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, No.Nullable);
    gtk_source_gutter_renderer_text_measure_markup(cast(GtkSourceGutterRendererText*)this._cPtr, _markup, cast(int*)&width, cast(int*)&height);
  }

  /** */
  void setMarkup(string markup) nothrow
  {
    int _length;
    if (markup)
      _length = cast(int)markup.length;

    auto _markup = markup.ptr ? cast(const(char)*)markup.ptr : [char.init].ptr;
    gtk_source_gutter_renderer_text_set_markup(cast(GtkSourceGutterRendererText*)this._cPtr, _markup, _length);
  }

  /** */
  void setText(string text) nothrow
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = text.ptr ? cast(const(char)*)text.ptr : [char.init].ptr;
    gtk_source_gutter_renderer_text_set_text(cast(GtkSourceGutterRendererText*)this._cPtr, _text, _length);
  }
}

/// Fluent builder implementation template for [gtksource.gutter_renderer_text.GutterRendererText]
class GutterRendererTextGidBuilderImpl(T) : gtksource.gutter_renderer.GutterRendererGidBuilderImpl!T
{


  /** */
  T markup(string propval) nothrow
  {
    return setProperty("markup", propval);
  }

  /** */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }
}

/// Fluent builder for [gtksource.gutter_renderer_text.GutterRendererText]
final class GutterRendererTextGidBuilder : GutterRendererTextGidBuilderImpl!GutterRendererTextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GutterRendererText build() nothrow
  {
    return new GutterRendererText(cast(void*)createGObject(GutterRendererText._getGType), Yes.Take);
  }
}
