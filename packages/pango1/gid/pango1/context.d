/// Module for [Context] class
module gid.pango1.context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.font;
import gid.pango1.font_description;
import gid.pango1.font_family;
import gid.pango1.font_map;
import gid.pango1.font_metrics;
import gid.pango1.fontset;
import gid.pango1.language;
import gid.pango1.matrix;
import gid.pango1.types;

/**
    A [gid.pango1.context.Context] stores global information used to control the
    itemization process.
    
    The information stored by [gid.pango1.context.Context] includes the fontmap used
    to look up fonts, and default values such as the default language,
    default gravity, or default font.
    
    To obtain a [gid.pango1.context.Context], use [gid.pango1.font_map.FontMap.createContext].
*/
class Context : gid.gobject2.object.ObjectWrap
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
    return cast(void function())pango_context_get_type != &gidSymbolNotFound ? pango_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override Context self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.context.Context]
      Returns: New builder object
  */
  static ContextGidBuilder builder() nothrow
  {
    return new ContextGidBuilder;
  }

  /**
      Creates a new [gid.pango1.context.Context] initialized to default values.
      
      This function is not particularly useful as it should always
      be followed by a [gid.pango1.context.Context.setFontMap] call, and the
      function [gid.pango1.font_map.FontMap.createContext] does these two steps
      together and hence users are recommended to use that.
      
      If you are using Pango as part of a higher-level system,
      that system may have it's own way of create a [gid.pango1.context.Context].
      For instance, the GTK toolkit has, among others,
      `[gid.gtk4.widget.Widget.getPangoContext]`. Use those instead.
      Returns: the newly allocated [gid.pango1.context.Context], which should
          be freed with [gid.gobject2.object.ObjectWrap.unref].
  */
  this() nothrow
  {
    PangoContext* _cretval;
    _cretval = pango_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Forces a change in the context, which will cause any [gid.pango1.layout.Layout]
      using this context to re-layout.
      
      This function is only useful when implementing a new backend
      for Pango, something applications won't do. Backends should
      call this function if they have attached extra data to the context
      and such data is changed.
  */
  void changed() nothrow
  {
    pango_context_changed(cast(PangoContext*)this._cPtr);
  }

  /**
      Retrieves the base direction for the context.
      
      See [gid.pango1.context.Context.setBaseDir].
      Returns: the base direction for the context.
  */
  gid.pango1.types.Direction getBaseDir() nothrow
  {
    PangoDirection _cretval;
    _cretval = pango_context_get_base_dir(cast(PangoContext*)this._cPtr);
    gid.pango1.types.Direction _retval = cast(gid.pango1.types.Direction)_cretval;
    return _retval;
  }

  /**
      Retrieves the base gravity for the context.
      
      See [gid.pango1.context.Context.setBaseGravity].
      Returns: the base gravity for the context.
  */
  gid.pango1.types.Gravity getBaseGravity() nothrow
  {
    PangoGravity _cretval;
    _cretval = pango_context_get_base_gravity(cast(PangoContext*)this._cPtr);
    gid.pango1.types.Gravity _retval = cast(gid.pango1.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Retrieve the default font description for the context.
      Returns: a pointer to the context's default font
          description. This value must not be modified or freed.
  */
  gid.pango1.font_description.FontDescription getFontDescription() nothrow
  {
    PangoFontDescription* _cretval;
    _cretval = pango_context_get_font_description(cast(PangoContext*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the [gid.pango1.font_map.FontMap] used to look up fonts for this context.
      Returns: the font map for the.
          [gid.pango1.context.Context] This value is owned by Pango and should not be
          unreferenced.
  */
  gid.pango1.font_map.FontMap getFontMap() nothrow
  {
    PangoFontMap* _cretval;
    _cretval = pango_context_get_font_map(cast(PangoContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the gravity for the context.
      
      This is similar to [gid.pango1.context.Context.getBaseGravity],
      except for when the base gravity is [gid.pango1.types.Gravity.Auto] for
      which `funcPango.Gravity.get_for_matrix` is used to return the
      gravity from the current context matrix.
      Returns: the resolved gravity for the context.
  */
  gid.pango1.types.Gravity getGravity() nothrow
  {
    PangoGravity _cretval;
    _cretval = pango_context_get_gravity(cast(PangoContext*)this._cPtr);
    gid.pango1.types.Gravity _retval = cast(gid.pango1.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Retrieves the gravity hint for the context.
      
      See [gid.pango1.context.Context.setGravityHint] for details.
      Returns: the gravity hint for the context.
  */
  gid.pango1.types.GravityHint getGravityHint() nothrow
  {
    PangoGravityHint _cretval;
    _cretval = pango_context_get_gravity_hint(cast(PangoContext*)this._cPtr);
    gid.pango1.types.GravityHint _retval = cast(gid.pango1.types.GravityHint)_cretval;
    return _retval;
  }

  /**
      Retrieves the global language tag for the context.
      Returns: the global language tag.
  */
  gid.pango1.language.Language getLanguage() nothrow
  {
    PangoLanguage* _cretval;
    _cretval = pango_context_get_language(cast(PangoContext*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.language.Language(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the transformation matrix that will be applied when
      rendering with this context.
      
      See [gid.pango1.context.Context.setMatrix].
      Returns: the matrix, or null if no
          matrix has been set (which is the same as the identity matrix).
          The returned matrix is owned by Pango and must not be modified
          or freed.
  */
  gid.pango1.matrix.Matrix getMatrix() nothrow
  {
    const(PangoMatrix)* _cretval;
    _cretval = pango_context_get_matrix(cast(PangoContext*)this._cPtr);
    gid.pango1.matrix.Matrix _retval;
    if (_cretval)
      _retval = *cast(gid.pango1.matrix.Matrix*)_cretval;
    return _retval;
  }

  /**
      Get overall metric information for a particular font description.
      
      Since the metrics may be substantially different for different scripts,
      a language tag can be provided to indicate that the metrics should be
      retrieved that correspond to the script(s) used by that language.
      
      The [gid.pango1.font_description.FontDescription] is interpreted in the same way as by `funcitemize`,
      and the family name may be a comma separated list of names. If characters
      from multiple of these families would be used to render the string, then
      the returned fonts would be a composite of the metrics for the fonts loaded
      for the individual families.
  
      Params:
        desc = a [gid.pango1.font_description.FontDescription] structure. null means that the
            font description from the context will be used.
        language = language tag used to determine which script to get
            the metrics for. null means that the language tag from the context
            will be used. If no language tag is set on the context, metrics
            for the default language (as determined by [gid.pango1.language.Language.getDefault]
            will be returned.
      Returns: a [gid.pango1.font_metrics.FontMetrics] object. The caller must call
          [gid.pango1.font_metrics.FontMetrics.unref] when finished using the object.
  */
  gid.pango1.font_metrics.FontMetrics getMetrics(gid.pango1.font_description.FontDescription desc = null, gid.pango1.language.Language language = null) nothrow
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_context_get_metrics(cast(PangoContext*)this._cPtr, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    gid.pango1.font_metrics.FontMetrics _retval;
    if (_cretval)
    {
      _retval = *cast(gid.pango1.font_metrics.FontMetrics*)_cretval;
      cValueFree!(gid.pango1.font_metrics.FontMetrics)(_cretval);
    }
    return _retval;
  }

  /**
      Returns whether font rendering with this context should
      round glyph positions and widths.
      Returns: 
  */
  bool getRoundGlyphPositions() nothrow
  {
    bool _retval;
    _retval = cast(bool)pango_context_get_round_glyph_positions(cast(PangoContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current serial number of context.
      
      The serial number is initialized to an small number larger than zero
      when a new context is created and is increased whenever the context
      is changed using any of the setter functions, or the [gid.pango1.font_map.FontMap] it
      uses to find fonts has changed. The serial may wrap, but will never
      have the value 0. Since it can wrap, never compare it with "less than",
      always use "not equals".
      
      This can be used to automatically detect changes to a [gid.pango1.context.Context],
      and is only useful when implementing objects that need update when their
      [gid.pango1.context.Context] changes, like [gid.pango1.layout.Layout].
      Returns: The current serial number of context.
  */
  uint getSerial() nothrow
  {
    uint _retval;
    _retval = pango_context_get_serial(cast(PangoContext*)this._cPtr);
    return _retval;
  }

  /**
      List all families for a context.
  
      Params:
        families = location
            to store a pointer to an array of [gid.pango1.font_family.FontFamily]. This array should
            be freed with [gid.glib2.global.gfree].
  */
  void listFamilies(out gid.pango1.font_family.FontFamily[] families) nothrow
  {
    int _nFamilies;
    PangoFontFamily** _families;
    pango_context_list_families(cast(PangoContext*)this._cPtr, &_families, &_nFamilies);
    families.length = _nFamilies;
    foreach (i; 0 .. _nFamilies)
      families[i] = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font_family.FontFamily)(_families[i], No.Take);
    gFree(cast(void*)_families);
  }

  /**
      Loads the font in one of the fontmaps in the context
      that is the closest match for desc.
  
      Params:
        desc = a [gid.pango1.font_description.FontDescription] describing the font to load
      Returns: the newly allocated [gid.pango1.font.Font]
          that was loaded, or null if no font matched.
  */
  gid.pango1.font.Font loadFont(gid.pango1.font_description.FontDescription desc) nothrow
  {
    PangoFont* _cretval;
    _cretval = pango_context_load_font(cast(PangoContext*)this._cPtr, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Load a set of fonts in the context that can be used to render
      a font matching desc.
  
      Params:
        desc = a [gid.pango1.font_description.FontDescription] describing the fonts to load
        language = a [gid.pango1.language.Language] the fonts will be used for
      Returns: the newly allocated
          [gid.pango1.fontset.Fontset] loaded, or null if no font matched.
  */
  gid.pango1.fontset.Fontset loadFontset(gid.pango1.font_description.FontDescription desc, gid.pango1.language.Language language) nothrow
  {
    PangoFontset* _cretval;
    _cretval = pango_context_load_fontset(cast(PangoContext*)this._cPtr, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.fontset.Fontset)(cast(PangoFontset*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the base direction for the context.
      
      The base direction is used in applying the Unicode bidirectional
      algorithm; if the direction is [gid.pango1.types.Direction.Ltr] or
      [gid.pango1.types.Direction.Rtl], then the value will be used as the paragraph
      direction in the Unicode bidirectional algorithm. A value of
      [gid.pango1.types.Direction.WeakLtr] or [gid.pango1.types.Direction.WeakRtl] is used only
      for paragraphs that do not contain any strong characters themselves.
  
      Params:
        direction = the new base direction
  */
  void setBaseDir(gid.pango1.types.Direction direction) nothrow
  {
    pango_context_set_base_dir(cast(PangoContext*)this._cPtr, direction);
  }

  /**
      Sets the base gravity for the context.
      
      The base gravity is used in laying vertical text out.
  
      Params:
        gravity = the new base gravity
  */
  void setBaseGravity(gid.pango1.types.Gravity gravity) nothrow
  {
    pango_context_set_base_gravity(cast(PangoContext*)this._cPtr, gravity);
  }

  /**
      Set the default font description for the context
  
      Params:
        desc = the new pango font description
  */
  void setFontDescription(gid.pango1.font_description.FontDescription desc = null) nothrow
  {
    pango_context_set_font_description(cast(PangoContext*)this._cPtr, desc ? cast(const(PangoFontDescription)*)desc._cPtr(No.Dup) : null);
  }

  /**
      Sets the font map to be searched when fonts are looked-up
      in this context.
      
      This is only for internal use by Pango backends, a [gid.pango1.context.Context]
      obtained via one of the recommended methods should already have a
      suitable font map.
  
      Params:
        fontMap = the [gid.pango1.font_map.FontMap] to set.
  */
  void setFontMap(gid.pango1.font_map.FontMap fontMap = null) nothrow
  {
    pango_context_set_font_map(cast(PangoContext*)this._cPtr, fontMap ? cast(PangoFontMap*)fontMap._cPtr(No.Dup) : null);
  }

  /**
      Sets the gravity hint for the context.
      
      The gravity hint is used in laying vertical text out, and
      is only relevant if gravity of the context as returned by
      [gid.pango1.context.Context.getGravity] is set to [gid.pango1.types.Gravity.East]
      or [gid.pango1.types.Gravity.West].
  
      Params:
        hint = the new gravity hint
  */
  void setGravityHint(gid.pango1.types.GravityHint hint) nothrow
  {
    pango_context_set_gravity_hint(cast(PangoContext*)this._cPtr, hint);
  }

  /**
      Sets the global language tag for the context.
      
      The default language for the locale of the running process
      can be found using [gid.pango1.language.Language.getDefault].
  
      Params:
        language = the new language tag.
  */
  void setLanguage(gid.pango1.language.Language language = null) nothrow
  {
    pango_context_set_language(cast(PangoContext*)this._cPtr, language ? cast(PangoLanguage*)language._cPtr(No.Dup) : null);
  }

  /**
      Sets the transformation matrix that will be applied when rendering
      with this context.
      
      Note that reported metrics are in the user space coordinates before
      the application of the matrix, not device-space coordinates after the
      application of the matrix. So, they don't scale with the matrix, though
      they may change slightly for different matrices, depending on how the
      text is fit to the pixel grid.
  
      Params:
        matrix = a [gid.pango1.matrix.Matrix], or null to unset any existing
          matrix. (No matrix set is the same as setting the identity matrix.)
  */
  void setMatrix(gid.pango1.matrix.Matrix* matrix = null) nothrow
  {
    pango_context_set_matrix(cast(PangoContext*)this._cPtr, cast(const(PangoMatrix)*)matrix);
  }

  /**
      Sets whether font rendering with this context should
      round glyph positions and widths to integral positions,
      in device units.
      
      This is useful when the renderer can't handle subpixel
      positioning of glyphs.
      
      The default value is to round glyph positions, to remain
      compatible with previous Pango behavior.
  
      Params:
        roundPositions = whether to round glyph positions
  */
  void setRoundGlyphPositions(bool roundPositions) nothrow
  {
    pango_context_set_round_glyph_positions(cast(PangoContext*)this._cPtr, roundPositions);
  }
}

/// Fluent builder implementation template for [gid.pango1.context.Context]
class ContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.pango1.context.Context]
final class ContextGidBuilder : ContextGidBuilderImpl!ContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Context build() nothrow
  {
    return new Context(cast(void*)createGObject(Context._getGType), Yes.Take);
  }
}
