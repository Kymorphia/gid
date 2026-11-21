/// Module for [TextNode] class
module gid.gsk4.text_node;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.rgba;
import gid.gobject2.object;
import gid.graphene1.point;
import gid.gsk4.c.functions;
import gid.gsk4.c.types;
import gid.gsk4.render_node;
import gid.gsk4.types;
import gid.pango1.font;
import gid.pango1.glyph_info;
import gid.pango1.glyph_string;

/**
    A render node drawing a set of glyphs.
*/
class TextNode : gid.gsk4.render_node.RenderNode
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
    return cast(void function())gsk_text_node_get_type != &gidSymbolNotFound ? gsk_text_node_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /**
      Creates a render node that renders the given glyphs.
      
      Note that color may not be used if the font contains
      color glyphs.
  
      Params:
        font = the [gid.pango1.font.Font] containing the glyphs
        glyphs = the [gid.pango1.glyph_string.GlyphString] to render
        color = the foreground color to render with
        offset = offset of the baseline
      Returns: a new [gid.gsk4.render_node.RenderNode]
  */
  this(gid.pango1.font.Font font, gid.pango1.glyph_string.GlyphString glyphs, gid.gdk4.rgba.RGBA color, gid.graphene1.point.Point offset) nothrow
  {
    GskRenderNode* _cretval;
    _cretval = gsk_text_node_new(font ? cast(PangoFont*)font._cPtr(No.Dup) : null, glyphs ? cast(PangoGlyphString*)glyphs._cPtr(No.Dup) : null, cast(const(GdkRGBA)*)&color, cast(const(graphene_point_t)*)&offset);
    this(_cretval, Yes.Take);
  }

  /**
      Retrieves the color used by the text node.
      
      The value returned by this function will not be correct
      if the render node was created for a non-sRGB color.
      Returns: the text color
  */
  gid.gdk4.rgba.RGBA getColor() nothrow
  {
    const(GdkRGBA)* _cretval;
    _cretval = gsk_text_node_get_color(cast(const(GskRenderNode)*)this._cPtr);
    gid.gdk4.rgba.RGBA _retval;
    if (_cretval)
      _retval = *cast(gid.gdk4.rgba.RGBA*)_cretval;
    return _retval;
  }

  /**
      Returns the font used by the text node.
      Returns: the font
  */
  gid.pango1.font.Font getFont() nothrow
  {
    PangoFont* _cretval;
    _cretval = gsk_text_node_get_font(cast(const(GskRenderNode)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the glyph information in the node.
      Returns: the glyph information
  */
  gid.pango1.glyph_info.GlyphInfo[] getGlyphs() nothrow
  {
    const(PangoGlyphInfo)* _cretval;
    uint _cretlength;
    _cretval = gsk_text_node_get_glyphs(cast(const(GskRenderNode)*)this._cPtr, &_cretlength);
    gid.pango1.glyph_info.GlyphInfo[] _retval;

    if (_cretval)
    {
      _retval = new gid.pango1.glyph_info.GlyphInfo[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.pango1.glyph_info.GlyphInfo(cast(void*)&_cretval[i], No.Take);
    }
    return _retval;
  }

  /**
      Retrieves the number of glyphs in the text node.
      Returns: the number of glyphs
  */
  uint getNumGlyphs() nothrow
  {
    uint _retval;
    _retval = gsk_text_node_get_num_glyphs(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the offset applied to the text.
      Returns: a point with the horizontal and vertical offsets
  */
  gid.graphene1.point.Point getOffset() nothrow
  {
    const(graphene_point_t)* _cretval;
    _cretval = gsk_text_node_get_offset(cast(const(GskRenderNode)*)this._cPtr);
    gid.graphene1.point.Point _retval;
    if (_cretval)
      _retval = *cast(gid.graphene1.point.Point*)_cretval;
    return _retval;
  }

  /**
      Checks whether the text node has color glyphs.
      Returns: true if the text node has color glyphs
  */
  bool hasColorGlyphs() nothrow
  {
    bool _retval;
    _retval = cast(bool)gsk_text_node_has_color_glyphs(cast(const(GskRenderNode)*)this._cPtr);
    return _retval;
  }
}
