/// Module for [ScaledFont] class
module cairo.scaled_font;

import cairo.c.functions;
import cairo.c.types;
import cairo.font_face;
import cairo.font_options;
import cairo.glyph;
import cairo.matrix;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    A #cairo_scaled_font_t is a font scaled to a particular size and device
    resolution. A #cairo_scaled_font_t is most useful for low-level font
    usage where a library or application wants to cache a reference
    to a scaled font to speed up the computation of metrics.
    
    There are various types of scaled fonts, depending on the
    <firstterm>font backend</firstterm> they use. The type of a
    scaled font can be queried using [cairo.scaled_font.ScaledFont.getFontType].
    
    Memory management of #cairo_scaled_font_t is done with
    [cairo.scaled_font.ScaledFont.reference] and [cairo.scaled_font.ScaledFont.destroy].
*/
class ScaledFont : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_scaled_font_get_type != &gidSymbolNotFound ? cairo_gobject_scaled_font_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaledFont self()
  {
    return this;
  }

  /**
      Gets the metrics for a #cairo_scaled_font_t.
  
      Params:
        extents = a #cairo_font_extents_t which to store the retrieved extents.
  */
  void extents(out cairo.types.FontExtents extents)
  {
    cairo_scaled_font_extents(cast(cairo_scaled_font_t*)this._cPtr, &extents);
  }

  /**
      Stores the CTM with which scaled_font was created into ctm.
      Note that the translation offsets (x0, y0) of the CTM are ignored
      by [cairo.global.scaledFontCreate].  So, the matrix this
      function returns always has 0,0 as x0,y0.
  
      Params:
        ctm = return value for the CTM
  */
  void getCtm(out cairo.matrix.Matrix ctm)
  {
    cairo_scaled_font_get_ctm(cast(cairo_scaled_font_t*)this._cPtr, cast(cairo_matrix_t*)&ctm);
  }

  /**
      Gets the font face that this scaled font uses.  This might be the
      font face passed to [cairo.global.scaledFontCreate], but this does not
      hold true for all possible cases.
      Returns: The #cairo_font_face_t with which scaled_font was
        created.  This object is owned by cairo. To keep a reference to it,
        you must call [cairo.scaled_font.ScaledFont.reference].
  */
  cairo.font_face.FontFace getFontFace()
  {
    cairo_font_face_t* _cretval;
    _cretval = cairo_scaled_font_get_font_face(cast(cairo_scaled_font_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.font_face.FontFace(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Stores the font matrix with which scaled_font was created into
      matrix.
  
      Params:
        fontMatrix = return value for the matrix
  */
  void getFontMatrix(out cairo.matrix.Matrix fontMatrix)
  {
    cairo_scaled_font_get_font_matrix(cast(cairo_scaled_font_t*)this._cPtr, cast(cairo_matrix_t*)&fontMatrix);
  }

  /**
      Stores the font options with which scaled_font was created into
      options.
  
      Params:
        options = return value for the font options
  */
  void getFontOptions(cairo.font_options.FontOptions options)
  {
    cairo_scaled_font_get_font_options(cast(cairo_scaled_font_t*)this._cPtr, options ? cast(cairo_font_options_t*)options._cPtr(No.Dup) : null);
  }

  /**
      Stores the scale matrix of scaled_font into matrix.
      The scale matrix is product of the font matrix and the ctm
      associated with the scaled font, and hence is the matrix mapping from
      font space to device space.
  
      Params:
        scaleMatrix = return value for the matrix
  */
  void getScaleMatrix(out cairo.matrix.Matrix scaleMatrix)
  {
    cairo_scaled_font_get_scale_matrix(cast(cairo_scaled_font_t*)this._cPtr, cast(cairo_matrix_t*)&scaleMatrix);
  }

  /**
      This function returns the type of the backend used to create
      a scaled font. See #cairo_font_type_t for available types.
      However, this function never returns [cairo.types.FontType.Toy].
      Returns: The type of scaled_font.
  */
  cairo.types.FontType getFontType()
  {
    cairo_font_type_t _cretval;
    _cretval = cairo_scaled_font_get_type(cast(cairo_scaled_font_t*)this._cPtr);
    cairo.types.FontType _retval = cast(cairo.types.FontType)_cretval;
    return _retval;
  }

  /**
      Return user data previously attached to scaled_font using the
      specified key.  If no user data has been attached with the given
      key this function returns null.
  
      Params:
        key = the address of the #cairo_user_data_key_t the user data was
          attached to
      Returns: the user data previously attached or null.
  */
  void* getUserData(cairo.types.UserDataKey key)
  {
    auto _retval = cairo_scaled_font_get_user_data(cast(cairo_scaled_font_t*)this._cPtr, &key);
    return _retval;
  }

  /**
      Gets the extents for an array of glyphs. The extents describe a
      user-space rectangle that encloses the "inked" portion of the
      glyphs, (as they would be drawn by [cairo.context.Context.showGlyphs] if the cairo
      graphics state were set to the same font_face, font_matrix, ctm,
      and font_options as scaled_font).  Additionally, the x_advance and
      y_advance values indicate the amount by which the current point
      would be advanced by [cairo.context.Context.showGlyphs].
      
      Note that whitespace glyphs do not contribute to the size of the
      rectangle (extents.width and extents.height).
  
      Params:
        glyphs = an array of glyph IDs with X and Y offsets.
        numGlyphs = the number of glyphs in the glyphs array
        extents = a #cairo_text_extents_t which to store the retrieved extents.
  */
  void glyphExtents(cairo.glyph.Glyph glyphs, int numGlyphs, out cairo.types.TextExtents extents)
  {
    cairo_scaled_font_glyph_extents(cast(cairo_scaled_font_t*)this._cPtr, cast(const(cairo_glyph_t)*)&glyphs, numGlyphs, &extents);
  }

  /**
      Checks whether an error has previously occurred for this
      scaled_font.
      Returns: [cairo.types.Status.Success] or another error such as
          [cairo.types.Status.NoMemory].
  */
  cairo.types.Status status()
  {
    cairo_status_t _cretval;
    _cretval = cairo_scaled_font_status(cast(cairo_scaled_font_t*)this._cPtr);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the extents for a string of text. The extents describe a
      user-space rectangle that encloses the "inked" portion of the text
      drawn at the origin (0,0) (as it would be drawn by [cairo.context.Context.showText]
      if the cairo graphics state were set to the same font_face,
      font_matrix, ctm, and font_options as scaled_font).  Additionally,
      the x_advance and y_advance values indicate the amount by which the
      current point would be advanced by [cairo.context.Context.showText].
      
      Note that whitespace characters do not directly contribute to the
      size of the rectangle (extents.width and extents.height). They do
      contribute indirectly by changing the position of non-whitespace
      characters. In particular, trailing whitespace characters are
      likely to not affect the size of the rectangle, though they will
      affect the x_advance and y_advance values.
  
      Params:
        utf8 = a NUL-terminated string of text, encoded in UTF-8
        extents = a #cairo_text_extents_t which to store the retrieved extents.
  */
  void textExtents(string utf8, out cairo.types.TextExtents extents)
  {
    const(char)* _utf8 = utf8.toCString(No.Alloc);
    cairo_scaled_font_text_extents(cast(cairo_scaled_font_t*)this._cPtr, _utf8, &extents);
  }
}
