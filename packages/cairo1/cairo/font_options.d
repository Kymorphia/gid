/// Module for [FontOptions] class
module cairo.font_options;

import cairo.c.functions;
import cairo.c.types;
import cairo.types;
import gid.gid;
import gobject.boxed;

/**
    An opaque structure holding all options that are used when
    rendering fonts.
    
    Individual features of a #cairo_font_options_t can be set or
    accessed using functions named
    <function>cairo_font_options_set_<emphasis>feature_name</emphasis>()</function> and
    <function>cairo_font_options_get_<emphasis>feature_name</emphasis>()</function>, like
    [cairo.font_options.FontOptions.setAntialias] and
    [cairo.font_options.FontOptions.getAntialias].
    
    New features may be added to a #cairo_font_options_t in the
    future.  For this reason, [cairo.font_options.FontOptions.copy],
    [cairo.font_options.FontOptions.equal], [cairo.font_options.FontOptions.merge], and
    [cairo.font_options.FontOptions.hash] should be used to copy, check
    for equality, merge, or compute a hash value of
    #cairo_font_options_t objects.
*/
class FontOptions : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())cairo_gobject_font_options_get_type != &gidSymbolNotFound ? cairo_gobject_font_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontOptions self()
  {
    return this;
  }

  /**
      Allocates a new font options object copying the option values from
       original.
      Returns: a newly allocated #cairo_font_options_t. Free with
          [cairo.font_options.FontOptions.destroy]. This function always returns a
          valid pointer; if memory cannot be allocated, then a special
          error object is returned where all operations on the object do nothing.
          You can check for this with [cairo.font_options.FontOptions.status].
  */
  cairo.font_options.FontOptions copy()
  {
    cairo_font_options_t* _cretval;
    _cretval = cairo_font_options_copy(cast(const(cairo_font_options_t)*)this._cPtr);
    auto _retval = _cretval ? new cairo.font_options.FontOptions(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two font options objects for equality.
  
      Params:
        other = another #cairo_font_options_t
      Returns: true if all fields of the two font options objects match.
        Note that this function will return false if either object is in
        error.
  */
  cairo.types.Bool equal(cairo.font_options.FontOptions other)
  {
    cairo.types.Bool _retval;
    _retval = cairo_font_options_equal(cast(const(cairo_font_options_t)*)this._cPtr, other ? cast(const(cairo_font_options_t)*)other._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the antialiasing mode for the font options object.
      Returns: the antialiasing mode
  */
  cairo.types.Antialias getAntialias()
  {
    cairo_antialias_t _cretval;
    _cretval = cairo_font_options_get_antialias(cast(const(cairo_font_options_t)*)this._cPtr);
    cairo.types.Antialias _retval = cast(cairo.types.Antialias)_cretval;
    return _retval;
  }

  /**
      Gets the color mode for the font options object.
      See the documentation for #cairo_color_mode_t for full details.
      Returns: the color mode for the font options object
  */
  cairo.types.ColorMode getColorMode()
  {
    cairo_color_mode_t _cretval;
    _cretval = cairo_font_options_get_color_mode(cast(const(cairo_font_options_t)*)this._cPtr);
    cairo.types.ColorMode _retval = cast(cairo.types.ColorMode)_cretval;
    return _retval;
  }

  /**
      Gets the current OpenType color font palette for the font options object.
      Returns: the palette index
  */
  uint getColorPalette()
  {
    uint _retval;
    _retval = cairo_font_options_get_color_palette(cast(const(cairo_font_options_t)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the custom palette color for the color index for the font options object.
  
      Params:
        index = the index of the color to get
        red = return location for red component of color
        green = return location for green component of color
        blue = return location for blue component of color
        alpha = return location for alpha component of color
      Returns: [cairo.types.Status.Success] if a custom palette color is
        returned, [cairo.types.Status.InvalidIndex] if no custom color exists
        for the color index.
  */
  cairo.types.Status getCustomPaletteColor(uint index, out double red, out double green, out double blue, out double alpha)
  {
    cairo_status_t _cretval;
    _cretval = cairo_font_options_get_custom_palette_color(cast(cairo_font_options_t*)this._cPtr, index, cast(double*)&red, cast(double*)&green, cast(double*)&blue, cast(double*)&alpha);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }

  /**
      Gets the metrics hinting mode for the font options object.
      See the documentation for #cairo_hint_metrics_t for full details.
      Returns: the metrics hinting mode for the font options object
  */
  cairo.types.HintMetrics getHintMetrics()
  {
    cairo_hint_metrics_t _cretval;
    _cretval = cairo_font_options_get_hint_metrics(cast(const(cairo_font_options_t)*)this._cPtr);
    cairo.types.HintMetrics _retval = cast(cairo.types.HintMetrics)_cretval;
    return _retval;
  }

  /**
      Gets the hint style for font outlines for the font options object.
      See the documentation for #cairo_hint_style_t for full details.
      Returns: the hint style for the font options object
  */
  cairo.types.HintStyle getHintStyle()
  {
    cairo_hint_style_t _cretval;
    _cretval = cairo_font_options_get_hint_style(cast(const(cairo_font_options_t)*)this._cPtr);
    cairo.types.HintStyle _retval = cast(cairo.types.HintStyle)_cretval;
    return _retval;
  }

  /**
      Gets the subpixel order for the font options object.
      See the documentation for #cairo_subpixel_order_t for full details.
      Returns: the subpixel order for the font options object
  */
  cairo.types.SubpixelOrder getSubpixelOrder()
  {
    cairo_subpixel_order_t _cretval;
    _cretval = cairo_font_options_get_subpixel_order(cast(const(cairo_font_options_t)*)this._cPtr);
    cairo.types.SubpixelOrder _retval = cast(cairo.types.SubpixelOrder)_cretval;
    return _retval;
  }

  /**
      Gets the OpenType font variations for the font options object.
      See [cairo.font_options.FontOptions.setVariations] for details about the
      string format.
      Returns: the font variations for the font options object. The
          returned string belongs to the options and must not be modified.
          It is valid until either the font options object is destroyed or
          the font variations in this object is modified with
          [cairo.font_options.FontOptions.setVariations].
  */
  string getVariations()
  {
    const(char)* _cretval;
    _cretval = cairo_font_options_get_variations(cast(cairo_font_options_t*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Compute a hash for the font options object; this value will
      be useful when storing an object containing a #cairo_font_options_t
      in a hash table.
      Returns: the hash value for the font options object.
          The return value can be cast to a 32-bit type if a
          32-bit hash value is needed.
  */
  gulong hash()
  {
    gulong _retval;
    _retval = cairo_font_options_hash(cast(const(cairo_font_options_t)*)this._cPtr);
    return _retval;
  }

  /**
      Merges non-default options from other into options, replacing
      existing values. This operation can be thought of as somewhat
      similar to compositing other onto options with the operation
      of [cairo.types.Operator.Over].
  
      Params:
        other = another #cairo_font_options_t
  */
  void merge(cairo.font_options.FontOptions other)
  {
    cairo_font_options_merge(cast(cairo_font_options_t*)this._cPtr, other ? cast(const(cairo_font_options_t)*)other._cPtr(No.Dup) : null);
  }

  /**
      Sets the antialiasing mode for the font options object. This
      specifies the type of antialiasing to do when rendering text.
  
      Params:
        antialias = the new antialiasing mode
  */
  void setAntialias(cairo.types.Antialias antialias)
  {
    cairo_font_options_set_antialias(cast(cairo_font_options_t*)this._cPtr, antialias);
  }

  /**
      Sets the color mode for the font options object. This controls
      whether color fonts are to be rendered in color or as outlines.
      See the documentation for #cairo_color_mode_t for full details.
  
      Params:
        colorMode = the new color mode
  */
  void setColorMode(cairo.types.ColorMode colorMode)
  {
    cairo_font_options_set_color_mode(cast(cairo_font_options_t*)this._cPtr, colorMode);
  }

  /**
      Sets the OpenType font color palette for the font options
      object. OpenType color fonts with a CPAL table may contain multiple
      palettes. The default color palette index is [cairo.types.COLOR_PALETTE_DEFAULT].
      
      If palette_index is invalid, the default palette is used.
      
      Individual colors within the palette may be overriden with
      [cairo.font_options.FontOptions.setCustomPaletteColor].
  
      Params:
        paletteIndex = the palette index in the CPAL table
  */
  void setColorPalette(uint paletteIndex)
  {
    cairo_font_options_set_color_palette(cast(cairo_font_options_t*)this._cPtr, paletteIndex);
  }

  /**
      Sets a custom palette color for the font options object. This
      overrides the palette color at the specified color index. This override is
      independent of the selected palette index and will remain in place
      even if [cairo.font_options.FontOptions.setColorPalette] is called to change
      the palette index.
      
      It is only possible to override color indexes already in the font
      palette.
  
      Params:
        index = the index of the color to set
        red = red component of color
        green = green component of color
        blue = blue component of color
        alpha = alpha component of color
  */
  void setCustomPaletteColor(uint index, double red, double green, double blue, double alpha)
  {
    cairo_font_options_set_custom_palette_color(cast(cairo_font_options_t*)this._cPtr, index, red, green, blue, alpha);
  }

  /**
      Sets the metrics hinting mode for the font options object. This
      controls whether metrics are quantized to integer values in
      device units.
      See the documentation for #cairo_hint_metrics_t for full details.
  
      Params:
        hintMetrics = the new metrics hinting mode
  */
  void setHintMetrics(cairo.types.HintMetrics hintMetrics)
  {
    cairo_font_options_set_hint_metrics(cast(cairo_font_options_t*)this._cPtr, hintMetrics);
  }

  /**
      Sets the hint style for font outlines for the font options object.
      This controls whether to fit font outlines to the pixel grid,
      and if so, whether to optimize for fidelity or contrast.
      See the documentation for #cairo_hint_style_t for full details.
  
      Params:
        hintStyle = the new hint style
  */
  void setHintStyle(cairo.types.HintStyle hintStyle)
  {
    cairo_font_options_set_hint_style(cast(cairo_font_options_t*)this._cPtr, hintStyle);
  }

  /**
      Sets the subpixel order for the font options object. The subpixel
      order specifies the order of color elements within each pixel on
      the display device when rendering with an antialiasing mode of
      [cairo.types.Antialias.Subpixel]. See the documentation for
      #cairo_subpixel_order_t for full details.
  
      Params:
        subpixelOrder = the new subpixel order
  */
  void setSubpixelOrder(cairo.types.SubpixelOrder subpixelOrder)
  {
    cairo_font_options_set_subpixel_order(cast(cairo_font_options_t*)this._cPtr, subpixelOrder);
  }

  /**
      Sets the OpenType font variations for the font options object.
      Font variations are specified as a string with a format that
      is similar to the CSS font-variation-settings. The string contains
      a comma-separated list of axis assignments, which each assignment
      consists of a 4-character axis name and a value, separated by
      whitespace and optional equals sign.
      
      Examples:
      
      wght=200,wdth=140.5
      
      wght 200 , wdth 140.5
  
      Params:
        variations = the new font variations, or null
  */
  void setVariations(string variations)
  {
    const(char)* _variations = variations.toCString(No.Alloc);
    cairo_font_options_set_variations(cast(cairo_font_options_t*)this._cPtr, _variations);
  }

  /**
      Checks whether an error has previously occurred for this
      font options object
      Returns: [cairo.types.Status.Success], [cairo.types.Status.NoMemory], or
        [cairo.types.Status.NullPointer].
  */
  cairo.types.Status status()
  {
    cairo_status_t _cretval;
    _cretval = cairo_font_options_status(cast(cairo_font_options_t*)this._cPtr);
    cairo.types.Status _retval = cast(cairo.types.Status)_cretval;
    return _retval;
  }
}
