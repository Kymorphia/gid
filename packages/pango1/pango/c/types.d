/// C types for pango1 library
module pango.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import gio.c.types;
public import harfbuzz.c.types;
public import cairo.c.types;

/**
    A `PangoGlyph` represents a single glyph in the output form of a string.
*/
alias PangoGlyph = uint;

/**
    The `PangoGlyphUnit` type is used to store dimensions within
    Pango.
    
    Dimensions are stored in 1/PANGO_SCALE of a device unit.
    (A device unit might be a pixel for screen display, or
    a point on a printer.) PANGO_SCALE is currently 1024, and
    may change in the future (unlikely though), but you should not
    depend on its exact value.
    
    The PANGO_PIXELS() macro can be used to convert from glyph units
    into device units with correct rounding.
*/
alias PangoGlyphUnit = int;

/**
    A `PangoLayoutRun` represents a single run within a [pango.layout_line.LayoutLine].
    
    It is simply an alternate name for [pango.glyph_item.GlyphItem].
    See the [pango.glyph_item.GlyphItem] docs for details on the fields.
*/
alias PangoLayoutRun = PangoGlyphItem;

/**
    [pango.types.Alignment] describes how to align the lines of a [pango.layout.Layout]
    within the available space.
    
    If the [pango.layout.Layout] is set to justify using [pango.layout.Layout.setJustify],
    this only affects partial lines.
    
    See [pango.layout.Layout.setAutoDir] for how text direction affects
    the interpretation of [pango.types.Alignment] values.
*/
enum PangoAlignment
{
  /**
      Put all available space on the right
  */
  Left = 0,

  /**
      Center the line within the available space
  */
  Center = 1,

  /**
      Put all available space on the left
  */
  Right = 2,
}

/**
    The [pango.types.AttrType] distinguishes between different types of attributes.
    
    Along with the predefined values, it is possible to allocate additional
    values for custom attributes using `func@AttrType.register`. The predefined
    values are given below. The type of structure used to store the attribute is
    listed in parentheses after the description.
*/
enum PangoAttrType
{
  /**
      does not happen
  */
  Invalid = 0,

  /**
      language ([pango.attr_language.AttrLanguage])
  */
  Language = 1,

  /**
      font family name list ([pango.attr_string.AttrString])
  */
  Family = 2,

  /**
      font slant style ([pango.attr_int.AttrInt])
  */
  Style = 3,

  /**
      font weight ([pango.attr_int.AttrInt])
  */
  Weight = 4,

  /**
      font variant (normal or small caps) ([pango.attr_int.AttrInt])
  */
  Variant = 5,

  /**
      font stretch ([pango.attr_int.AttrInt])
  */
  Stretch = 6,

  /**
      font size in points scaled by [pango.types.SCALE] ([pango.attr_int.AttrInt])
  */
  Size = 7,

  /**
      font description ([pango.attr_font_desc.AttrFontDesc])
  */
  FontDesc = 8,

  /**
      foreground color ([pango.attr_color.AttrColor])
  */
  Foreground = 9,

  /**
      background color ([pango.attr_color.AttrColor])
  */
  Background = 10,

  /**
      whether the text has an underline ([pango.attr_int.AttrInt])
  */
  Underline = 11,

  /**
      whether the text is struck-through ([pango.attr_int.AttrInt])
  */
  Strikethrough = 12,

  /**
      baseline displacement ([pango.attr_int.AttrInt])
  */
  Rise = 13,

  /**
      shape ([pango.attr_shape.AttrShape])
  */
  Shape = 14,

  /**
      font size scale factor ([pango.attr_float.AttrFloat])
  */
  Scale = 15,

  /**
      whether fallback is enabled ([pango.attr_int.AttrInt])
  */
  Fallback = 16,

  /**
      letter spacing (`struct@PangoAttrInt`)
  */
  LetterSpacing = 17,

  /**
      underline color ([pango.attr_color.AttrColor])
  */
  UnderlineColor = 18,

  /**
      strikethrough color ([pango.attr_color.AttrColor])
  */
  StrikethroughColor = 19,

  /**
      font size in pixels scaled by [pango.types.SCALE] ([pango.attr_int.AttrInt])
  */
  AbsoluteSize = 20,

  /**
      base text gravity ([pango.attr_int.AttrInt])
  */
  Gravity = 21,

  /**
      gravity hint ([pango.attr_int.AttrInt])
  */
  GravityHint = 22,

  /**
      OpenType font features ([pango.attr_font_features.AttrFontFeatures]). Since 1.38
  */
  FontFeatures = 23,

  /**
      foreground alpha ([pango.attr_int.AttrInt]). Since 1.38
  */
  ForegroundAlpha = 24,

  /**
      background alpha ([pango.attr_int.AttrInt]). Since 1.38
  */
  BackgroundAlpha = 25,

  /**
      whether breaks are allowed ([pango.attr_int.AttrInt]). Since 1.44
  */
  AllowBreaks = 26,

  /**
      how to render invisible characters ([pango.attr_int.AttrInt]). Since 1.44
  */
  Show = 27,

  /**
      whether to insert hyphens at intra-word line breaks ([pango.attr_int.AttrInt]). Since 1.44
  */
  InsertHyphens = 28,

  /**
      whether the text has an overline ([pango.attr_int.AttrInt]). Since 1.46
  */
  Overline = 29,

  /**
      overline color ([pango.attr_color.AttrColor]). Since 1.46
  */
  OverlineColor = 30,

  /**
      line height factor ([pango.attr_float.AttrFloat]). Since: 1.50
  */
  LineHeight = 31,

  /**
      line height ([pango.attr_int.AttrInt]). Since: 1.50
  */
  AbsoluteLineHeight = 32,

  /** */
  TextTransform = 33,

  /**
      override segmentation to classify the range of the attribute as a single word ([pango.attr_int.AttrInt]). Since 1.50
  */
  Word = 34,

  /**
      override segmentation to classify the range of the attribute as a single sentence ([pango.attr_int.AttrInt]). Since 1.50
  */
  Sentence = 35,

  /**
      baseline displacement ([pango.attr_int.AttrInt]). Since 1.50
  */
  BaselineShift = 36,

  /**
      font-relative size change ([pango.attr_int.AttrInt]). Since 1.50
  */
  FontScale = 37,
}

/**
    An enumeration that affects baseline shifts between runs.
*/
enum PangoBaselineShift
{
  /**
      Leave the baseline unchanged
  */
  None = 0,

  /**
      Shift the baseline to the superscript position,
        relative to the previous run
  */
  Superscript = 1,

  /**
      Shift the baseline to the subscript position,
        relative to the previous run
  */
  Subscript = 2,
}

/**
    [pango.types.BidiType] represents the bidirectional character
    type of a Unicode character.
    
    The values in this enumeration are specified by the
    [Unicode bidirectional algorithm](http://www.unicode.org/reports/tr9/).

    Deprecated: Use fribidi for this information
*/
enum PangoBidiType
{
  /**
      Left-to-Right
  */
  L = 0,

  /**
      Left-to-Right Embedding
  */
  Lre = 1,

  /**
      Left-to-Right Override
  */
  Lro = 2,

  /**
      Right-to-Left
  */
  R = 3,

  /**
      Right-to-Left Arabic
  */
  Al = 4,

  /**
      Right-to-Left Embedding
  */
  Rle = 5,

  /**
      Right-to-Left Override
  */
  Rlo = 6,

  /**
      Pop Directional Format
  */
  Pdf = 7,

  /**
      European Number
  */
  En = 8,

  /**
      European Number Separator
  */
  Es = 9,

  /**
      European Number Terminator
  */
  Et = 10,

  /**
      Arabic Number
  */
  An = 11,

  /**
      Common Number Separator
  */
  Cs = 12,

  /**
      Nonspacing Mark
  */
  Nsm = 13,

  /**
      Boundary Neutral
  */
  Bn = 14,

  /**
      Paragraph Separator
  */
  B = 15,

  /**
      Segment Separator
  */
  S = 16,

  /**
      Whitespace
  */
  Ws = 17,

  /**
      Other Neutrals
  */
  On = 18,

  /**
      Left-to-Right isolate. Since 1.48.6
  */
  Lri = 19,

  /**
      Right-to-Left isolate. Since 1.48.6
  */
  Rli = 20,

  /**
      First strong isolate. Since 1.48.6
  */
  Fsi = 21,

  /**
      Pop directional isolate. Since 1.48.6
  */
  Pdi = 22,
}

/**
    [pango.types.CoverageLevel] is used to indicate how well a font can
    represent a particular Unicode character for a particular script.
    
    Since 1.44, only [pango.types.CoverageLevel.None] and [pango.types.CoverageLevel.Exact]
    will be returned.
*/
enum PangoCoverageLevel
{
  /**
      The character is not representable with
        the font.
  */
  None = 0,

  /**
      The character is represented in a
        way that may be comprehensible but is not the correct
        graphical form. For instance, a Hangul character represented
        as a a sequence of Jamos, or a Latin transliteration of a
        Cyrillic word.
  */
  Fallback = 1,

  /**
      The character is represented as
        basically the correct graphical form, but with a stylistic
        variant inappropriate for the current script.
  */
  Approximate = 2,

  /**
      The character is represented as the
        correct graphical form.
  */
  Exact = 3,
}

/**
    [pango.types.Direction] represents a direction in the Unicode bidirectional
    algorithm.
    
    Not every value in this enumeration makes sense for every usage of
    [pango.types.Direction]; for example, the return value of `func@unichar_direction`
    and `func@find_base_dir` cannot be [pango.types.Direction.WeakLtr] or
    [pango.types.Direction.WeakRtl], since every character is either neutral
    or has a strong direction; on the other hand [pango.types.Direction.Neutral]
    doesn't make sense to pass to `func@itemize_with_base_dir`.
    
    The [pango.types.Direction.TtbLtr], [pango.types.Direction.TtbRtl] values come from
    an earlier interpretation of this enumeration as the writing direction
    of a block of text and are no longer used. See [pango.types.Gravity] for how
    vertical text is handled in Pango.
    
    If you are interested in text direction, you should really use fribidi
    directly. [pango.types.Direction] is only retained because it is used in some
    public apis.
*/
enum PangoDirection
{
  /**
      A strong left-to-right direction
  */
  Ltr = 0,

  /**
      A strong right-to-left direction
  */
  Rtl = 1,

  /**
      Deprecated value; treated the
        same as [pango.types.Direction.Rtl].
  */
  TtbLtr = 2,

  /**
      Deprecated value; treated the
        same as [pango.types.Direction.Ltr]
  */
  TtbRtl = 3,

  /**
      A weak left-to-right direction
  */
  WeakLtr = 4,

  /**
      A weak right-to-left direction
  */
  WeakRtl = 5,

  /**
      No direction specified
  */
  Neutral = 6,
}

/**
    [pango.types.EllipsizeMode] describes what sort of ellipsization
    should be applied to text.
    
    In the ellipsization process characters are removed from the
    text in order to make it fit to a given width and replaced
    with an ellipsis.
*/
enum PangoEllipsizeMode
{
  /**
      No ellipsization
  */
  None = 0,

  /**
      Omit characters at the start of the text
  */
  Start = 1,

  /**
      Omit characters in the middle of the text
  */
  Middle = 2,

  /**
      Omit characters at the end of the text
  */
  End = 3,
}

/**
    The bits in a [pango.types.FontMask] correspond to the set fields in a
    [pango.font_description.FontDescription].
*/
enum PangoFontMask : uint
{
  /**
      the font family is specified.
  */
  Family = 1,

  /**
      the font style is specified.
  */
  Style = 2,

  /**
      the font variant is specified.
  */
  Variant = 4,

  /**
      the font weight is specified.
  */
  Weight = 8,

  /**
      the font stretch is specified.
  */
  Stretch = 16,

  /**
      the font size is specified.
  */
  Size = 32,

  /**
      the font gravity is specified (Since: 1.16.)
  */
  Gravity = 64,

  /**
      OpenType font variations are specified (Since: 1.42)
  */
  Variations = 128,
}

/**
    An enumeration that affects font sizes for superscript
    and subscript positioning and for (emulated) Small Caps.
*/
enum PangoFontScale
{
  /**
      Leave the font size unchanged
  */
  None = 0,

  /**
      Change the font to a size suitable for superscripts
  */
  Superscript = 1,

  /**
      Change the font to a size suitable for subscripts
  */
  Subscript = 2,

  /**
      Change the font to a size suitable for Small Caps
  */
  SmallCaps = 3,
}

/**
    [pango.types.Gravity] represents the orientation of glyphs in a segment
    of text.
    
    This is useful when rendering vertical text layouts. In those situations,
    the layout is rotated using a non-identity [pango.matrix.Matrix], and then
    glyph orientation is controlled using [pango.types.Gravity].
    
    Not every value in this enumeration makes sense for every usage of
    [pango.types.Gravity]; for example, [pango.types.Gravity.Auto] only can be passed to
    [pango.context.Context.setBaseGravity] and can only be returned by
    [pango.context.Context.getBaseGravity].
    
    See also: [pango.types.GravityHint]
*/
enum PangoGravity
{
  /**
      Glyphs stand upright (default) <img align="right" valign="center" src="m-south.png">
  */
  South = 0,

  /**
      Glyphs are rotated 90 degrees counter-clockwise. <img align="right" valign="center" src="m-east.png">
  */
  East = 1,

  /**
      Glyphs are upside-down. <img align="right" valign="cener" src="m-north.png">
  */
  North = 2,

  /**
      Glyphs are rotated 90 degrees clockwise. <img align="right" valign="center" src="m-west.png">
  */
  West = 3,

  /**
      Gravity is resolved from the context matrix
  */
  Auto = 4,
}

/**
    [pango.types.GravityHint] defines how horizontal scripts should behave in a
    vertical context.
    
    That is, English excerpts in a vertical paragraph for example.
    
    See also [pango.types.Gravity]
*/
enum PangoGravityHint
{
  /**
      scripts will take their natural gravity based
        on the base gravity and the script.  This is the default.
  */
  Natural = 0,

  /**
      always use the base gravity set, regardless of
        the script.
  */
  Strong = 1,

  /**
      for scripts not in their natural direction (eg.
        Latin in East gravity), choose per-script gravity such that every script
        respects the line progression. This means, Latin and Arabic will take
        opposite gravities and both flow top-to-bottom for example.
  */
  Line = 2,
}

/**
    Errors that can be returned by [pango.layout.Layout.deserialize].
*/
enum PangoLayoutDeserializeError
{
  /**
      Unspecified error
  */
  Invalid = 0,

  /**
      A JSon value could not be
        interpreted
  */
  InvalidValue = 1,

  /**
      A required JSon member was
        not found
  */
  MissingValue = 2,
}

/**
    Flags that influence the behavior of [pango.layout.Layout.deserialize].
    
    New members may be added to this enumeration over time.
*/
enum PangoLayoutDeserializeFlags : uint
{
  /**
      Default behavior
  */
  Default = 0,

  /**
      Apply context information
        from the serialization to the [pango.context.Context]
  */
  Context = 1,
}

/**
    Flags that influence the behavior of [pango.layout.Layout.serialize].
    
    New members may be added to this enumeration over time.
*/
enum PangoLayoutSerializeFlags : uint
{
  /**
      Default behavior
  */
  Default = 0,

  /**
      Include context information
  */
  Context = 1,

  /**
      Include information about the formatted output
  */
  Output = 2,
}

/**
    The [pango.types.Overline] enumeration is used to specify whether text
    should be overlined, and if so, the type of line.
*/
enum PangoOverline
{
  /**
      no overline should be drawn
  */
  None = 0,

  /**
      Draw a single line above the ink
        extents of the text being underlined.
  */
  Single = 1,
}

/**
    [pango.types.RenderPart] defines different items to render for such
    purposes as setting colors.
*/
enum PangoRenderPart
{
  /**
      the text itself
  */
  Foreground = 0,

  /**
      the area behind the text
  */
  Background = 1,

  /**
      underlines
  */
  Underline = 2,

  /**
      strikethrough lines
  */
  Strikethrough = 3,

  /**
      overlines
  */
  Overline = 4,
}

/**
    The [pango.types.Script] enumeration identifies different writing
    systems.
    
    The values correspond to the names as defined in the Unicode standard. See
    [Unicode Standard Annex 24: Script names](http://www.unicode.org/reports/tr24/)
    
    Note that this enumeration is deprecated and will not be updated to include values
    in newer versions of the Unicode standard. Applications should use the
    [glib.types.UnicodeScript] enumeration instead,
    whose values are interchangeable with [pango.types.Script].
*/
enum PangoScript
{
  /**
      a value never returned from [pango.global.scriptForUnichar]
  */
  InvalidCode = -1,

  /**
      a character used by multiple different scripts
  */
  Common = 0,

  /**
      a mark glyph that takes its script from the
      base glyph to which it is attached
  */
  Inherited = 1,

  /**
      Arabic
  */
  Arabic = 2,

  /**
      Armenian
  */
  Armenian = 3,

  /**
      Bengali
  */
  Bengali = 4,

  /**
      Bopomofo
  */
  Bopomofo = 5,

  /**
      Cherokee
  */
  Cherokee = 6,

  /**
      Coptic
  */
  Coptic = 7,

  /**
      Cyrillic
  */
  Cyrillic = 8,

  /**
      Deseret
  */
  Deseret = 9,

  /**
      Devanagari
  */
  Devanagari = 10,

  /**
      Ethiopic
  */
  Ethiopic = 11,

  /**
      Georgian
  */
  Georgian = 12,

  /**
      Gothic
  */
  Gothic = 13,

  /**
      Greek
  */
  Greek = 14,

  /**
      Gujarati
  */
  Gujarati = 15,

  /**
      Gurmukhi
  */
  Gurmukhi = 16,

  /**
      Han
  */
  Han = 17,

  /**
      Hangul
  */
  Hangul = 18,

  /**
      Hebrew
  */
  Hebrew = 19,

  /**
      Hiragana
  */
  Hiragana = 20,

  /**
      Kannada
  */
  Kannada = 21,

  /**
      Katakana
  */
  Katakana = 22,

  /**
      Khmer
  */
  Khmer = 23,

  /**
      Lao
  */
  Lao = 24,

  /**
      Latin
  */
  Latin = 25,

  /**
      Malayalam
  */
  Malayalam = 26,

  /**
      Mongolian
  */
  Mongolian = 27,

  /**
      Myanmar
  */
  Myanmar = 28,

  /**
      Ogham
  */
  Ogham = 29,

  /**
      Old Italic
  */
  OldItalic = 30,

  /**
      Oriya
  */
  Oriya = 31,

  /**
      Runic
  */
  Runic = 32,

  /**
      Sinhala
  */
  Sinhala = 33,

  /**
      Syriac
  */
  Syriac = 34,

  /**
      Tamil
  */
  Tamil = 35,

  /**
      Telugu
  */
  Telugu = 36,

  /**
      Thaana
  */
  Thaana = 37,

  /**
      Thai
  */
  Thai = 38,

  /**
      Tibetan
  */
  Tibetan = 39,

  /**
      Canadian Aboriginal
  */
  CanadianAboriginal = 40,

  /**
      Yi
  */
  Yi = 41,

  /**
      Tagalog
  */
  Tagalog = 42,

  /**
      Hanunoo
  */
  Hanunoo = 43,

  /**
      Buhid
  */
  Buhid = 44,

  /**
      Tagbanwa
  */
  Tagbanwa = 45,

  /**
      Braille
  */
  Braille = 46,

  /**
      Cypriot
  */
  Cypriot = 47,

  /**
      Limbu
  */
  Limbu = 48,

  /**
      Osmanya
  */
  Osmanya = 49,

  /**
      Shavian
  */
  Shavian = 50,

  /**
      Linear B
  */
  LinearB = 51,

  /**
      Tai Le
  */
  TaiLe = 52,

  /**
      Ugaritic
  */
  Ugaritic = 53,

  /**
      New Tai Lue. Since 1.10
  */
  NewTaiLue = 54,

  /**
      Buginese. Since 1.10
  */
  Buginese = 55,

  /**
      Glagolitic. Since 1.10
  */
  Glagolitic = 56,

  /**
      Tifinagh. Since 1.10
  */
  Tifinagh = 57,

  /**
      Syloti Nagri. Since 1.10
  */
  SylotiNagri = 58,

  /**
      Old Persian. Since 1.10
  */
  OldPersian = 59,

  /**
      Kharoshthi. Since 1.10
  */
  Kharoshthi = 60,

  /**
      an unassigned code point. Since 1.14
  */
  Unknown = 61,

  /**
      Balinese. Since 1.14
  */
  Balinese = 62,

  /**
      Cuneiform. Since 1.14
  */
  Cuneiform = 63,

  /**
      Phoenician. Since 1.14
  */
  Phoenician = 64,

  /**
      Phags-pa. Since 1.14
  */
  PhagsPa = 65,

  /**
      N'Ko. Since 1.14
  */
  Nko = 66,

  /**
      Kayah Li. Since 1.20.1
  */
  KayahLi = 67,

  /**
      Lepcha. Since 1.20.1
  */
  Lepcha = 68,

  /**
      Rejang. Since 1.20.1
  */
  Rejang = 69,

  /**
      Sundanese. Since 1.20.1
  */
  Sundanese = 70,

  /**
      Saurashtra. Since 1.20.1
  */
  Saurashtra = 71,

  /**
      Cham. Since 1.20.1
  */
  Cham = 72,

  /**
      Ol Chiki. Since 1.20.1
  */
  OlChiki = 73,

  /**
      Vai. Since 1.20.1
  */
  Vai = 74,

  /**
      Carian. Since 1.20.1
  */
  Carian = 75,

  /**
      Lycian. Since 1.20.1
  */
  Lycian = 76,

  /**
      Lydian. Since 1.20.1
  */
  Lydian = 77,

  /**
      Batak. Since 1.32
  */
  Batak = 78,

  /**
      Brahmi. Since 1.32
  */
  Brahmi = 79,

  /**
      Mandaic. Since 1.32
  */
  Mandaic = 80,

  /**
      Chakma. Since: 1.32
  */
  Chakma = 81,

  /**
      Meroitic Cursive. Since: 1.32
  */
  MeroiticCursive = 82,

  /**
      Meroitic Hieroglyphs. Since: 1.32
  */
  MeroiticHieroglyphs = 83,

  /**
      Miao. Since: 1.32
  */
  Miao = 84,

  /**
      Sharada. Since: 1.32
  */
  Sharada = 85,

  /**
      Sora Sompeng. Since: 1.32
  */
  SoraSompeng = 86,

  /**
      Takri. Since: 1.32
  */
  Takri = 87,

  /**
      Bassa. Since: 1.40
  */
  BassaVah = 88,

  /**
      Caucasian Albanian. Since: 1.40
  */
  CaucasianAlbanian = 89,

  /**
      Duployan. Since: 1.40
  */
  Duployan = 90,

  /**
      Elbasan. Since: 1.40
  */
  Elbasan = 91,

  /**
      Grantha. Since: 1.40
  */
  Grantha = 92,

  /**
      Kjohki. Since: 1.40
  */
  Khojki = 93,

  /**
      Khudawadi, Sindhi. Since: 1.40
  */
  Khudawadi = 94,

  /**
      Linear A. Since: 1.40
  */
  LinearA = 95,

  /**
      Mahajani. Since: 1.40
  */
  Mahajani = 96,

  /**
      Manichaean. Since: 1.40
  */
  Manichaean = 97,

  /**
      Mende Kikakui. Since: 1.40
  */
  MendeKikakui = 98,

  /**
      Modi. Since: 1.40
  */
  Modi = 99,

  /**
      Mro. Since: 1.40
  */
  Mro = 100,

  /**
      Nabataean. Since: 1.40
  */
  Nabataean = 101,

  /**
      Old North Arabian. Since: 1.40
  */
  OldNorthArabian = 102,

  /**
      Old Permic. Since: 1.40
  */
  OldPermic = 103,

  /**
      Pahawh Hmong. Since: 1.40
  */
  PahawhHmong = 104,

  /**
      Palmyrene. Since: 1.40
  */
  Palmyrene = 105,

  /**
      Pau Cin Hau. Since: 1.40
  */
  PauCinHau = 106,

  /**
      Psalter Pahlavi. Since: 1.40
  */
  PsalterPahlavi = 107,

  /**
      Siddham. Since: 1.40
  */
  Siddham = 108,

  /**
      Tirhuta. Since: 1.40
  */
  Tirhuta = 109,

  /**
      Warang Citi. Since: 1.40
  */
  WarangCiti = 110,

  /**
      Ahom. Since: 1.40
  */
  Ahom = 111,

  /**
      Anatolian Hieroglyphs. Since: 1.40
  */
  AnatolianHieroglyphs = 112,

  /**
      Hatran. Since: 1.40
  */
  Hatran = 113,

  /**
      Multani. Since: 1.40
  */
  Multani = 114,

  /**
      Old Hungarian. Since: 1.40
  */
  OldHungarian = 115,

  /**
      Signwriting. Since: 1.40
  */
  Signwriting = 116,
}

/**
    Flags influencing the shaping process.
    
    [pango.types.ShapeFlags] can be passed to `func@Pango.shape_with_flags`.
*/
enum PangoShapeFlags : uint
{
  /**
      Default value
  */
  None = 0,

  /**
      Round glyph positions and widths to whole device units
        This option should be set if the target renderer can't do subpixel positioning of glyphs
  */
  RoundPositions = 1,
}

/**
    These flags affect how Pango treats characters that are normally
    not visible in the output.
*/
enum PangoShowFlags : uint
{
  /**
      No special treatment for invisible characters
  */
  None = 0,

  /**
      Render spaces, tabs and newlines visibly
  */
  Spaces = 1,

  /**
      Render line breaks visibly
  */
  LineBreaks = 2,

  /**
      Render default-ignorable Unicode
        characters visibly
  */
  Ignorables = 4,
}

/**
    An enumeration specifying the width of the font relative to other designs
    within a family.
*/
enum PangoStretch
{
  /**
      ultra condensed width
  */
  UltraCondensed = 0,

  /**
      extra condensed width
  */
  ExtraCondensed = 1,

  /**
      condensed width
  */
  Condensed = 2,

  /**
      semi condensed width
  */
  SemiCondensed = 3,

  /**
      the normal width
  */
  Normal = 4,

  /**
      semi expanded width
  */
  SemiExpanded = 5,

  /**
      expanded width
  */
  Expanded = 6,

  /**
      extra expanded width
  */
  ExtraExpanded = 7,

  /**
      ultra expanded width
  */
  UltraExpanded = 8,
}

/**
    An enumeration specifying the various slant styles possible for a font.
*/
enum PangoStyle
{
  /**
      the font is upright.
  */
  Normal = 0,

  /**
      the font is slanted, but in a roman style.
  */
  Oblique = 1,

  /**
      the font is slanted in an italic style.
  */
  Italic = 2,
}

/**
    [pango.types.TabAlign] specifies where the text appears relative to the tab stop
    position.
*/
enum PangoTabAlign
{
  /**
      the text appears to the right of the tab stop position
  */
  Left = 0,

  /**
      the text appears to the left of the tab stop position
        until the available space is filled. Since: 1.50
  */
  Right = 1,

  /**
      the text is centered at the tab stop position
        until the available space is filled. Since: 1.50
  */
  Center = 2,

  /**
      text before the first occurrence of the decimal point
        character appears to the left of the tab stop position (until the available
        space is filled), the rest to the right. Since: 1.50
  */
  Decimal = 3,
}

/**
    An enumeration that affects how Pango treats characters during shaping.
*/
enum PangoTextTransform
{
  /**
      Leave text unchanged
  */
  None = 0,

  /**
      Display letters and numbers as lowercase
  */
  Lowercase = 1,

  /**
      Display letters and numbers as uppercase
  */
  Uppercase = 2,

  /**
      Display the first character of a word
        in titlecase
  */
  Capitalize = 3,
}

/**
    The [pango.types.Underline] enumeration is used to specify whether text
    should be underlined, and if so, the type of underlining.
*/
enum PangoUnderline
{
  /**
      no underline should be drawn
  */
  None = 0,

  /**
      a single underline should be drawn
  */
  Single = 1,

  /**
      a double underline should be drawn
  */
  Double = 2,

  /**
      a single underline should be drawn at a
        position beneath the ink extents of the text being
        underlined. This should be used only for underlining
        single characters, such as for keyboard accelerators.
        [pango.types.Underline.Single] should be used for extended
        portions of text.
  */
  Low = 3,

  /**
      an underline indicating an error should
        be drawn below. The exact style of rendering is up to the
        [pango.renderer.Renderer] in use, but typical styles include wavy
        or dotted lines.
        This underline is typically used to indicate an error such
        as a possible mispelling; in some cases a contrasting color
        may automatically be used. This type of underlining is
        available since Pango 1.4.
  */
  Error = 4,

  /**
      Like @PANGO_UNDERLINE_SINGLE, but
        drawn continuously across multiple runs. This type
        of underlining is available since Pango 1.46.
  */
  SingleLine = 5,

  /**
      Like @PANGO_UNDERLINE_DOUBLE, but
        drawn continuously across multiple runs. This type
        of underlining is available since Pango 1.46.
  */
  DoubleLine = 6,

  /**
      Like @PANGO_UNDERLINE_ERROR, but
        drawn continuously across multiple runs. This type
        of underlining is available since Pango 1.46.
  */
  ErrorLine = 7,
}

/**
    An enumeration specifying capitalization variant of the font.
*/
enum PangoVariant
{
  /**
      A normal font.
  */
  Normal = 0,

  /**
      A font with the lower case characters
        replaced by smaller variants of the capital characters.
  */
  SmallCaps = 1,

  /**
      A font with all characters
        replaced by smaller variants of the capital characters. Since: 1.50
  */
  AllSmallCaps = 2,

  /**
      A font with the lower case characters
        replaced by smaller variants of the capital characters.
        Petite Caps can be even smaller than Small Caps. Since: 1.50
  */
  PetiteCaps = 3,

  /**
      A font with all characters
        replaced by smaller variants of the capital characters.
        Petite Caps can be even smaller than Small Caps. Since: 1.50
  */
  AllPetiteCaps = 4,

  /**
      A font with the upper case characters
        replaced by smaller variants of the capital letters. Since: 1.50
  */
  Unicase = 5,

  /**
      A font with capital letters that
        are more suitable for all-uppercase titles. Since: 1.50
  */
  TitleCaps = 6,
}

/**
    An enumeration specifying the weight (boldness) of a font.
    
    Weight is specified as a numeric value ranging from 100 to 1000.
    This enumeration simply provides some common, predefined values.
*/
enum PangoWeight
{
  /**
      the thin weight (= 100) Since: 1.24
  */
  Thin = 100,

  /**
      the ultralight weight (= 200)
  */
  Ultralight = 200,

  /**
      the light weight (= 300)
  */
  Light = 300,

  /**
      the semilight weight (= 350) Since: 1.36.7
  */
  Semilight = 350,

  /**
      the book weight (= 380) Since: 1.24)
  */
  Book = 380,

  /**
      the default weight (= 400)
  */
  Normal = 400,

  /**
      the medium weight (= 500) Since: 1.24
  */
  Medium = 500,

  /**
      the semibold weight (= 600)
  */
  Semibold = 600,

  /**
      the bold weight (= 700)
  */
  Bold = 700,

  /**
      the ultrabold weight (= 800)
  */
  Ultrabold = 800,

  /**
      the heavy weight (= 900)
  */
  Heavy = 900,

  /**
      the ultraheavy weight (= 1000) Since: 1.24
  */
  Ultraheavy = 1000,
}

/**
    [pango.types.WrapMode] describes how to wrap the lines of a [pango.layout.Layout]
    to the desired width.
    
    For @PANGO_WRAP_WORD, Pango uses break opportunities that are determined
    by the Unicode line breaking algorithm. For @PANGO_WRAP_CHAR, Pango allows
    breaking at grapheme boundaries that are determined by the Unicode text
    segmentation algorithm.
*/
enum PangoWrapMode
{
  /**
      wrap lines at word boundaries.
  */
  Word = 0,

  /**
      wrap lines at character boundaries.
  */
  Char = 1,

  /**
      wrap lines at word boundaries, but fall back to
        character boundaries if there is not enough space for a full word.
  */
  WordChar = 2,
}

/**
    The [pango.analysis.Analysis] structure stores information about
    the properties of a segment of text.
*/
struct PangoAnalysis
{
  /**
      unused, reserved
  */
  void* shapeEngine;

  /**
      unused, reserved
  */
  void* langEngine;

  /**
      the font for this segment.
  */
  PangoFont* font;

  /**
      the bidirectional level for this segment.
  */
  ubyte level;

  /**
      the glyph orientation for this segment (A [pango.types.Gravity]).
  */
  ubyte gravity;

  /**
      boolean flags for this segment (Since: 1.16).
  */
  ubyte flags;

  /**
      the detected script for this segment (A [pango.types.Script]) (Since: 1.18).
  */
  ubyte script;

  /**
      the detected language for this segment.
  */
  PangoLanguage* language;

  /**
      extra attributes for this segment.
  */
  GSList* extraAttrs;
}

/**
    The [pango.types.AttrClass] structure stores the type and operations for
    a particular type of attribute.
    
    The functions in this structure should not be called directly. Instead,
    one should use the wrapper functions provided for [pango.attribute.Attribute].
*/
struct PangoAttrClass
{
  /**
      the type ID for this attribute
  */
  PangoAttrType type;

  /** */
  extern(C) PangoAttribute* function(const(PangoAttribute)* attr) copy;

  /** */
  extern(C) void function(PangoAttribute* attr) destroy;

  /** */
  extern(C) gboolean function(const(PangoAttribute)* attr1, const(PangoAttribute)* attr2) equal;
}

/**
    The [pango.attr_color.AttrColor] structure is used to represent attributes that
    are colors.
*/
struct PangoAttrColor
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the [pango.color.Color] which is the value of the attribute
  */
  PangoColor color;
}

/**
    The [pango.attr_float.AttrFloat] structure is used to represent attributes with
    a float or double value.
*/
struct PangoAttrFloat
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the value of the attribute
  */
  double value;
}

/**
    The [pango.attr_font_desc.AttrFontDesc] structure is used to store an attribute that
    sets all aspects of the font description at once.
*/
struct PangoAttrFontDesc
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the font description which is the value of this attribute
  */
  PangoFontDescription* desc;
}

/**
    The [pango.attr_font_features.AttrFontFeatures] structure is used to represent OpenType
    font features as an attribute.
*/
struct PangoAttrFontFeatures
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the features, as a string in CSS syntax
  */
  char* features;
}

/**
    The [pango.attr_int.AttrInt] structure is used to represent attributes with
    an integer or enumeration value.
*/
struct PangoAttrInt
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the value of the attribute
  */
  int value;
}

/**
    A [pango.attr_iterator.AttrIterator] is used to iterate through a [pango.attr_list.AttrList].
    
    A new iterator is created with [pango.attr_list.AttrList.getIterator].
    Once the iterator is created, it can be advanced through the style
    changes in the text using [pango.attr_iterator.AttrIterator.next]. At each
    style change, the range of the current style segment and the attributes
    currently in effect can be queried.
*/
struct PangoAttrIterator;

/**
    The [pango.attr_language.AttrLanguage] structure is used to represent attributes that
    are languages.
*/
struct PangoAttrLanguage
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the [pango.language.Language] which is the value of the attribute
  */
  PangoLanguage* value;
}

/**
    A [pango.attr_list.AttrList] represents a list of attributes that apply to a section
    of text.
    
    The attributes in a [pango.attr_list.AttrList] are, in general, allowed to overlap in
    an arbitrary fashion. However, if the attributes are manipulated only through
    [pango.attr_list.AttrList.change], the overlap between properties will meet
    stricter criteria.
    
    Since the [pango.attr_list.AttrList] structure is stored as a linear list, it is not
    suitable for storing attributes for large amounts of text. In general, you
    should not use a single [pango.attr_list.AttrList] for more than one paragraph of text.
*/
struct PangoAttrList;

/**
    The [pango.attr_shape.AttrShape] structure is used to represent attributes which
    impose shape restrictions.
*/
struct PangoAttrShape
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the ink rectangle to restrict to
  */
  PangoRectangle inkRect;

  /**
      the logical rectangle to restrict to
  */
  PangoRectangle logicalRect;

  /**
      user data set (see [pango.attr_shape.AttrShape.newWithData])
  */
  void* data;

  /**
      copy function for the user data
  */
  PangoAttrDataCopyFunc copyFunc;

  /**
      destroy function for the user data
  */
  GDestroyNotify destroyFunc;
}

/**
    The [pango.attr_size.AttrSize] structure is used to represent attributes which
    set font size.
*/
struct PangoAttrSize
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      size of font, in units of 1/[pango.types.SCALE] of a point (for
        [pango.types.AttrType.Size]) or of a device unit (for [pango.types.AttrType.AbsoluteSize])
  */
  int size;

  /**
      whether the font size is in device units or points.
        This field is only present for compatibility with Pango-1.8.0
        ([pango.types.AttrType.AbsoluteSize] was added in 1.8.1); and always will
        be false for [pango.types.AttrType.Size] and true for [pango.types.AttrType.AbsoluteSize].
  */
  uint absolute;
}

/**
    The [pango.attr_string.AttrString] structure is used to represent attributes with
    a string value.
*/
struct PangoAttrString
{
  /**
      the common portion of the attribute
  */
  PangoAttribute attr;

  /**
      the string which is the value of the attribute
  */
  char* value;
}

/**
    The [pango.attribute.Attribute] structure represents the common portions of all
    attributes.
    
    Particular types of attributes include this structure as their initial
    portion. The common portion of the attribute holds the range to which
    the value in the type-specific part of the attribute applies and should
    be initialized using [pango.attribute.Attribute.init_]. By default, an attribute
    will have an all-inclusive range of [0,`G_MAXUINT`].
*/
struct PangoAttribute
{
  /**
      the class structure holding information about the type of the attribute
  */
  const(PangoAttrClass)* klass;

  /**
      the start index of the range (in bytes).
  */
  uint startIndex;

  /**
      end index of the range (in bytes). The character at this index
        is not included in the range.
  */
  uint endIndex;
}

/**
    The [pango.color.Color] structure is used to
    represent a color in an uncalibrated RGB color-space.
*/
struct PangoColor
{
  /**
      value of red component
  */
  ushort red;

  /**
      value of green component
  */
  ushort green;

  /**
      value of blue component
  */
  ushort blue;
}

/**
    A [pango.context.Context] stores global information used to control the
    itemization process.
    
    The information stored by [pango.context.Context] includes the fontmap used
    to look up fonts, and default values such as the default language,
    default gravity, or default font.
    
    To obtain a [pango.context.Context], use [pango.font_map.FontMap.createContext].
*/
struct PangoContext;

/** */
struct PangoContextClass;

/**
    A [pango.coverage.Coverage] structure is a map from Unicode characters
    to [pango.types.CoverageLevel] values.
    
    It is often necessary in Pango to determine if a particular
    font can represent a particular character, and also how well
    it can represent that character. The [pango.coverage.Coverage] is a data
    structure that is used to represent that information. It is an
    opaque structure with no public fields.
*/
struct PangoCoverage;

/**
    A [pango.font.Font] is used to represent a font in a
    rendering-system-independent manner.
*/
struct PangoFont
{
  /** */
  GObject parentInstance;
}

/** */
struct PangoFontClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) PangoFontDescription* function(PangoFont* font) describe;

  /** */
  extern(C) PangoCoverage* function(PangoFont* font, PangoLanguage* language) getCoverage;

  /** */
  extern(C) void function(PangoFont* font, PangoGlyph glyph, PangoRectangle* inkRect, PangoRectangle* logicalRect) getGlyphExtents;

  /** */
  extern(C) PangoFontMetrics* function(PangoFont* font, PangoLanguage* language) getMetrics;

  /** */
  extern(C) PangoFontMap* function(PangoFont* font) getFontMap;

  /** */
  extern(C) PangoFontDescription* function(PangoFont* font) describeAbsolute;

  /** */
  extern(C) void function(PangoFont* font, hb_feature_t* features, uint len, uint* numFeatures) getFeatures;

  /** */
  extern(C) hb_font_t* function(PangoFont* font) createHbFont;
}

/**
    A [pango.font_description.FontDescription] describes a font in an implementation-independent
    manner.
    
    [pango.font_description.FontDescription] structures are used both to list what fonts are
    available on the system and also for specifying the characteristics of
    a font to load.
*/
struct PangoFontDescription;

/**
    A [pango.font_face.FontFace] is used to represent a group of fonts with
    the same family, slant, weight, and width, but varying sizes.
*/
struct PangoFontFace
{
  /** */
  GObject parentInstance;
}

/** */
struct PangoFontFaceClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) const(char)* function(PangoFontFace* face) getFaceName;

  /** */
  extern(C) PangoFontDescription* function(PangoFontFace* face) describe;

  /** */
  extern(C) void function(PangoFontFace* face, int** sizes, int* nSizes) listSizes;

  /** */
  extern(C) gboolean function(PangoFontFace* face) isSynthesized;

  /** */
  extern(C) PangoFontFamily* function(PangoFontFace* face) getFamily;

  /** */
  extern(C) void function() PangoReserved3;

  /** */
  extern(C) void function() PangoReserved4;
}

/**
    A [pango.font_family.FontFamily] is used to represent a family of related
    font faces.
    
    The font faces in a family share a common design, but differ in
    slant, weight, width or other aspects.
*/
struct PangoFontFamily
{
  /** */
  GObject parentInstance;
}

/** */
struct PangoFontFamilyClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(PangoFontFamily* family, PangoFontFace*** faces, int* nFaces) listFaces;

  /** */
  extern(C) const(char)* function(PangoFontFamily* family) getName;

  /** */
  extern(C) gboolean function(PangoFontFamily* family) isMonospace;

  /** */
  extern(C) gboolean function(PangoFontFamily* family) isVariable;

  /** */
  extern(C) PangoFontFace* function(PangoFontFamily* family, const(char)* name) getFace;

  /** */
  extern(C) void function() PangoReserved2;
}

/**
    A [pango.font_map.FontMap] represents the set of fonts available for a
    particular rendering system.
    
    This is a virtual object with implementations being specific to
    particular rendering systems.
*/
struct PangoFontMap
{
  /** */
  GObject parentInstance;
}

/**
    The [pango.font_map_class.FontMapClass] structure holds the virtual functions for
    a particular [pango.font_map.FontMap] implementation.
*/
struct PangoFontMapClass
{
  /**
      parent [gstpbutils.types.ObjectClass]
  */
  GObjectClass parentClass;

  /** */
  extern(C) PangoFont* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc) loadFont;

  /** */
  extern(C) void function(PangoFontMap* fontmap, PangoFontFamily*** families, int* nFamilies) listFamilies;

  /** */
  extern(C) PangoFontset* function(PangoFontMap* fontmap, PangoContext* context, const(PangoFontDescription)* desc, PangoLanguage* language) loadFontset;

  /**
      the type of rendering-system-dependent engines that
      can handle fonts of this fonts loaded with this fontmap.
  */
  const(char)* shapeEngineType;

  /** */
  extern(C) uint function(PangoFontMap* fontmap) getSerial;

  /** */
  extern(C) void function(PangoFontMap* fontmap) changed;

  /** */
  extern(C) PangoFontFamily* function(PangoFontMap* fontmap, const(char)* name) getFamily;

  /** */
  extern(C) PangoFontFace* function(PangoFontMap* fontmap, PangoFont* font) getFace;
}

/**
    A [pango.font_metrics.FontMetrics] structure holds the overall metric information
    for a font.
    
    The information in a [pango.font_metrics.FontMetrics] structure may be restricted
    to a script. The fields of this structure are private to implementations
    of a font backend. See the documentation of the corresponding getters
    for documentation of their meaning.
    
    For an overview of the most important metrics, see:
    
    <picture>
      <source srcset="fontmetrics-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Font metrics" src="fontmetrics-light.png">
    </picture>
*/
struct PangoFontMetrics
{
  /** */
  uint refCount;

  /** */
  int ascent;

  /** */
  int descent;

  /** */
  int height;

  /** */
  int approximateCharWidth;

  /** */
  int approximateDigitWidth;

  /** */
  int underlinePosition;

  /** */
  int underlineThickness;

  /** */
  int strikethroughPosition;

  /** */
  int strikethroughThickness;
}

/**
    A [pango.fontset.Fontset] represents a set of [pango.font.Font] to use when rendering text.
    
    A [pango.fontset.Fontset] is the result of resolving a [pango.font_description.FontDescription]
    against a particular [pango.context.Context]. It has operations for finding the
    component font for a particular Unicode character, and for finding a
    composite set of metrics for the entire fontset.
*/
struct PangoFontset
{
  /** */
  GObject parentInstance;
}

/**
    The [pango.fontset_class.FontsetClass] structure holds the virtual functions for
    a particular [pango.fontset.Fontset] implementation.
*/
struct PangoFontsetClass
{
  /**
      parent [gstpbutils.types.ObjectClass]
  */
  GObjectClass parentClass;

  /** */
  extern(C) PangoFont* function(PangoFontset* fontset, uint wc) getFont;

  /** */
  extern(C) PangoFontMetrics* function(PangoFontset* fontset) getMetrics;

  /** */
  extern(C) PangoLanguage* function(PangoFontset* fontset) getLanguage;

  /** */
  extern(C) void function(PangoFontset* fontset, PangoFontsetForeachFunc func, void* data) foreach_;

  /** */
  extern(C) void function() PangoReserved1;

  /** */
  extern(C) void function() PangoReserved2;

  /** */
  extern(C) void function() PangoReserved3;

  /** */
  extern(C) void function() PangoReserved4;
}

/**
    [pango.fontset_simple.FontsetSimple] is a implementation of the abstract
    [pango.fontset.Fontset] base class as an array of fonts.
    
    When creating a [pango.fontset_simple.FontsetSimple], you have to provide
    the array of fonts that make up the fontset.
*/
struct PangoFontsetSimple;

/** */
struct PangoFontsetSimpleClass;

/**
    The [pango.types.GlyphGeometry] structure contains width and positioning
    information for a single glyph.
    
    Note that @width is not guaranteed to be the same as the glyph
    extents. Kerning and other positioning applied during shaping will
    affect both the @width and the @x_offset for the glyphs in the
    glyph string that results from shaping.
    
    The information in this struct is intended for rendering the glyphs,
    as follows:
    
    1. Assume the current point is (x, y)
    2. Render the current glyph at (x + x_offset, y + y_offset),
    3. Advance the current point to (x + width, y)
    4. Render the next glyph
*/
struct PangoGlyphGeometry
{
  /**
      the logical width to use for the the character.
  */
  PangoGlyphUnit width;

  /**
      horizontal offset from nominal character position.
  */
  PangoGlyphUnit xOffset;

  /**
      vertical offset from nominal character position.
  */
  PangoGlyphUnit yOffset;
}

/**
    A [pango.glyph_info.GlyphInfo] structure represents a single glyph with
    positioning information and visual attributes.
*/
struct PangoGlyphInfo
{
  /**
      the glyph itself.
  */
  PangoGlyph glyph;

  /**
      the positional information about the glyph.
  */
  PangoGlyphGeometry geometry;

  /**
      the visual attributes of the glyph.
  */
  PangoGlyphVisAttr attr;
}

/**
    A [pango.glyph_item.GlyphItem] is a pair of a [pango.item.Item] and the glyphs
    resulting from shaping the items text.
    
    As an example of the usage of [pango.glyph_item.GlyphItem], the results
    of shaping text with [pango.layout.Layout] is a list of [pango.layout_line.LayoutLine],
    each of which contains a list of [pango.glyph_item.GlyphItem].
*/
struct PangoGlyphItem
{
  /**
      corresponding [pango.item.Item]
  */
  PangoItem* item;

  /**
      corresponding [pango.glyph_string.GlyphString]
  */
  PangoGlyphString* glyphs;

  /**
      shift of the baseline, relative to the baseline
        of the containing line. Positive values shift upwards
  */
  int yOffset;

  /**
      horizontal displacement to apply before the
        glyph item. Positive values shift right
  */
  int startXOffset;

  /**
      horizontal displacement to apply after th
        glyph item. Positive values shift right
  */
  int endXOffset;
}

/**
    A [pango.glyph_item_iter.GlyphItemIter] is an iterator over the clusters in a
    [pango.glyph_item.GlyphItem].
    
    The *forward direction* of the iterator is the logical direction of text.
    That is, with increasing @start_index and @start_char values. If @glyph_item
    is right-to-left (that is, if `glyph_item->item->analysis.level` is odd),
    then @start_glyph decreases as the iterator moves forward.  Moreover,
    in right-to-left cases, @start_glyph is greater than @end_glyph.
    
    An iterator should be initialized using either
    [pango.glyph_item_iter.GlyphItemIter.initStart] or
    [pango.glyph_item_iter.GlyphItemIter.initEnd], for forward and backward iteration
    respectively, and walked over using any desired mixture of
    [pango.glyph_item_iter.GlyphItemIter.nextCluster] and
    [pango.glyph_item_iter.GlyphItemIter.prevCluster].
    
    A common idiom for doing a forward iteration over the clusters is:
    
    ```
    PangoGlyphItemIter cluster_iter;
    gboolean have_cluster;
    
    for (have_cluster = pango_glyph_item_iter_init_start (&cluster_iter,
                                                          glyph_item, text);
         have_cluster;
         have_cluster = pango_glyph_item_iter_next_cluster (&cluster_iter))
    {
      ...
    }
    ```
    
    Note that @text is the start of the text for layout, which is then
    indexed by `glyph_item->item->offset` to get to the text of @glyph_item.
    The @start_index and @end_index values can directly index into @text. The
    @start_glyph, @end_glyph, @start_char, and @end_char values however are
    zero-based for the @glyph_item.  For each cluster, the item pointed at by
    the start variables is included in the cluster while the one pointed at by
    end variables is not.
    
    None of the members of a [pango.glyph_item_iter.GlyphItemIter] should be modified manually.
*/
struct PangoGlyphItemIter
{
  /** */
  PangoGlyphItem* glyphItem;

  /** */
  const(char)* text;

  /** */
  int startGlyph;

  /** */
  int startIndex;

  /** */
  int startChar;

  /** */
  int endGlyph;

  /** */
  int endIndex;

  /** */
  int endChar;
}

/**
    A [pango.glyph_string.GlyphString] is used to store strings of glyphs with geometry
    and visual attribute information.
    
    The storage for the glyph information is owned by the structure
    which simplifies memory management.
*/
struct PangoGlyphString
{
  /**
      number of glyphs in this glyph string
  */
  int numGlyphs;

  /**
      array of glyph information
  */
  PangoGlyphInfo* glyphs;

  /**
      logical cluster info, indexed by the byte index
        within the text corresponding to the glyph string
  */
  int* logClusters;

  /** */
  int space;
}

/**
    A [pango.types.GlyphVisAttr] structure communicates information between
    the shaping and rendering phases.
    
    Currently, it contains cluster start and color information.
    More attributes may be added in the future.
    
    Clusters are stored in visual order, within the cluster, glyphs
    are always ordered in logical order, since visual order is meaningless;
    that is, in Arabic text, accent glyphs follow the glyphs for the
    base character.
*/
struct PangoGlyphVisAttr
{
  /**
      set for the first logical glyph in each cluster.
  */
  uint isClusterStart;

  /**
      set if the the font will render this glyph with color. Since 1.50
  */
  uint isColor;
}

/**
    The [pango.item.Item] structure stores information about a segment of text.
    
    You typically obtain `PangoItems` by itemizing a piece of text
    with `func@itemize`.
*/
struct PangoItem
{
  /**
      byte offset of the start of this item in text.
  */
  int offset;

  /**
      length of this item in bytes.
  */
  int length;

  /**
      number of Unicode characters in the item.
  */
  int numChars;

  /**
      analysis results for the item.
  */
  PangoAnalysis analysis;
}

/**
    The [pango.language.Language] structure is used to
    represent a language.
    
    [pango.language.Language] pointers can be efficiently
    copied and compared with each other.
*/
struct PangoLanguage;

/**
    A [pango.layout.Layout] structure represents an entire paragraph of text.
    
    While complete access to the layout capabilities of Pango is provided
    using the detailed interfaces for itemization and shaping, using
    that functionality directly involves writing a fairly large amount
    of code. [pango.layout.Layout] provides a high-level driver for formatting
    entire paragraphs of text at once. This includes paragraph-level
    functionality such as line breaking, justification, alignment and
    ellipsization.
    
    A [pango.layout.Layout] is initialized with a [pango.context.Context], UTF-8 string
    and set of attributes for that string. Once that is done, the set of
    formatted lines can be extracted from the object, the layout can be
    rendered, and conversion between logical character positions within
    the layout's text, and the physical position of the resulting glyphs
    can be made.
    
    There are a number of parameters to adjust the formatting of a
    [pango.layout.Layout]. The following image shows adjustable parameters
    (on the left) and font metrics (on the right):
    
    <picture>
      <source srcset="layout-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="Pango Layout Parameters" src="layout-light.png">
    </picture>
    
    The following images demonstrate the effect of alignment and
    justification on the layout of text:
    
    | | |
    | --- | --- |
    | ![align=left](align-left.png) | ![align=left, justify](align-left-justify.png) |
    | ![align=center](align-center.png) | ![align=center, justify](align-center-justify.png) |
    | ![align=right](align-right.png) | ![align=right, justify](align-right-justify.png) |
    
    
    It is possible, as well, to ignore the 2-D setup,
    and simply treat the results of a [pango.layout.Layout] as a list of lines.
*/
struct PangoLayout;

/** */
struct PangoLayoutClass;

/**
    A [pango.layout_iter.LayoutIter] can be used to iterate over the visual
    extents of a [pango.layout.Layout].
    
    To obtain a [pango.layout_iter.LayoutIter], use [pango.layout.Layout.getIter].
    
    The [pango.layout_iter.LayoutIter] structure is opaque, and has no user-visible fields.
*/
struct PangoLayoutIter;

/**
    A [pango.layout_line.LayoutLine] represents one of the lines resulting from laying
    out a paragraph via [pango.layout.Layout].
    
    [pango.layout_line.LayoutLine] structures are obtained by calling
    [pango.layout.Layout.getLine] and are only valid until the text,
    attributes, or settings of the parent [pango.layout.Layout] are modified.
*/
struct PangoLayoutLine
{
  /**
      the layout this line belongs to, might be null
  */
  PangoLayout* layout;

  /**
      start of line as byte index into layout->text
  */
  int startIndex;

  /**
      length of line in bytes
  */
  int length;

  /**
      list of runs in the
        line, from left to right
  */
  GSList* runs;

  /**
      #TRUE if this is the first line of the paragraph
  */
  uint isParagraphStart;

  /**
      #Resolved PangoDirection of line
  */
  uint resolvedDir;
}

/**
    The [pango.types.LogAttr] structure stores information about the attributes of a
    single character.
*/
struct PangoLogAttr
{
  /**
      if set, can break line in front of character
  */
  uint isLineBreak;

  /**
      if set, must break line in front of character
  */
  uint isMandatoryBreak;

  /**
      if set, can break here when doing character wrapping
  */
  uint isCharBreak;

  /**
      is whitespace character
  */
  uint isWhite;

  /**
      if set, cursor can appear in front of character.
        i.e. this is a grapheme boundary, or the first character in the text.
        This flag implements Unicode's
        [Grapheme Cluster Boundaries](http://www.unicode.org/reports/tr29/)
        semantics.
  */
  uint isCursorPosition;

  /**
      is first character in a word
  */
  uint isWordStart;

  /**
      is first non-word char after a word
        Note that in degenerate cases, you could have both @is_word_start
        and @is_word_end set for some character.
  */
  uint isWordEnd;

  /**
      is a sentence boundary.
        There are two ways to divide sentences. The first assigns all
        inter-sentence whitespace/control/format chars to some sentence,
        so all chars are in some sentence; @is_sentence_boundary denotes
        the boundaries there. The second way doesn't assign
        between-sentence spaces, etc. to any sentence, so
        @is_sentence_start/@is_sentence_end mark the boundaries of those sentences.
  */
  uint isSentenceBoundary;

  /**
      is first character in a sentence
  */
  uint isSentenceStart;

  /**
      is first char after a sentence.
        Note that in degenerate cases, you could have both @is_sentence_start
        and @is_sentence_end set for some character. (e.g. no space after a
        period, so the next sentence starts right away)
  */
  uint isSentenceEnd;

  /**
      if set, backspace deletes one character
        rather than the entire grapheme cluster. This field is only meaningful
        on grapheme boundaries (where @is_cursor_position is set). In some languages,
        the full grapheme (e.g. letter + diacritics) is considered a unit, while in
        others, each decomposed character in the grapheme is a unit. In the default
        implementation of `func@break`, this bit is set on all grapheme boundaries
        except those following Latin, Cyrillic or Greek base characters.
  */
  uint backspaceDeletesCharacter;

  /**
      is a whitespace character that can possibly be
        expanded for justification purposes. (Since: 1.18)
  */
  uint isExpandableSpace;

  /**
      is a word boundary, as defined by UAX#29.
        More specifically, means that this is not a position in the middle of a word.
        For example, both sides of a punctuation mark are considered word boundaries.
        This flag is particularly useful when selecting text word-by-word. This flag
        implements Unicode's [Word Boundaries](http://www.unicode.org/reports/tr29/)
        semantics. (Since: 1.22)
  */
  uint isWordBoundary;

  /**
      when breaking lines before this char, insert a hyphen.
        Since: 1.50
  */
  uint breakInsertsHyphen;

  /**
      when breaking lines before this char, remove the
        preceding char. Since 1.50
  */
  uint breakRemovesPreceding;

  /** */
  uint reserved;
}

/**
    A [pango.matrix.Matrix] specifies a transformation between user-space
    and device coordinates.
    
    The transformation is given by
    
    ```
    x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
    y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
    ```
*/
struct PangoMatrix
{
  /**
      1st component of the transformation matrix
  */
  double xx;

  /**
      2nd component of the transformation matrix
  */
  double xy;

  /**
      3rd component of the transformation matrix
  */
  double yx;

  /**
      4th component of the transformation matrix
  */
  double yy;

  /**
      x translation
  */
  double x0;

  /**
      y translation
  */
  double y0;
}

/**
    The [pango.types.Rectangle] structure represents a rectangle.
    
    [pango.types.Rectangle] is frequently used to represent the logical or ink
    extents of a single glyph or section of text. (See, for instance,
    [pango.font.Font.getGlyphExtents].)
*/
struct PangoRectangle
{
  /**
      X coordinate of the left side of the rectangle.
  */
  int x;

  /**
      Y coordinate of the the top side of the rectangle.
  */
  int y;

  /**
      width of the rectangle.
  */
  int width;

  /**
      height of the rectangle.
  */
  int height;
}

/**
    [pango.renderer.Renderer] is a base class for objects that can render text
    provided as [pango.glyph_string.GlyphString] or [pango.layout.Layout].
    
    By subclassing [pango.renderer.Renderer] and overriding operations such as
    @draw_glyphs and @draw_rectangle, renderers for particular font
    backends and destinations can be created.
*/
struct PangoRenderer
{
  /** */
  GObject parentInstance;

  /** */
  PangoUnderline underline;

  /** */
  gboolean strikethrough;

  /** */
  int activeCount;

  /**
      the current transformation matrix for
        the Renderer; may be null, which should be treated the
        same as the identity matrix.
  */
  PangoMatrix* matrix;

  /** */
  PangoRendererPrivate* priv;
}

/**
    Class structure for [pango.renderer.Renderer].
    
    The following vfuncs take user space coordinates in Pango units
    and have default implementations:
    $(LIST
      * draw_glyphs
      * draw_rectangle
      * draw_error_underline
      * draw_shape
      * draw_glyph_item
    )
      
    The default draw_shape implementation draws nothing.
    
    The following vfuncs take device space coordinates as doubles
    and must be implemented:
    $(LIST
      * draw_trapezoid
      * draw_glyph
    )
*/
struct PangoRendererClass
{
  /** */
  GObjectClass parentClass;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoFont* font, PangoGlyphString* glyphs, int x, int y) drawGlyphs;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, int x, int y, int width, int height) drawRectangle;

  /** */
  extern(C) void function(PangoRenderer* renderer, int x, int y, int width, int height) drawErrorUnderline;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoAttrShape* attr, int x, int y) drawShape;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoRenderPart part, double y1, double x11, double x21, double y2, double x12, double x22) drawTrapezoid;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoFont* font, PangoGlyph glyph, double x, double y) drawGlyph;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoRenderPart part) partChanged;

  /** */
  extern(C) void function(PangoRenderer* renderer) begin;

  /** */
  extern(C) void function(PangoRenderer* renderer) end;

  /** */
  extern(C) void function(PangoRenderer* renderer, PangoLayoutRun* run) prepareRun;

  /** */
  extern(C) void function(PangoRenderer* renderer, const(char)* text, PangoGlyphItem* glyphItem, int x, int y) drawGlyphItem;

  /** */
  extern(C) void function() PangoReserved2;

  /** */
  extern(C) void function() PangoReserved3;

  /** */
  extern(C) void function() PangoReserved4;
}

/** */
struct PangoRendererPrivate;

/**
    A [pango.script_iter.ScriptIter] is used to iterate through a string
    and identify ranges in different scripts.
*/
struct PangoScriptIter;

/**
    A [pango.tab_array.TabArray] contains an array of tab stops.
    
    [pango.tab_array.TabArray] can be used to set tab stops in a [pango.layout.Layout].
    Each tab stop has an alignment, a position, and optionally
    a character to use as decimal point.
*/
struct PangoTabArray;

alias extern(C) void* function(const(void)* userData) PangoAttrDataCopyFunc;

alias extern(C) gboolean function(PangoAttribute* attribute, void* userData) PangoAttrFilterFunc;

alias extern(C) gboolean function(PangoFontset* fontset, PangoFont* font, void* userData) PangoFontsetForeachFunc;

