/// Global functions for pangocairo1 library
module gid.pangocairo1.global;

import gid.cairo1.context;
import gid.cairo1.font_options;
import gid.core.gid;
import gid.gobject2.object;
import gid.pango1.attr_shape;
import gid.pango1.context;
import gid.pango1.font;
import gid.pango1.glyph_item;
import gid.pango1.glyph_string;
import gid.pango1.layout;
import gid.pango1.layout_line;
import gid.pangocairo1.c.functions;
import gid.pangocairo1.c.types;
import gid.pangocairo1.types;


/**
    Retrieves any font rendering options previously set with
    `funcPangoCairo.context_set_font_options`.
    
    This function does not report options that are derived from
    the target surface by `funcupdate_context`.

    Params:
      context = a [gid.pango1.context.Context], from a pangocairo font map
    Returns: the font options previously set on the
        context, or null if no options have been set. This value is
        owned by the context and must not be modified or freed.
*/
gid.cairo1.font_options.FontOptions contextGetFontOptions(gid.pango1.context.Context context) nothrow
{
  const(cairo_font_options_t)* _cretval;
  _cretval = pango_cairo_context_get_font_options(context ? cast(PangoContext*)context._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gid.cairo1.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Gets the resolution for the context.
    
    See `funcPangoCairo.context_set_resolution`

    Params:
      context = a [gid.pango1.context.Context], from a pangocairo font map
    Returns: the resolution in "dots per inch". A negative value will
        be returned if no resolution has previously been set.
*/
double contextGetResolution(gid.pango1.context.Context context) nothrow
{
  double _retval;
  _retval = pango_cairo_context_get_resolution(context ? cast(PangoContext*)context._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Sets the font options used when rendering text with this context.
    
    These options override any options that `funcupdate_context`
    derives from the target surface.

    Params:
      context = a [gid.pango1.context.Context], from a pangocairo font map
      options = a [gid.cairo1.font_options.FontOptions], or null to unset
          any previously set options. A copy is made.
*/
void contextSetFontOptions(gid.pango1.context.Context context, gid.cairo1.font_options.FontOptions options = null) nothrow
{
  pango_cairo_context_set_font_options(context ? cast(PangoContext*)context._cPtr(No.Dup) : null, options ? cast(const(cairo_font_options_t)*)options._cPtr(No.Dup) : null);
}

/**
    Sets the resolution for the context.
    
    This is a scale factor between points specified in a [gid.pango1.font_description.FontDescription]
    and Cairo units. The default value is 96, meaning that a 10 point font will
    be 13 units high. (10 * 96. / 72. = 13.3).

    Params:
      context = a [gid.pango1.context.Context], from a pangocairo font map
      dpi = the resolution in "dots per inch". (Physical inches aren't actually
          involved; the terminology is conventional.) A 0 or negative value
          means to use the resolution from the font map.
*/
void contextSetResolution(gid.pango1.context.Context context, double dpi) nothrow
{
  pango_cairo_context_set_resolution(context ? cast(PangoContext*)context._cPtr(No.Dup) : null, dpi);
}

/**
    Sets callback function for context to use for rendering attributes
    of type [gid.pango1.types.AttrType.Shape].
    
    See [gid.pangocairo1.types.ShapeRendererFunc] for details.

    Params:
      context = a [gid.pango1.context.Context], from a pangocairo font map
      func = Callback function for rendering attributes of
          type [gid.pango1.types.AttrType.Shape], or null to disable shape rendering.
*/
void contextSetShapeRenderer(gid.pango1.context.Context context, gid.pangocairo1.types.ShapeRendererFunc func = null) nothrow
{
  extern(C) void _funcCallback(cairo_t* cr, PangoAttrShape* attr, gboolean doPath, void* data) nothrow
  {
    auto _dlg = cast(gid.pangocairo1.types.ShapeRendererFunc*)data;
    auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
    auto _attr = attr ? new gid.pango1.attr_shape.AttrShape(cast(void*)attr, null) : null;

    try
    {
      (*_dlg)(_cr, _attr, cast(bool)doPath);
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "gid.pangocairo1.types.ShapeRendererFunc");
    }
    if (_cr)
      _cr._cUnborrow;

  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  pango_cairo_context_set_shape_renderer(context ? cast(PangoContext*)context._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
}

/**
    Creates a context object set up to match the current transformation
    and target surface of the Cairo context.
    
    This context can then be
    used to create a layout using [gid.pango1.layout.Layout.new_].
    
    This function is a convenience function that creates a context using
    the default font map, then updates it to cr. If you just need to
    create a layout for use with cr and do not need to access [gid.pango1.context.Context]
    directly, you can use `funccreate_layout` instead.

    Params:
      cr = a Cairo context
    Returns: the newly created [gid.pango1.context.Context]
*/
gid.pango1.context.Context createContext(gid.cairo1.context.Context cr) nothrow
{
  PangoContext* _cretval;
  _cretval = pango_cairo_create_context(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.context.Context)(cast(PangoContext*)_cretval, Yes.Take);
  return _retval;
}

/**
    Creates a layout object set up to match the current transformation
    and target surface of the Cairo context.
    
    This layout can then be used for text measurement with functions
    like [gid.pango1.layout.Layout.getSize] or drawing with functions like
    `funcshow_layout`. If you change the transformation or target
    surface for cr, you need to call `funcupdate_layout`.
    
    This function is the most convenient way to use Cairo with Pango,
    however it is slightly inefficient since it creates a separate
    [gid.pango1.context.Context] object for each layout. This might matter in an
    application that was laying out large amounts of text.

    Params:
      cr = a Cairo context
    Returns: the newly created [gid.pango1.layout.Layout]
*/
gid.pango1.layout.Layout createLayout(gid.cairo1.context.Context cr) nothrow
{
  PangoLayout* _cretval;
  _cretval = pango_cairo_create_layout(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null);
  auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(PangoLayout*)_cretval, Yes.Take);
  return _retval;
}

/**
    Add a squiggly line to the current path in the specified cairo context that
    approximately covers the given rectangle in the style of an underline used
    to indicate a spelling error.
    
    The width of the underline is rounded to an integer number of up/down
    segments and the resulting rectangle is centered in the original rectangle.

    Params:
      cr = a Cairo context
      x = The X coordinate of one corner of the rectangle
      y = The Y coordinate of one corner of the rectangle
      width = Non-negative width of the rectangle
      height = Non-negative height of the rectangle
*/
void errorUnderlinePath(gid.cairo1.context.Context cr, double x, double y, double width, double height) nothrow
{
  pango_cairo_error_underline_path(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Adds the glyphs in glyphs to the current path in the specified
    cairo context.
    
    The origin of the glyphs (the left edge of the baseline)
    will be at the current point of the cairo context.

    Params:
      cr = a Cairo context
      font = a [gid.pango1.font.Font] from a [gid.pangocairo1.font_map.FontMap]
      glyphs = a [gid.pango1.glyph_string.GlyphString]
*/
void glyphStringPath(gid.cairo1.context.Context cr, gid.pango1.font.Font font, gid.pango1.glyph_string.GlyphString glyphs) nothrow
{
  pango_cairo_glyph_string_path(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, glyphs ? cast(PangoGlyphString*)glyphs._cPtr(No.Dup) : null);
}

/**
    Adds the text in [gid.pango1.layout_line.LayoutLine] to the current path in the
    specified cairo context.
    
    The origin of the glyphs (the left edge of the line) will be
    at the current point of the cairo context.

    Params:
      cr = a Cairo context
      line = a [gid.pango1.layout_line.LayoutLine]
*/
void layoutLinePath(gid.cairo1.context.Context cr, gid.pango1.layout_line.LayoutLine line) nothrow
{
  pango_cairo_layout_line_path(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, line ? cast(PangoLayoutLine*)line._cPtr(No.Dup) : null);
}

/**
    Adds the text in a [gid.pango1.layout.Layout] to the current path in the
    specified cairo context.
    
    The top-left corner of the [gid.pango1.layout.Layout] will be at the
    current point of the cairo context.

    Params:
      cr = a Cairo context
      layout = a Pango layout
*/
void layoutPath(gid.cairo1.context.Context cr, gid.pango1.layout.Layout layout) nothrow
{
  pango_cairo_layout_path(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
}

/**
    Draw a squiggly line in the specified cairo context that approximately
    covers the given rectangle in the style of an underline used to indicate a
    spelling error.
    
    The width of the underline is rounded to an integer
    number of up/down segments and the resulting rectangle is centered in the
    original rectangle.

    Params:
      cr = a Cairo context
      x = The X coordinate of one corner of the rectangle
      y = The Y coordinate of one corner of the rectangle
      width = Non-negative width of the rectangle
      height = Non-negative height of the rectangle
*/
void showErrorUnderline(gid.cairo1.context.Context cr, double x, double y, double width, double height) nothrow
{
  pango_cairo_show_error_underline(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
}

/**
    Draws the glyphs in glyph_item in the specified cairo context,
    
    embedding the text associated with the glyphs in the output if the
    output format supports it (PDF for example), otherwise it acts
    similar to `funcshow_glyph_string`.
    
    The origin of the glyphs (the left edge of the baseline) will
    be drawn at the current point of the cairo context.
    
    Note that text is the start of the text for layout, which is then
    indexed by `glyph_item->item->offset`.

    Params:
      cr = a Cairo context
      text = the UTF-8 text that glyph_item refers to
      glyphItem = a [gid.pango1.glyph_item.GlyphItem]
*/
void showGlyphItem(gid.cairo1.context.Context cr, string text, gid.pango1.glyph_item.GlyphItem glyphItem) nothrow
{
  const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
  pango_cairo_show_glyph_item(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, _text, glyphItem ? cast(PangoGlyphItem*)glyphItem._cPtr(No.Dup) : null);
}

/**
    Draws the glyphs in glyphs in the specified cairo context.
    
    The origin of the glyphs (the left edge of the baseline) will
    be drawn at the current point of the cairo context.

    Params:
      cr = a Cairo context
      font = a [gid.pango1.font.Font] from a [gid.pangocairo1.font_map.FontMap]
      glyphs = a [gid.pango1.glyph_string.GlyphString]
*/
void showGlyphString(gid.cairo1.context.Context cr, gid.pango1.font.Font font, gid.pango1.glyph_string.GlyphString glyphs) nothrow
{
  pango_cairo_show_glyph_string(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, glyphs ? cast(PangoGlyphString*)glyphs._cPtr(No.Dup) : null);
}

/**
    Draws a [gid.pango1.layout.Layout] in the specified cairo context.
    
    The top-left corner of the [gid.pango1.layout.Layout] will be drawn
    at the current point of the cairo context.

    Params:
      cr = a Cairo context
      layout = a Pango layout
*/
void showLayout(gid.cairo1.context.Context cr, gid.pango1.layout.Layout layout) nothrow
{
  pango_cairo_show_layout(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
}

/**
    Draws a [gid.pango1.layout_line.LayoutLine] in the specified cairo context.
    
    The origin of the glyphs (the left edge of the line) will
    be drawn at the current point of the cairo context.

    Params:
      cr = a Cairo context
      line = a [gid.pango1.layout_line.LayoutLine]
*/
void showLayoutLine(gid.cairo1.context.Context cr, gid.pango1.layout_line.LayoutLine line) nothrow
{
  pango_cairo_show_layout_line(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, line ? cast(PangoLayoutLine*)line._cPtr(No.Dup) : null);
}

/**
    Updates a [gid.pango1.context.Context] previously created for use with Cairo to
    match the current transformation and target surface of a Cairo
    context.
    
    If any layouts have been created for the context, it's necessary
    to call [gid.pango1.layout.Layout.contextChanged] on those layouts.

    Params:
      cr = a Cairo context
      context = a [gid.pango1.context.Context], from a pangocairo font map
*/
void updateContext(gid.cairo1.context.Context cr, gid.pango1.context.Context context) nothrow
{
  pango_cairo_update_context(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, context ? cast(PangoContext*)context._cPtr(No.Dup) : null);
}

/**
    Updates the private [gid.pango1.context.Context] of a [gid.pango1.layout.Layout] created with
    `funccreate_layout` to match the current transformation and target
    surface of a Cairo context.

    Params:
      cr = a Cairo context
      layout = a [gid.pango1.layout.Layout], from `funccreate_layout`
*/
void updateLayout(gid.cairo1.context.Context cr, gid.pango1.layout.Layout layout) nothrow
{
  pango_cairo_update_layout(cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
}
