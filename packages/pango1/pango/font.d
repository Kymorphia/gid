/// Module for [Font] class
module pango.font;

import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;
import harfbuzz.feature;
import pango.c.functions;
import pango.c.types;
import pango.context;
import pango.coverage;
import pango.font_description;
import pango.font_face;
import pango.font_map;
import pango.font_metrics;
import pango.language;
import pango.types;

/**
    A [pango.font.Font] is used to represent a font in a
    rendering-system-independent manner.
*/
class Font : gobject.object.ObjectWrap
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
    return cast(void function())pango_font_get_type != &gidSymbolNotFound ? pango_font_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Font self()
  {
    return this;
  }

  /**
      Loads data previously created via [pango.font.Font.serialize].
      
      For a discussion of the supported format, see that function.
      
      Note: to verify that the returned font is identical to
      the one that was serialized, you can compare bytes to the
      result of serializing the font again.
  
      Params:
        context = a [pango.context.Context]
        bytes = the bytes containing the data
      Returns: a new [pango.font.Font]
      Throws: [ErrorWrap]
  */
  static pango.font.Font deserialize(pango.context.Context context, glib.bytes.Bytes bytes)
  {
    PangoFont* _cretval;
    GError *_err;
    _cretval = pango_font_deserialize(context ? cast(PangoContext*)context._cPtr(No.Dup) : null, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns a description of the font, with font size set in points.
      
      Use [pango.font.Font.describeWithAbsoluteSize] if you want
      the font size in device units.
      Returns: a newly-allocated [pango.font_description.FontDescription] object.
  */
  pango.font_description.FontDescription describe()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_describe(cast(PangoFont*)this._cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a description of the font, with absolute font size set
      in device units.
      
      Use [pango.font.Font.describe] if you want the font size in points.
      Returns: a newly-allocated [pango.font_description.FontDescription] object.
  */
  pango.font_description.FontDescription describeWithAbsoluteSize()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_describe_with_absolute_size(cast(PangoFont*)this._cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Computes the coverage map for a given font and language tag.
  
      Params:
        language = the language tag
      Returns: a newly-allocated [pango.coverage.Coverage]
          object.
  */
  pango.coverage.Coverage getCoverage(pango.language.Language language)
  {
    PangoCoverage* _cretval;
    _cretval = pango_font_get_coverage(cast(PangoFont*)this._cPtr, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.coverage.Coverage)(cast(PangoCoverage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the [pango.font_face.FontFace] to which font belongs.
      Returns: the [pango.font_face.FontFace]
  */
  pango.font_face.FontFace getFace()
  {
    PangoFontFace* _cretval;
    _cretval = pango_font_get_face(cast(PangoFont*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_face.FontFace)(cast(PangoFontFace*)_cretval, No.Take);
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
  void getFeatures(ref harfbuzz.feature.Feature[] features, ref uint numFeatures)
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
      as a [pango.context.Context] holds a reference to the font map.
      Returns: the [pango.font_map.FontMap]
          for the font
  */
  pango.font_map.FontMap getFontMap()
  {
    PangoFontMap* _cretval;
    _cretval = pango_font_get_font_map(cast(PangoFont*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
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
  void getGlyphExtents(pango.types.Glyph glyph, out pango.types.Rectangle inkRect, out pango.types.Rectangle logicalRect)
  {
    pango_font_get_glyph_extents(cast(PangoFont*)this._cPtr, glyph, &inkRect, &logicalRect);
  }

  /**
      Returns the languages that are supported by font.
      
      If the font backend does not provide this information,
      null is returned. For the fontconfig backend, this
      corresponds to the FC_LANG member of the FcPattern.
      
      The returned array is only valid as long as the font
      and its fontmap are valid.
      Returns: an array of [pango.language.Language]
  */
  pango.language.Language[] getLanguages()
  {
    PangoLanguage** _cretval;
    _cretval = pango_font_get_languages(cast(PangoFont*)this._cPtr);
    pango.language.Language[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new pango.language.Language[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new pango.language.Language(cast(void*)_cretval[i], No.Take);
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
      Returns: a [pango.font_metrics.FontMetrics] object. The caller must call
          [pango.font_metrics.FontMetrics.unref] when finished using the object.
  */
  pango.font_metrics.FontMetrics getMetrics(pango.language.Language language = null)
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_font_get_metrics(cast(PangoFont*)this._cPtr, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    pango.font_metrics.FontMetrics _retval;
    if (_cretval)
      _retval = *cast(pango.font_metrics.FontMetrics*)_cretval;
    return _retval;
  }

  /**
      Returns whether the font provides a glyph for this character.
  
      Params:
        wc = a Unicode character
      Returns: `TRUE` if font can render wc
  */
  bool hasChar(dchar wc)
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
      
      To recreate a font from its serialized form, use [pango.font.Font.deserialize].
      Returns: a [glib.bytes.Bytes] containing the serialized form of font
  */
  glib.bytes.Bytes serialize()
  {
    GBytes* _cretval;
    _cretval = pango_font_serialize(cast(PangoFont*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
