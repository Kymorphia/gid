/// Module for [Font] class
module gid.pango1.font;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.harfbuzz0.feature;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.context;
import gid.pango1.coverage;
import gid.pango1.font_description;
import gid.pango1.font_face;
import gid.pango1.font_map;
import gid.pango1.font_metrics;
import gid.pango1.language;
import gid.pango1.types;

/**
    A [gid.pango1.font.Font] is used to represent a font in a
    rendering-system-independent manner.
*/
class Font : gid.gobject2.object.ObjectWrap
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
    return cast(void function())pango_font_get_type != &gidSymbolNotFound ? pango_font_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoFont";
  }

  /** Returns `this`, for use in `with` statements. */
  override Font self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.font.Font]
      Returns: New builder object
  */
  static FontGidBuilder builder() nothrow
  {
    return new FontGidBuilder;
  }

  /**
      Loads data previously created via [gid.pango1.font.Font.serialize].
      
      For a discussion of the supported format, see that function.
      
      Note: to verify that the returned font is identical to
      the one that was serialized, you can compare bytes to the
      result of serializing the font again.
  
      Params:
        context = a [gid.pango1.context.Context]
        bytes = the bytes containing the data
      Returns: a new [gid.pango1.font.Font]
      Throws: [ErrorWrap]
  */
  static gid.pango1.font.Font deserialize(gid.pango1.context.Context context, gid.glib2.bytes.Bytes bytes)
  {
    PangoFont* _cretval;
    GError *_err;
    _cretval = pango_font_deserialize(context ? cast(PangoContext*)context._cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a description of the font, with font size set in points.
      
      Use [gid.pango1.font.Font.describeWithAbsoluteSize] if you want
      the font size in device units.
      Returns: a newly-allocated [gid.pango1.font_description.FontDescription] object.
  */
  gid.pango1.font_description.FontDescription describe() nothrow
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_describe(cast(PangoFont*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a description of the font, with absolute font size set
      in device units.
      
      Use [gid.pango1.font.Font.describe] if you want the font size in points.
      Returns: a newly-allocated [gid.pango1.font_description.FontDescription] object.
  */
  gid.pango1.font_description.FontDescription describeWithAbsoluteSize() nothrow
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_describe_with_absolute_size(cast(PangoFont*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Computes the coverage map for a given font and language tag.
  
      Params:
        language = the language tag
      Returns: a newly-allocated [gid.pango1.coverage.Coverage]
          object.
  */
  gid.pango1.coverage.Coverage getCoverage(gid.pango1.language.Language language) nothrow
  {
    PangoCoverage* _cretval;
    _cretval = pango_font_get_coverage(cast(PangoFont*)this._cPtr, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.coverage.Coverage)(cast(PangoCoverage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the [gid.pango1.font_face.FontFace] to which font belongs.
      
      Note that this function can return `NULL` in cases
      where the font outlives its font map.
      Returns: the [gid.pango1.font_face.FontFace]
  */
  gid.pango1.font_face.FontFace getFace() nothrow
  {
    PangoFontFace* _cretval;
    _cretval = pango_font_get_face(cast(PangoFont*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtain the OpenType features that are provided by the font.
      
      These are passed to the rendering system, together with features
      that have been explicitly set via attributes.
      
      Note that this does not include OpenType features which the
      rendering system enables by default.
  
      Params:
        features = Array to features in
        numFeatures = the number of used items in features
  */
  void getFeatures(ref gid.harfbuzz0.feature.Feature[] features, ref uint numFeatures) nothrow
  {
    uint _len;
    _len = cast(uint)features.length;
    pango_font_get_features(cast(PangoFont*)this._cPtr, cast(hb_feature_t*)features.ptr, _len, cast(uint*)&numFeatures);
  }

  /**
      Gets the font map for which the font was created.
      
      Note that the font maintains a *weak* reference to
      the font map, so if all references to font map are
      dropped, the font map will be finalized even if there
      are fonts created with the font map that are still alive.
      In that case this function will return null.
      
      It is the responsibility of the user to ensure that the
      font map is kept alive. In most uses this is not an issue
      as a [gid.pango1.context.Context] holds a reference to the font map.
      Returns: the [gid.pango1.font_map.FontMap]
          for the font
  */
  gid.pango1.font_map.FontMap getFontMap() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = pango_font_get_font_map(cast(PangoFont*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the logical and ink extents of a glyph within a font.
      
      The coordinate system for each rectangle has its origin at the
      base line and horizontal origin of the character with increasing
      coordinates extending to the right and down. The macros PANGO_ASCENT(),
      PANGO_DESCENT(), PANGO_LBEARING(), and PANGO_RBEARING() can be used to convert
      from the extents rectangle to more traditional font metrics. The units
      of the rectangles are in 1/PANGO_SCALE of a device unit.
      
      If font is null, this function gracefully sets some sane values in the
      output variables and returns.
  
      Params:
        glyph = the glyph index
        inkRect = rectangle used to store the extents of the glyph as drawn
        logicalRect = rectangle used to store the logical extents of the glyph
  */
  void getGlyphExtents(gid.pango1.types.Glyph glyph, out gid.pango1.types.Rectangle inkRect, out gid.pango1.types.Rectangle logicalRect) nothrow
  {
    pango_font_get_glyph_extents(cast(PangoFont*)this._cPtr, glyph, cast(PangoRectangle*)&inkRect, cast(PangoRectangle*)&logicalRect);
  }

  /**
      Returns the languages that are supported by font.
      
      If the font backend does not provide this information,
      null is returned. For the fontconfig backend, this
      corresponds to the FC_LANG member of the FcPattern.
      
      The returned array is only valid as long as the font
      and its fontmap are valid.
      Returns: an array of [gid.pango1.language.Language]
  */
  gid.pango1.language.Language[] getLanguages() nothrow
  {
    PangoLanguage** _cretval;
    _cretval = pango_font_get_languages(cast(PangoFont*)this._cPtr);
    gid.pango1.language.Language[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new gid.pango1.language.Language[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.pango1.language.Language(cast(void*)_cretval[i], No.Take);
    }
    return _retval;
  }

  /**
      Gets overall metric information for a font.
      
      Since the metrics may be substantially different for different scripts,
      a language tag can be provided to indicate that the metrics should be
      retrieved that correspond to the script(s) used by that language.
      
      If font is null, this function gracefully sets some sane values in the
      output variables and returns.
  
      Params:
        language = language tag used to determine which script
            to get the metrics for, or null to indicate to get the metrics for
            the entire font.
      Returns: a [gid.pango1.font_metrics.FontMetrics] object. The caller must call
          [gid.pango1.font_metrics.FontMetrics.unref] when finished using the object.
  */
  gid.pango1.font_metrics.FontMetrics getMetrics(gid.pango1.language.Language language = null) nothrow
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_font_get_metrics(cast(PangoFont*)this._cPtr, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    gid.pango1.font_metrics.FontMetrics _retval;
    if (_cretval)
    {
      _retval = *cast(gid.pango1.font_metrics.FontMetrics*)_cretval;
      cValueFree!(gid.pango1.font_metrics.FontMetrics)(_cretval);
    }
    return _retval;
  }

  /**
      Returns whether the font provides a glyph for this character.
  
      Params:
        wc = a Unicode character
      Returns: `TRUE` if font can render wc
  */
  bool hasChar(dchar wc) nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_font_has_char(cast(PangoFont*)this._cPtr, wc);
    return _retval;
  }

  /**
      Serializes the font in a way that can be uniquely identified.
      
      There are no guarantees about the format of the output across different
      versions of Pango.
      
      The intended use of this function is testing, benchmarking and debugging.
      The format is not meant as a permanent storage format.
      
      To recreate a font from its serialized form, use [gid.pango1.font.Font.deserialize].
      Returns: a [gid.glib2.bytes.Bytes] containing the serialized form of font
  */
  gid.glib2.bytes.Bytes serialize() nothrow
  {
    GBytes* _cretval;
    _cretval = pango_font_serialize(cast(PangoFont*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.pango1.font.Font]
class FontGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.pango1.font.Font]
final class FontGidBuilder : FontGidBuilderImpl!FontGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Font build() nothrow
  {
    return new Font(cast(void*)createGObject(Font._getGType), Yes.Take);
  }
}
