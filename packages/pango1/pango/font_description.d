/// Module for [FontDescription] class
module pango.font_description;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.types;

/**
    A [pango.font_description.FontDescription] describes a font in an implementation-independent
    manner.
    
    [pango.font_description.FontDescription] structures are used both to list what fonts are
    available on the system and also for specifying the characteristics of
    a font to load.
*/
class FontDescription : gobject.boxed.Boxed
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
    return cast(void function())pango_font_description_get_type != &gidSymbolNotFound ? pango_font_description_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FontDescription self()
  {
    return this;
  }

  /**
      Creates a new font description structure with all fields unset.
      Returns: the newly allocated [pango.font_description.FontDescription],
          which should be freed using [pango.font_description.FontDescription.free].
  */
  this()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_description_new();
    this(_cretval, Yes.Take);
  }

  /**
      Determines if the style attributes of new_match are a closer match
      for desc than those of old_match are, or if old_match is null,
      determines if new_match is a match at all.
      
      Approximate matching is done for weight and style; other style attributes
      must match exactly. Style attributes are all attributes other than family
      and size-related attributes. Approximate matching for style considers
      [pango.types.Style.Oblique] and [pango.types.Style.Italic] as matches, but not as good
      a match as when the styles are equal.
      
      Note that old_match must match desc.
  
      Params:
        oldMatch = a [pango.font_description.FontDescription], or null
        newMatch = a [pango.font_description.FontDescription]
      Returns: true if new_match is a better match
  */
  bool betterMatch(pango.font_description.FontDescription oldMatch, pango.font_description.FontDescription newMatch)
  {
    bool _retval;
    _retval = cast(bool)pango_font_description_better_match(cast(const(PangoFontDescription)*)this._cPtr, oldMatch ? cast(const(PangoFontDescription)*)oldMatch._cPtr(No.Dup) : null, newMatch ? cast(const(PangoFontDescription)*)newMatch._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Make a copy of a [pango.font_description.FontDescription].
      Returns: the newly allocated [pango.font_description.FontDescription],
          which should be freed with [pango.font_description.FontDescription.free],
          or null if desc was null.
  */
  pango.font_description.FontDescription copy()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_description_copy(cast(const(PangoFontDescription)*)this._cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Make a copy of a [pango.font_description.FontDescription], but don't duplicate
      allocated fields.
      
      This is like [pango.font_description.FontDescription.copy], but only a shallow
      copy is made of the family name and other allocated fields. The result
      can only be used until desc is modified or freed. This is meant
      to be used when the copy is only needed temporarily.
      Returns: the newly allocated [pango.font_description.FontDescription],
          which should be freed with [pango.font_description.FontDescription.free],
          or null if desc was null.
  */
  pango.font_description.FontDescription copyStatic()
  {
    PangoFontDescription* _cretval;
    _cretval = pango_font_description_copy_static(cast(const(PangoFontDescription)*)this._cPtr);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two font descriptions for equality.
      
      Two font descriptions are considered equal if the fonts they describe
      are provably identical. This means that their masks do not have to match,
      as long as other fields are all the same. (Two font descriptions may
      result in identical fonts being loaded, but still compare false.)
  
      Params:
        desc2 = another [pango.font_description.FontDescription]
      Returns: true if the two font descriptions are identical,
          false otherwise.
  */
  bool equal(pango.font_description.FontDescription desc2)
  {
    bool _retval;
    _retval = cast(bool)pango_font_description_equal(cast(const(PangoFontDescription)*)this._cPtr, desc2 ? cast(const(PangoFontDescription)*)desc2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets the family name field of a font description.
      
      See [pango.font_description.FontDescription.setFamily].
      Returns: the family name field for the
          font description, or null if not previously set. This has the same
          life-time as the font description itself and should not be freed.
  */
  string getFamily()
  {
    const(char)* _cretval;
    _cretval = pango_font_description_get_family(cast(const(PangoFontDescription)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the gravity field of a font description.
      
      See [pango.font_description.FontDescription.setGravity].
      Returns: the gravity field for the font description.
          Use [pango.font_description.FontDescription.getSetFields] to find out
          if the field was explicitly set or not.
  */
  pango.types.Gravity getGravity()
  {
    PangoGravity _cretval;
    _cretval = pango_font_description_get_gravity(cast(const(PangoFontDescription)*)this._cPtr);
    pango.types.Gravity _retval = cast(pango.types.Gravity)_cretval;
    return _retval;
  }

  /**
      Determines which fields in a font description have been set.
      Returns: a bitmask with bits set corresponding to the
          fields in desc that have been set.
  */
  pango.types.FontMask getSetFields()
  {
    PangoFontMask _cretval;
    _cretval = pango_font_description_get_set_fields(cast(const(PangoFontDescription)*)this._cPtr);
    pango.types.FontMask _retval = cast(pango.types.FontMask)_cretval;
    return _retval;
  }

  /**
      Gets the size field of a font description.
      
      See [pango.font_description.FontDescription.setSize].
      Returns: the size field for the font description in points
          or device units. You must call
          [pango.font_description.FontDescription.getSizeIsAbsolute] to find out
          which is the case. Returns 0 if the size field has not previously
          been set or it has been set to 0 explicitly.
          Use [pango.font_description.FontDescription.getSetFields] to find out
          if the field was explicitly set or not.
  */
  int getSize()
  {
    int _retval;
    _retval = pango_font_description_get_size(cast(const(PangoFontDescription)*)this._cPtr);
    return _retval;
  }

  /**
      Determines whether the size of the font is in points (not absolute)
      or device units (absolute).
      
      See [pango.font_description.FontDescription.setSize]
      and [pango.font_description.FontDescription.setAbsoluteSize].
      Returns: whether the size for the font description is in
          points or device units. Use [pango.font_description.FontDescription.getSetFields]
          to find out if the size field of the font description was explicitly
          set or not.
  */
  bool getSizeIsAbsolute()
  {
    bool _retval;
    _retval = cast(bool)pango_font_description_get_size_is_absolute(cast(const(PangoFontDescription)*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stretch field of a font description.
      
      See [pango.font_description.FontDescription.setStretch].
      Returns: the stretch field for the font description.
          Use [pango.font_description.FontDescription.getSetFields] to find
          out if the field was explicitly set or not.
  */
  pango.types.Stretch getStretch()
  {
    PangoStretch _cretval;
    _cretval = pango_font_description_get_stretch(cast(const(PangoFontDescription)*)this._cPtr);
    pango.types.Stretch _retval = cast(pango.types.Stretch)_cretval;
    return _retval;
  }

  /**
      Gets the style field of a [pango.font_description.FontDescription].
      
      See [pango.font_description.FontDescription.setStyle].
      Returns: the style field for the font description.
          Use [pango.font_description.FontDescription.getSetFields] to
          find out if the field was explicitly set or not.
  */
  pango.types.Style getStyle()
  {
    PangoStyle _cretval;
    _cretval = pango_font_description_get_style(cast(const(PangoFontDescription)*)this._cPtr);
    pango.types.Style _retval = cast(pango.types.Style)_cretval;
    return _retval;
  }

  /**
      Gets the variant field of a [pango.font_description.FontDescription].
      
      See [pango.font_description.FontDescription.setVariant].
      Returns: the variant field for the font description.
          Use [pango.font_description.FontDescription.getSetFields] to find
          out if the field was explicitly set or not.
  */
  pango.types.Variant getVariant()
  {
    PangoVariant _cretval;
    _cretval = pango_font_description_get_variant(cast(const(PangoFontDescription)*)this._cPtr);
    pango.types.Variant _retval = cast(pango.types.Variant)_cretval;
    return _retval;
  }

  /**
      Gets the variations field of a font description.
      
      See [pango.font_description.FontDescription.setVariations].
      Returns: the variations field for the font
          description, or null if not previously set. This has the same
          life-time as the font description itself and should not be freed.
  */
  string getVariations()
  {
    const(char)* _cretval;
    _cretval = pango_font_description_get_variations(cast(const(PangoFontDescription)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the weight field of a font description.
      
      See [pango.font_description.FontDescription.setWeight].
      Returns: the weight field for the font description.
          Use [pango.font_description.FontDescription.getSetFields] to find
          out if the field was explicitly set or not.
  */
  pango.types.Weight getWeight()
  {
    PangoWeight _cretval;
    _cretval = pango_font_description_get_weight(cast(const(PangoFontDescription)*)this._cPtr);
    pango.types.Weight _retval = cast(pango.types.Weight)_cretval;
    return _retval;
  }

  /**
      Computes a hash of a [pango.font_description.FontDescription] structure.
      
      This is suitable to be used, for example, as an argument
      to [glib.hash_table.HashTable.new_]. The hash value is independent of desc->mask.
      Returns: the hash value.
  */
  uint hash()
  {
    uint _retval;
    _retval = pango_font_description_hash(cast(const(PangoFontDescription)*)this._cPtr);
    return _retval;
  }

  /**
      Merges the fields that are set in desc_to_merge into the fields in
      desc.
      
      If replace_existing is false, only fields in desc that
      are not already set are affected. If true, then fields that are
      already set will be replaced as well.
      
      If desc_to_merge is null, this function performs nothing.
  
      Params:
        descToMerge = the [pango.font_description.FontDescription] to merge from,
            or null
        replaceExisting = if true, replace fields in desc with the
            corresponding values from desc_to_merge, even if they
            are already exist.
  */
  void merge(pango.font_description.FontDescription descToMerge, bool replaceExisting)
  {
    pango_font_description_merge(cast(PangoFontDescription*)this._cPtr, descToMerge ? cast(const(PangoFontDescription)*)descToMerge._cPtr(No.Dup) : null, replaceExisting);
  }

  /**
      Merges the fields that are set in desc_to_merge into the fields in
      desc, without copying allocated fields.
      
      This is like [pango.font_description.FontDescription.merge], but only a shallow copy
      is made of the family name and other allocated fields. desc can only
      be used until desc_to_merge is modified or freed. This is meant to
      be used when the merged font description is only needed temporarily.
  
      Params:
        descToMerge = the [pango.font_description.FontDescription] to merge from
        replaceExisting = if true, replace fields in desc with the
            corresponding values from desc_to_merge, even if they
            are already exist.
  */
  void mergeStatic(pango.font_description.FontDescription descToMerge, bool replaceExisting)
  {
    pango_font_description_merge_static(cast(PangoFontDescription*)this._cPtr, descToMerge ? cast(const(PangoFontDescription)*)descToMerge._cPtr(No.Dup) : null, replaceExisting);
  }

  /**
      Sets the size field of a font description, in device units.
      
      This is mutually exclusive with [pango.font_description.FontDescription.setSize]
      which sets the font size in points.
  
      Params:
        size = the new size, in Pango units. There are [pango.types.SCALE] Pango units
            in one device unit. For an output backend where a device unit is a pixel,
            a size value of 10 * PANGO_SCALE gives a 10 pixel font.
  */
  void setAbsoluteSize(double size)
  {
    pango_font_description_set_absolute_size(cast(PangoFontDescription*)this._cPtr, size);
  }

  /**
      Sets the family name field of a font description.
      
      The family
      name represents a family of related font styles, and will
      resolve to a particular [pango.font_family.FontFamily]. In some uses of
      [pango.font_description.FontDescription], it is also possible to use a comma
      separated list of family names for this field.
  
      Params:
        family = a string representing the family name.
  */
  void setFamily(string family)
  {
    const(char)* _family = family.toCString(No.Alloc);
    pango_font_description_set_family(cast(PangoFontDescription*)this._cPtr, _family);
  }

  /**
      Sets the family name field of a font description, without copying the string.
      
      This is like [pango.font_description.FontDescription.setFamily], except that no
      copy of family is made. The caller must make sure that the
      string passed in stays around until desc has been freed or the
      name is set again. This function can be used if family is a static
      string such as a C string literal, or if desc is only needed temporarily.
  
      Params:
        family = a string representing the family name
  */
  void setFamilyStatic(string family)
  {
    const(char)* _family = family.toCString(No.Alloc);
    pango_font_description_set_family_static(cast(PangoFontDescription*)this._cPtr, _family);
  }

  /**
      Sets the gravity field of a font description.
      
      The gravity field
      specifies how the glyphs should be rotated. If gravity is
      [pango.types.Gravity.Auto], this actually unsets the gravity mask on
      the font description.
      
      This function is seldom useful to the user. Gravity should normally
      be set on a [pango.context.Context].
  
      Params:
        gravity = the gravity for the font description.
  */
  void setGravity(pango.types.Gravity gravity)
  {
    pango_font_description_set_gravity(cast(PangoFontDescription*)this._cPtr, gravity);
  }

  /**
      Sets the size field of a font description in fractional points.
      
      This is mutually exclusive with
      [pango.font_description.FontDescription.setAbsoluteSize].
  
      Params:
        size = the size of the font in points, scaled by [pango.types.SCALE].
            (That is, a size value of 10 * PANGO_SCALE is a 10 point font.
            The conversion factor between points and device units depends on
            system configuration and the output device. For screen display, a
            logical DPI of 96 is common, in which case a 10 point font corresponds
            to a 10 * (96 / 72) = 13.3 pixel font.
            Use [pango.font_description.FontDescription.setAbsoluteSize] if you need
            a particular size in device units.
  */
  void setSize(int size)
  {
    pango_font_description_set_size(cast(PangoFontDescription*)this._cPtr, size);
  }

  /**
      Sets the stretch field of a font description.
      
      The [pango.types.Stretch] field specifies how narrow or
      wide the font should be.
  
      Params:
        stretch = the stretch for the font description
  */
  void setStretch(pango.types.Stretch stretch)
  {
    pango_font_description_set_stretch(cast(PangoFontDescription*)this._cPtr, stretch);
  }

  /**
      Sets the style field of a [pango.font_description.FontDescription].
      
      The [pango.types.Style] enumeration describes whether the font is
      slanted and the manner in which it is slanted; it can be either
      [pango.types.Style.Normal], [pango.types.Style.Italic], or [pango.types.Style.Oblique].
      
      Most fonts will either have a italic style or an oblique style,
      but not both, and font matching in Pango will match italic
      specifications with oblique fonts and vice-versa if an exact
      match is not found.
  
      Params:
        style = the style for the font description
  */
  void setStyle(pango.types.Style style)
  {
    pango_font_description_set_style(cast(PangoFontDescription*)this._cPtr, style);
  }

  /**
      Sets the variant field of a font description.
      
      The [pango.types.Variant] can either be [pango.types.Variant.Normal]
      or [pango.types.Variant.SmallCaps].
  
      Params:
        variant = the variant type for the font description.
  */
  void setVariant(pango.types.Variant variant)
  {
    pango_font_description_set_variant(cast(PangoFontDescription*)this._cPtr, variant);
  }

  /**
      Sets the variations field of a font description.
      
      OpenType font variations allow to select a font instance by
      specifying values for a number of axes, such as width or weight.
      
      The format of the variations string is
      
          AXIS1=VALUE,AXIS2=VALUE...
      
      with each AXIS a 4 character tag that identifies a font axis,
      and each VALUE a floating point number. Unknown axes are ignored,
      and values are clamped to their allowed range.
      
      Pango does not currently have a way to find supported axes of
      a font. Both harfbuzz and freetype have API for this. See
      for example [hb_ot_var_get_axis_infos](https://harfbuzz.github.io/harfbuzz-hb-ot-var.html#hb-ot-var-get-axis-infos).
  
      Params:
        variations = a string representing the variations
  */
  void setVariations(string variations = null)
  {
    const(char)* _variations = variations.toCString(No.Alloc);
    pango_font_description_set_variations(cast(PangoFontDescription*)this._cPtr, _variations);
  }

  /**
      Sets the variations field of a font description.
      
      This is like [pango.font_description.FontDescription.setVariations], except
      that no copy of variations is made. The caller must make sure that
      the string passed in stays around until desc has been freed
      or the name is set again. This function can be used if
      variations is a static string such as a C string literal,
      or if desc is only needed temporarily.
  
      Params:
        variations = a string representing the variations
  */
  void setVariationsStatic(string variations)
  {
    const(char)* _variations = variations.toCString(No.Alloc);
    pango_font_description_set_variations_static(cast(PangoFontDescription*)this._cPtr, _variations);
  }

  /**
      Sets the weight field of a font description.
      
      The weight field
      specifies how bold or light the font should be. In addition
      to the values of the [pango.types.Weight] enumeration, other
      intermediate numeric values are possible.
  
      Params:
        weight = the weight for the font description.
  */
  void setWeight(pango.types.Weight weight)
  {
    pango_font_description_set_weight(cast(PangoFontDescription*)this._cPtr, weight);
  }

  /**
      Creates a filename representation of a font description.
      
      The filename is identical to the result from calling
      [pango.font_description.FontDescription.toString_], but with underscores
      instead of characters that are untypical in filenames, and in
      lower case only.
      Returns: a new string that must be freed with [glib.global.gfree].
  */
  string toFilename()
  {
    char* _cretval;
    _cretval = pango_font_description_to_filename(cast(const(PangoFontDescription)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Creates a string representation of a font description.
      
      See [pango.font_description.FontDescription.fromString] for a description
      of the format of the string representation. The family list in
      the string description will only have a terminating comma if
      the last word of the list is a valid style option.
      Returns: a new string that must be freed with [glib.global.gfree].
  */
  string toString_()
  {
    char* _cretval;
    _cretval = pango_font_description_to_string(cast(const(PangoFontDescription)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Unsets some of the fields in a [pango.font_description.FontDescription].
      
      The unset fields will get back to their default values.
  
      Params:
        toUnset = bitmask of fields in the desc to unset.
  */
  void unsetFields(pango.types.FontMask toUnset)
  {
    pango_font_description_unset_fields(cast(PangoFontDescription*)this._cPtr, toUnset);
  }

  /**
      Creates a new font description from a string representation.
      
      The string must have the form
      
          "\[FAMILY-LIST] \[STYLE-OPTIONS] \[SIZE] \[VARIATIONS]",
      
      where FAMILY-LIST is a comma-separated list of families optionally
      terminated by a comma, STYLE_OPTIONS is a whitespace-separated list
      of words where each word describes one of style, variant, weight,
      stretch, or gravity, and SIZE is a decimal number (size in points)
      or optionally followed by the unit modifier "px" for absolute size.
      VARIATIONS is a comma-separated list of font variation
      specifications of the form "\axis=value" (the = sign is optional).
      
      The following words are understood as styles:
      "Normal", "Roman", "Oblique", "Italic".
      
      The following words are understood as variants:
      "Small-Caps", "All-Small-Caps", "Petite-Caps", "All-Petite-Caps",
      "Unicase", "Title-Caps".
      
      The following words are understood as weights:
      "Thin", "Ultra-Light", "Extra-Light", "Light", "Semi-Light",
      "Demi-Light", "Book", "Regular", "Medium", "Semi-Bold", "Demi-Bold",
      "Bold", "Ultra-Bold", "Extra-Bold", "Heavy", "Black", "Ultra-Black",
      "Extra-Black".
      
      The following words are understood as stretch values:
      "Ultra-Condensed", "Extra-Condensed", "Condensed", "Semi-Condensed",
      "Semi-Expanded", "Expanded", "Extra-Expanded", "Ultra-Expanded".
      
      The following words are understood as gravity values:
      "Not-Rotated", "South", "Upside-Down", "North", "Rotated-Left",
      "East", "Rotated-Right", "West".
      
      Any one of the options may be absent. If FAMILY-LIST is absent, then
      the family_name field of the resulting font description will be
      initialized to null. If STYLE-OPTIONS is missing, then all style
      options will be set to the default values. If SIZE is missing, the
      size in the resulting font description will be set to 0.
      
      A typical example:
      
          "Cantarell Italic Light 15 \wght=200"
  
      Params:
        str = string representation of a font description.
      Returns: a new [pango.font_description.FontDescription].
  */
  static pango.font_description.FontDescription fromString(string str)
  {
    PangoFontDescription* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    _cretval = pango_font_description_from_string(_str);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
