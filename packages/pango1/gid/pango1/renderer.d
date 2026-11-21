/// Module for [Renderer] class
module gid.pango1.renderer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.color;
import gid.pango1.font;
import gid.pango1.glyph_item;
import gid.pango1.glyph_string;
import gid.pango1.layout;
import gid.pango1.layout_line;
import gid.pango1.matrix;
import gid.pango1.types;

/**
    [gid.pango1.renderer.Renderer] is a base class for objects that can render text
    provided as [gid.pango1.glyph_string.GlyphString] or [gid.pango1.layout.Layout].
    
    By subclassing [gid.pango1.renderer.Renderer] and overriding operations such as
    @draw_glyphs and @draw_rectangle, renderers for particular font
    backends and destinations can be created.
*/
class Renderer : gid.gobject2.object.ObjectWrap
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
    return cast(void function())pango_renderer_get_type != &gidSymbolNotFound ? pango_renderer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoRenderer";
  }

  /** Returns `this`, for use in `with` statements. */
  override Renderer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.renderer.Renderer]
      Returns: New builder object
  */
  static RendererGidBuilder builder() nothrow
  {
    return new RendererGidBuilder;
  }

  /**
      Does initial setup before rendering operations on renderer.
      
      [gid.pango1.renderer.Renderer.deactivate] should be called when done drawing.
      Calls such as [gid.pango1.renderer.Renderer.drawLayout] automatically
      activate the layout before drawing on it.
      
      Calls to [gid.pango1.renderer.Renderer.activate] and
      [gid.pango1.renderer.Renderer.deactivate] can be nested and the
      renderer will only be initialized and deinitialized once.
  */
  void activate() nothrow
  {
    pango_renderer_activate(cast(PangoRenderer*)this._cPtr);
  }

  /**
      Cleans up after rendering operations on renderer.
      
      See docs for [gid.pango1.renderer.Renderer.activate].
  */
  void deactivate() nothrow
  {
    pango_renderer_deactivate(cast(PangoRenderer*)this._cPtr);
  }

  /**
      Draw a squiggly line that approximately covers the given rectangle
      in the style of an underline used to indicate a spelling error.
      
      The width of the underline is rounded to an integer number
      of up/down segments and the resulting rectangle is centered
      in the original rectangle.
      
      This should be called while renderer is already active.
      Use [gid.pango1.renderer.Renderer.activate] to activate a renderer.
  
      Params:
        x = X coordinate of underline, in Pango units in user coordinate system
        y = Y coordinate of underline, in Pango units in user coordinate system
        width = width of underline, in Pango units in user coordinate system
        height = height of underline, in Pango units in user coordinate system
  */
  void drawErrorUnderline(int x, int y, int width, int height) nothrow
  {
    pango_renderer_draw_error_underline(cast(PangoRenderer*)this._cPtr, x, y, width, height);
  }

  /**
      Draws a single glyph with coordinates in device space.
  
      Params:
        font = a [gid.pango1.font.Font]
        glyph = the glyph index of a single glyph
        x = X coordinate of left edge of baseline of glyph
        y = Y coordinate of left edge of baseline of glyph
  */
  void drawGlyph(gid.pango1.font.Font font, gid.pango1.types.Glyph glyph, double x, double y) nothrow
  {
    pango_renderer_draw_glyph(cast(PangoRenderer*)this._cPtr, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, glyph, x, y);
  }

  /**
      Draws the glyphs in glyph_item with the specified [gid.pango1.renderer.Renderer],
      embedding the text associated with the glyphs in the output if the
      output format supports it.
      
      This is useful for rendering text in PDF.
      
      Note that this method does not handle attributes in glyph_item.
      If you want colors, shapes and lines handled automatically according
      to those attributes, you need to use [gid.pango1.renderer.Renderer.drawLayoutLine]
      or [gid.pango1.renderer.Renderer.drawLayout].
      
      Note that text is the start of the text for layout, which is then
      indexed by `glyph_item->item->offset`.
      
      If text is null, this simply calls [gid.pango1.renderer.Renderer.drawGlyphs].
      
      The default implementation of this method simply falls back to
      [gid.pango1.renderer.Renderer.drawGlyphs].
  
      Params:
        text = the UTF-8 text that glyph_item refers to
        glyphItem = a [gid.pango1.glyph_item.GlyphItem]
        x = X position of left edge of baseline, in user space coordinates
            in Pango units
        y = Y position of left edge of baseline, in user space coordinates
            in Pango units
  */
  void drawGlyphItem(string text, gid.pango1.glyph_item.GlyphItem glyphItem, int x, int y) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    pango_renderer_draw_glyph_item(cast(PangoRenderer*)this._cPtr, _text, glyphItem ? cast(PangoGlyphItem*)glyphItem._cPtr(No.Dup) : null, x, y);
  }

  /**
      Draws the glyphs in glyphs with the specified [gid.pango1.renderer.Renderer].
  
      Params:
        font = a [gid.pango1.font.Font]
        glyphs = a [gid.pango1.glyph_string.GlyphString]
        x = X position of left edge of baseline, in user space coordinates
            in Pango units.
        y = Y position of left edge of baseline, in user space coordinates
            in Pango units.
  */
  void drawGlyphs(gid.pango1.font.Font font, gid.pango1.glyph_string.GlyphString glyphs, int x, int y) nothrow
  {
    pango_renderer_draw_glyphs(cast(PangoRenderer*)this._cPtr, font ? cast(PangoFont*)font._cPtr(No.Dup) : null, glyphs ? cast(PangoGlyphString*)glyphs._cPtr(No.Dup) : null, x, y);
  }

  /**
      Draws layout with the specified [gid.pango1.renderer.Renderer].
      
      This is equivalent to drawing the lines of the layout, at their
      respective positions relative to `x`, `y`.
  
      Params:
        layout = a [gid.pango1.layout.Layout]
        x = X position of left edge of baseline, in user space coordinates
            in Pango units.
        y = Y position of left edge of baseline, in user space coordinates
            in Pango units.
  */
  void drawLayout(gid.pango1.layout.Layout layout, int x, int y) nothrow
  {
    pango_renderer_draw_layout(cast(PangoRenderer*)this._cPtr, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null, x, y);
  }

  /**
      Draws line with the specified [gid.pango1.renderer.Renderer].
      
      This draws the glyph items that make up the line, as well as
      shapes, backgrounds and lines that are specified by the attributes
      of those items.
  
      Params:
        line = a [gid.pango1.layout_line.LayoutLine]
        x = X position of left edge of baseline, in user space coordinates
            in Pango units.
        y = Y position of left edge of baseline, in user space coordinates
            in Pango units.
  */
  void drawLayoutLine(gid.pango1.layout_line.LayoutLine line, int x, int y) nothrow
  {
    pango_renderer_draw_layout_line(cast(PangoRenderer*)this._cPtr, line ? cast(PangoLayoutLine*)line._cPtr(No.Dup) : null, x, y);
  }

  /**
      Draws an axis-aligned rectangle in user space coordinates with the
      specified [gid.pango1.renderer.Renderer].
      
      This should be called while renderer is already active.
      Use [gid.pango1.renderer.Renderer.activate] to activate a renderer.
  
      Params:
        part = type of object this rectangle is part of
        x = X position at which to draw rectangle, in user space coordinates
            in Pango units
        y = Y position at which to draw rectangle, in user space coordinates
            in Pango units
        width = width of rectangle in Pango units
        height = height of rectangle in Pango units
  */
  void drawRectangle(gid.pango1.types.RenderPart part, int x, int y, int width, int height) nothrow
  {
    pango_renderer_draw_rectangle(cast(PangoRenderer*)this._cPtr, part, x, y, width, height);
  }

  /**
      Draws a trapezoid with the parallel sides aligned with the X axis
      using the given [gid.pango1.renderer.Renderer]; coordinates are in device space.
  
      Params:
        part = type of object this trapezoid is part of
        y1 = Y coordinate of top of trapezoid
        x11 = X coordinate of left end of top of trapezoid
        x21 = X coordinate of right end of top of trapezoid
        y2 = Y coordinate of bottom of trapezoid
        x12 = X coordinate of left end of bottom of trapezoid
        x22 = X coordinate of right end of bottom of trapezoid
  */
  void drawTrapezoid(gid.pango1.types.RenderPart part, double y1, double x11, double x21, double y2, double x12, double x22) nothrow
  {
    pango_renderer_draw_trapezoid(cast(PangoRenderer*)this._cPtr, part, y1, x11, x21, y2, x12, x22);
  }

  /**
      Gets the current alpha for the specified part.
  
      Params:
        part = the part to get the alpha for
      Returns: the alpha for the specified part,
          or 0 if it hasn't been set and should be
          inherited from the environment.
  */
  ushort getAlpha(gid.pango1.types.RenderPart part) nothrow
  {
    ushort _retval;
    _retval = pango_renderer_get_alpha(cast(PangoRenderer*)this._cPtr, part);
    return _retval;
  }

  /**
      Gets the current rendering color for the specified part.
  
      Params:
        part = the part to get the color for
      Returns: the color for the
          specified part, or null if it hasn't been set and should be
          inherited from the environment.
  */
  gid.pango1.color.Color getColor(gid.pango1.types.RenderPart part) nothrow
  {
    PangoColor* _cretval;
    _cretval = pango_renderer_get_color(cast(PangoRenderer*)this._cPtr, part);
    gid.pango1.color.Color _retval;
    if (_cretval)
      _retval = *cast(gid.pango1.color.Color*)_cretval;
    return _retval;
  }

  /**
      Gets the layout currently being rendered using renderer.
      
      Calling this function only makes sense from inside a subclass's
      methods, like in its draw_shape vfunc, for example.
      
      The returned layout should not be modified while still being
      rendered.
      Returns: the layout, or null if
          no layout is being rendered using renderer at this time.
  */
  gid.pango1.layout.Layout getLayout() nothrow
  {
    PangoLayout* _cretval;
    _cretval = pango_renderer_get_layout(cast(PangoRenderer*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the layout line currently being rendered using renderer.
      
      Calling this function only makes sense from inside a subclass's
      methods, like in its draw_shape vfunc, for example.
      
      The returned layout line should not be modified while still being
      rendered.
      Returns: the layout line, or null
          if no layout line is being rendered using renderer at this time.
  */
  gid.pango1.layout_line.LayoutLine getLayoutLine() nothrow
  {
    PangoLayoutLine* _cretval;
    _cretval = pango_renderer_get_layout_line(cast(PangoRenderer*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.layout_line.LayoutLine(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the transformation matrix that will be applied when
      rendering.
      
      See [gid.pango1.renderer.Renderer.setMatrix].
      Returns: the matrix, or null if no matrix has
          been set (which is the same as the identity matrix). The returned
          matrix is owned by Pango and must not be modified or freed.
  */
  gid.pango1.matrix.Matrix getMatrix() nothrow
  {
    const(PangoMatrix)* _cretval;
    _cretval = pango_renderer_get_matrix(cast(PangoRenderer*)this._cPtr);
    gid.pango1.matrix.Matrix _retval;
    if (_cretval)
      _retval = *cast(gid.pango1.matrix.Matrix*)_cretval;
    return _retval;
  }

  /**
      Informs Pango that the way that the rendering is done
      for part has changed.
      
      This should be called if the rendering changes in a way that would
      prevent multiple pieces being joined together into one drawing call.
      For instance, if a subclass of [gid.pango1.renderer.Renderer] was to add a stipple
      option for drawing underlines, it needs to call
      
      ```
      pango_renderer_part_changed (render, PANGO_RENDER_PART_UNDERLINE);
      ```
      
      When the stipple changes or underlines with different stipples
      might be joined together. Pango automatically calls this for
      changes to colors. (See [gid.pango1.renderer.Renderer.setColor])
  
      Params:
        part = the part for which rendering has changed.
  */
  void partChanged(gid.pango1.types.RenderPart part) nothrow
  {
    pango_renderer_part_changed(cast(PangoRenderer*)this._cPtr, part);
  }

  /**
      Sets the alpha for part of the rendering.
      
      Note that the alpha may only be used if a color is
      specified for part as well.
  
      Params:
        part = the part to set the alpha for
        alpha = an alpha value between 1 and 65536, or 0 to unset the alpha
  */
  void setAlpha(gid.pango1.types.RenderPart part, ushort alpha) nothrow
  {
    pango_renderer_set_alpha(cast(PangoRenderer*)this._cPtr, part, alpha);
  }

  /**
      Sets the color for part of the rendering.
      
      Also see [gid.pango1.renderer.Renderer.setAlpha].
  
      Params:
        part = the part to change the color of
        color = the new color or null to unset the current color
  */
  void setColor(gid.pango1.types.RenderPart part, gid.pango1.color.Color* color = null) nothrow
  {
    pango_renderer_set_color(cast(PangoRenderer*)this._cPtr, part, cast(const(PangoColor)*)color);
  }

  /**
      Sets the transformation matrix that will be applied when rendering.
  
      Params:
        matrix = a [gid.pango1.matrix.Matrix], or null to unset any existing matrix
           (No matrix set is the same as setting the identity matrix.)
  */
  void setMatrix(gid.pango1.matrix.Matrix* matrix = null) nothrow
  {
    pango_renderer_set_matrix(cast(PangoRenderer*)this._cPtr, cast(const(PangoMatrix)*)matrix);
  }
}

/// Fluent builder implementation template for [gid.pango1.renderer.Renderer]
class RendererGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.pango1.renderer.Renderer]
final class RendererGidBuilder : RendererGidBuilderImpl!RendererGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Renderer build() nothrow
  {
    return new Renderer(cast(void*)createGObject(Renderer._getGType), Yes.Take);
  }
}
