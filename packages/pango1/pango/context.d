module pango.context;

import gid.gid;
import gobject.object;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.font_description;
import pango.font_family;
import pango.font_map;
import pango.font_metrics;
import pango.fontset;
import pango.language;
import pango.matrix;
import pango.types;

/**
 * A `PangoContext` stores global information used to control the
 * itemization process.
 * The information stored by `PangoContext` includes the fontmap used
 * to look up fonts, and default values such as the default language,
 * default gravity, or default font.
 * To obtain a `PangoContext`, use [pango.font_map.FontMap.createContext].
 */
class Context : gobject.object.ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_context_get_type != &gidSymbolNotFound ? pango_context_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `PangoContext` initialized to default values.
   * This function is not particularly useful as it should always
   * be followed by a [pango.context.Context.setFontMap] call, and the
   * function [pango.font_map.FontMap.createContext] does these two steps
   * together and hence users are recommended to use that.
   * If you are using Pango as part of a higher-level system,
   * that system may have it's own way of create a `PangoContext`.
   * For instance, the GTK toolkit has, among others,
   * `[gtk.widget.Widget.getPangoContext]`. Use those instead.
   * Returns: the newly allocated `PangoContext`, which should
   *   be freed with [gobject.object.ObjectG.unref].
   */
  this()
  {
    PangoContext* _cretval;
    _cretval = pango_context_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Forces a change in the context, which will cause any `PangoLayout`
   * using this context to re-layout.
   * This function is only useful when implementing a new backend
   * for Pango, something applications won't do. Backends should
   * call this function if they have attached extra data to the context
   * and such data is changed.
   */
  void changed()
  {
    pango_context_changed(cast(PangoContext*)cPtr);
  }

  /**
   * Retrieves the base direction for the context.
   * See [pango.context.Context.setBaseDir].
   * Returns: the base direction for the context.
   */
  pango.types.Direction getBaseDir()
  {
    PangoDirection _cretval;
    _cretval = pango_context_get_base_dir(cast(PangoContext*)cPtr);
    pango.types.Direction _retval = cast(pango.types.Direction)_cretval;
    return _retval;
  }

  /**
   * Retrieves the base gravity for the context.
   * See [pango.context.Context.setBaseGravity].
   * Returns: the base gravity for the context.
   */
  pango.types.Gravity getBaseGravity()
  {
    PangoGravity _cretval;
    _cretval = pango_context_get_base_gravity(cast(PangoContext*)cPtr);
    pango.types.Gravity _retval = cast(pango.types.Gravity)_cretval;
    return _retval;
  }

  /**
   * Retrieve the default font description for the context.
   * Returns: a pointer to the context's default font
   *   description. This value must not be modified or freed.
   */
  pango.font_description.FontDescription getFontDescription()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_context_get_font_description(cast(PangoContext*)cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the `PangoFontMap` used to look up fonts for this context.
   * Returns: the font map for the.
   *   `PangoContext` This value is owned by Pango and should not be
   *   unreferenced.
   */
  pango.font_map.FontMap getFontMap()
  {
    PangoFontMap* _cretval;
    _cretval = pango_context_get_font_map(cast(PangoContext*)cPtr);
    auto _retval = ObjectG.getDObject!(pango.font_map.FontMap)(cast(PangoFontMap*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Retrieves the gravity for the context.
   * This is similar to [pango.context.Context.getBaseGravity],
   * except for when the base gravity is %PANGO_GRAVITY_AUTO for
   * which funcPango.Gravity.get_for_matrix is used to return the
   * gravity from the current context matrix.
   * Returns: the resolved gravity for the context.
   */
  pango.types.Gravity getGravity()
  {
    PangoGravity _cretval;
    _cretval = pango_context_get_gravity(cast(PangoContext*)cPtr);
    pango.types.Gravity _retval = cast(pango.types.Gravity)_cretval;
    return _retval;
  }

  /**
   * Retrieves the gravity hint for the context.
   * See [pango.context.Context.setGravityHint] for details.
   * Returns: the gravity hint for the context.
   */
  pango.types.GravityHint getGravityHint()
  {
    PangoGravityHint _cretval;
    _cretval = pango_context_get_gravity_hint(cast(PangoContext*)cPtr);
    pango.types.GravityHint _retval = cast(pango.types.GravityHint)_cretval;
    return _retval;
  }

  /**
   * Retrieves the global language tag for the context.
   * Returns: the global language tag.
   */
  pango.language.Language getLanguage()
  {
    PangoLanguage* _cretval;
    _cretval = pango_context_get_language(cast(PangoContext*)cPtr);
    auto _retval = _cretval ? new pango.language.Language(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Gets the transformation matrix that will be applied when
   * rendering with this context.
   * See [pango.context.Context.setMatrix].
   * Returns: the matrix, or %NULL if no
   *   matrix has been set $(LPAREN)which is the same as the identity matrix$(RPAREN).
   *   The returned matrix is owned by Pango and must not be modified
   *   or freed.
   */
  pango.matrix.Matrix getMatrix()
  {
    const(PangoMatrix)* _cretval;
    _cretval = pango_context_get_matrix(cast(PangoContext*)cPtr);
    auto _retval = _cretval ? new pango.matrix.Matrix(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Get overall metric information for a particular font description.
   * Since the metrics may be substantially different for different scripts,
   * a language tag can be provided to indicate that the metrics should be
   * retrieved that correspond to the script$(LPAREN)s$(RPAREN) used by that language.
   * The `PangoFontDescription` is interpreted in the same way as by funcitemize,
   * and the family name may be a comma separated list of names. If characters
   * from multiple of these families would be used to render the string, then
   * the returned fonts would be a composite of the metrics for the fonts loaded
   * for the individual families.
   * Params:
   *   desc = a `PangoFontDescription` structure. %NULL means that the
   *     font description from the context will be used.
   *   language = language tag used to determine which script to get
   *     the metrics for. %NULL means that the language tag from the context
   *     will be used. If no language tag is set on the context, metrics
   *     for the default language $(LPAREN)as determined by [pango.language.Language.getDefault]
   *     will be returned.
   * Returns: a `PangoFontMetrics` object. The caller must call
   *   [pango.font_metrics.FontMetrics.unref] when finished using the object.
   */
  pango.font_metrics.FontMetrics getMetrics(pango.font_description.FontDescription desc, pango.language.Language language)
  {
    PangoFontMetrics* _cretval;
    _cretval = pango_context_get_metrics(cast(PangoContext*)cPtr, desc ? cast(const(PangoFontDescription)*)desc.cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new pango.font_metrics.FontMetrics(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Returns whether font rendering with this context should
   * round glyph positions and widths.
   * Returns:
   */
  bool getRoundGlyphPositions()
  {
    bool _retval;
    _retval = pango_context_get_round_glyph_positions(cast(PangoContext*)cPtr);
    return _retval;
  }

  /**
   * Returns the current serial number of context.
   * The serial number is initialized to an small number larger than zero
   * when a new context is created and is increased whenever the context
   * is changed using any of the setter functions, or the `PangoFontMap` it
   * uses to find fonts has changed. The serial may wrap, but will never
   * have the value 0. Since it can wrap, never compare it with "less than",
   * always use "not equals".
   * This can be used to automatically detect changes to a `PangoContext`,
   * and is only useful when implementing objects that need update when their
   * `PangoContext` changes, like `PangoLayout`.
   * Returns: The current serial number of context.
   */
  uint getSerial()
  {
    uint _retval;
    _retval = pango_context_get_serial(cast(PangoContext*)cPtr);
    return _retval;
  }

  /**
   * List all families for a context.
   * Params:
   *   families = location
   *     to store a pointer to an array of `PangoFontFamily`. This array should
   *     be freed with [glib.global.gfree].
   */
  void listFamilies(out pango.font_family.FontFamily[] families)
  {
    int _nFamilies;
    PangoFontFamily** _families;
    pango_context_list_families(cast(PangoContext*)cPtr, &_families, &_nFamilies);
    families.length = _nFamilies;
    foreach (i; 0 .. _nFamilies)
      families[i] = ObjectG.getDObject!(pango.font_family.FontFamily)(_families[i], No.Take);
    safeFree(cast(void*)_families);
  }

  /**
   * Loads the font in one of the fontmaps in the context
   * that is the closest match for desc.
   * Params:
   *   desc = a `PangoFontDescription` describing the font to load
   * Returns: the newly allocated `PangoFont`
   *   that was loaded, or %NULL if no font matched.
   */
  pango.font.Font loadFont(pango.font_description.FontDescription desc)
  {
    PangoFont* _cretval;
    _cretval = pango_context_load_font(cast(PangoContext*)cPtr, desc ? cast(const(PangoFontDescription)*)desc.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(pango.font.Font)(cast(PangoFont*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Load a set of fonts in the context that can be used to render
   * a font matching desc.
   * Params:
   *   desc = a `PangoFontDescription` describing the fonts to load
   *   language = a `PangoLanguage` the fonts will be used for
   * Returns: the newly allocated
   *   `PangoFontset` loaded, or %NULL if no font matched.
   */
  pango.fontset.Fontset loadFontset(pango.font_description.FontDescription desc, pango.language.Language language)
  {
    PangoFontset* _cretval;
    _cretval = pango_context_load_fontset(cast(PangoContext*)cPtr, desc ? cast(const(PangoFontDescription)*)desc.cPtr(No.Dup) : null, language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(pango.fontset.Fontset)(cast(PangoFontset*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Sets the base direction for the context.
   * The base direction is used in applying the Unicode bidirectional
   * algorithm; if the direction is %PANGO_DIRECTION_LTR or
   * %PANGO_DIRECTION_RTL, then the value will be used as the paragraph
   * direction in the Unicode bidirectional algorithm. A value of
   * %PANGO_DIRECTION_WEAK_LTR or %PANGO_DIRECTION_WEAK_RTL is used only
   * for paragraphs that do not contain any strong characters themselves.
   * Params:
   *   direction = the new base direction
   */
  void setBaseDir(pango.types.Direction direction)
  {
    pango_context_set_base_dir(cast(PangoContext*)cPtr, direction);
  }

  /**
   * Sets the base gravity for the context.
   * The base gravity is used in laying vertical text out.
   * Params:
   *   gravity = the new base gravity
   */
  void setBaseGravity(pango.types.Gravity gravity)
  {
    pango_context_set_base_gravity(cast(PangoContext*)cPtr, gravity);
  }

  /**
   * Set the default font description for the context
   * Params:
   *   desc = the new pango font description
   */
  void setFontDescription(pango.font_description.FontDescription desc)
  {
    pango_context_set_font_description(cast(PangoContext*)cPtr, desc ? cast(const(PangoFontDescription)*)desc.cPtr(No.Dup) : null);
  }

  /**
   * Sets the font map to be searched when fonts are looked-up
   * in this context.
   * This is only for internal use by Pango backends, a `PangoContext`
   * obtained via one of the recommended methods should already have a
   * suitable font map.
   * Params:
   *   fontMap = the `PangoFontMap` to set.
   */
  void setFontMap(pango.font_map.FontMap fontMap)
  {
    pango_context_set_font_map(cast(PangoContext*)cPtr, fontMap ? cast(PangoFontMap*)fontMap.cPtr(No.Dup) : null);
  }

  /**
   * Sets the gravity hint for the context.
   * The gravity hint is used in laying vertical text out, and
   * is only relevant if gravity of the context as returned by
   * [pango.context.Context.getGravity] is set to %PANGO_GRAVITY_EAST
   * or %PANGO_GRAVITY_WEST.
   * Params:
   *   hint = the new gravity hint
   */
  void setGravityHint(pango.types.GravityHint hint)
  {
    pango_context_set_gravity_hint(cast(PangoContext*)cPtr, hint);
  }

  /**
   * Sets the global language tag for the context.
   * The default language for the locale of the running process
   * can be found using [pango.language.Language.getDefault].
   * Params:
   *   language = the new language tag.
   */
  void setLanguage(pango.language.Language language)
  {
    pango_context_set_language(cast(PangoContext*)cPtr, language ? cast(PangoLanguage*)language.cPtr(No.Dup) : null);
  }

  /**
   * Sets the transformation matrix that will be applied when rendering
   * with this context.
   * Note that reported metrics are in the user space coordinates before
   * the application of the matrix, not device-space coordinates after the
   * application of the matrix. So, they don't scale with the matrix, though
   * they may change slightly for different matrices, depending on how the
   * text is fit to the pixel grid.
   * Params:
   *   matrix = a `PangoMatrix`, or %NULL to unset any existing
   *     matrix. $(LPAREN)No matrix set is the same as setting the identity matrix.$(RPAREN)
   */
  void setMatrix(pango.matrix.Matrix matrix)
  {
    pango_context_set_matrix(cast(PangoContext*)cPtr, matrix ? cast(const(PangoMatrix)*)matrix.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether font rendering with this context should
   * round glyph positions and widths to integral positions,
   * in device units.
   * This is useful when the renderer can't handle subpixel
   * positioning of glyphs.
   * The default value is to round glyph positions, to remain
   * compatible with previous Pango behavior.
   * Params:
   *   roundPositions = whether to round glyph positions
   */
  void setRoundGlyphPositions(bool roundPositions)
  {
    pango_context_set_round_glyph_positions(cast(PangoContext*)cPtr, roundPositions);
  }
}
