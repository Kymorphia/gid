/// Module for [ScaledFont] class
module cairo.scaled_font;

public import gid.basictypes;
import cairo.c.functions;
import cairo.c.types;
import cairo.font_face;
import cairo.font_options;
import cairo.glyph;
import cairo.matrix;
import cairo.types;
import gid.gid;
import gobject.boxed;

import cairo.text_cluster;

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
class ScaledFont : gobject.boxed.BoxedWrap!(cairo_gobject_scaled_font_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaledFont self() nothrow
  {
    return this;
  }

  /**
  Converts UTF-8 text to an array of glyphs, with cluster mapping, that can be used to render later using this
  scaled font (with [cairo.context.Context.showTextGlyphs] for example).
  Params:
  x = X position to place first glyph
  y = Y position to place first glyph
  utf8 = a string of text encoded in UTF-8
  glyphs = Output array of glyphs (empty on error)
  clusters = Output array of cluster mapping information (empty on error)
  clusterFlags = Output cluster mapping flags
  Returns: [cairo.types.Status.Success] upon success, or an error status if the input values are wrong or if
  conversion failed. If the scaled font is in an error state, its status is returned.
  */
  cairo.types.Status textToGlyphs(double x, double y, string utf8, out cairo.glyph.Glyph[] glyphs, out cairo.text_cluster.TextCluster[] clusters, out cairo.types.TextClusterFlags clusterFlags) nothrow
  {
    import cairo.glyph : Glyph;
    import cairo.text_cluster : TextCluster;

    cairo_glyph_t* _glyphs; // Allocated by cairo (initial null)
    int _numGlyphs;
    cairo_text_cluster_t* _clusters;
    int _numClusters;
    auto _retval = cairo_scaled_font_text_to_glyphs(cast(cairo_scaled_font_t*)this._cPtr, x, y, utf8.length > 0 ? utf8.ptr : "".ptr, cast(int)utf8.length, &_glyphs, &_numGlyphs, &_clusters, &_numClusters, &clusterFlags);

    if (_retval == cairo_status_t.Success)
    {
      glyphs = (cast(Glyph*)_glyphs)[0 .. _numGlyphs].dup;
      clusters = (cast(TextCluster*)_clusters)[0 .. _numClusters].dup;
    }

    cairo_glyph_free(_glyphs); // Pointers are reset to the initial null by cairo on error
    cairo_text_cluster_free(_clusters);
    return _retval;
  }

  /**
  Converts UTF-8 text to an array of glyphs, without cluster mapping, that can be used to render later using this
  scaled font (with [cairo.context.Context.showGlyphs] for example).
  Params:
  x = X position to place first glyph
  y = Y position to place first glyph
  utf8 = a string of text encoded in UTF-8
  glyphs = Output array of glyphs (empty on error)
  Returns: [cairo.types.Status.Success] upon success, or an error status if the input values are wrong or if
  conversion failed. If the scaled font is in an error state, its status is returned.
  */
  cairo.types.Status textToGlyphs(double x, double y, string utf8, out cairo.glyph.Glyph[] glyphs) nothrow
  {
    import cairo.glyph : Glyph;

    cairo_glyph_t* _glyphs; // Allocated by cairo (initial null)
    int _numGlyphs;
    auto _retval = cairo_scaled_font_text_to_glyphs(cast(cairo_scaled_font_t*)this._cPtr, x, y, utf8.length > 0 ? utf8.ptr : "".ptr, cast(int)utf8.length, &_glyphs, &_numGlyphs, null, null, null);

    if (_retval == cairo_status_t.Success)
      glyphs = (cast(Glyph*)_glyphs)[0 .. _numGlyphs].dup;

    cairo_glyph_free(_glyphs); // Pointer is reset to the initial null by cairo on error
    return _retval;
  }

  /**
      Gets the metrics for a #cairo_scaled_font_t.
  
      Params:
        extents = a #cairo_font_extents_t which to store the retrieved extents.
  */
  void extents(out cairo.types.FontExtents extents) nothrow
  {
    cairo_scaled_font_extents(cast(cairo_scaled_font_t*)this._cPtr, cast(cairo_font_extents_t*)&extents);
  }

  /**
      Stores the CTM with which scaled_font was created into ctm.
      Note that the translation offsets (x0, y0) of the CTM are ignored
      by [cairo.global.scaledFontCreate].  So, the matrix this
      function returns always has 0,0 as x0,y0.
  
      Params:
        ctm = return value for the CTM
  */
  void getCtm(out cairo.matrix.Matrix ctm) nothrow
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
  cairo.font_face.FontFace getFontFace() nothrow
  {
    cairo_font_face_t* _cretval;
    _cretval = cairo_scaled_font_get_font_face(cast(cairo_scaled_font_t*)this._cPtr);
    auto _retval = _cretval ? new cairo.font_face.FontFace(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Stores the font matrix with which scaled_font was created into
      matrix.
  
      Params:
        fontMatrix = return value for the matrix
  */
  void getFontMatrix(out cairo.matrix.Matrix fontMatrix) nothrow
  {
    cairo_scaled_font_get_font_matrix(cast(cairo_scaled_font_t*)this._cPtr, cast(cairo_matrix_t*)&fontMatrix);
  }

  /**
      Stores the font options with which scaled_font was created into
      options.
  
      Params:
        options = return value for the font options
  */
  void getFontOptions(cairo.font_options.FontOptions options) nothrow
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
  void getScaleMatrix(out cairo.matrix.Matrix scaleMatrix) nothrow
  {
    cairo_scaled_font_get_scale_matrix(cast(cairo_scaled_font_t*)this._cPtr, cast(cairo_matrix_t*)&scaleMatrix);
  }

  /**
      This function returns the type of the backend used to create
      a scaled font. See #cairo_font_type_t for available types.
      However, this function never returns [cairo.types.FontType.Toy].
      Returns: The type of scaled_font.
  */
  cairo.types.FontType getFontType() nothrow
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
  void* getUserData(cairo.types.UserDataKey key) nothrow
  {
    auto _retval = cairo_scaled_font_get_user_data(cast(cairo_scaled_font_t*)this._cPtr, cast(const(cairo_user_data_key_t)*)&key);
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
        extents = a #cairo_text_extents_t which to store the retrieved extents.
  */
  void glyphExtents(cairo.glyph.Glyph[] glyphs, out cairo.types.TextExtents extents) nothrow
  {
    int _numGlyphs;
    if (glyphs)
      _numGlyphs = cast(int)glyphs.length;

    auto _glyphs = cast(cairo_glyph_t*)glyphs.ptr;
    cairo_scaled_font_glyph_extents(cast(cairo_scaled_font_t*)this._cPtr, _glyphs, _numGlyphs, cast(cairo_text_extents_t*)&extents);
  }

  /**
      Checks whether an error has previously occurred for this
      scaled_font.
      Returns: [cairo.types.Status.Success] or another error such as
          [cairo.types.Status.NoMemory].
  */
  cairo.types.Status status() nothrow
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
  void textExtents(string utf8, out cairo.types.TextExtents extents) nothrow
  {
    const(char)* _utf8 = utf8.toCString!(No.Malloc, No.Nullable);
    cairo_scaled_font_text_extents(cast(cairo_scaled_font_t*)this._cPtr, _utf8, cast(cairo_text_extents_t*)&extents);
  }
}
