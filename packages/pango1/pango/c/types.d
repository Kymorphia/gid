module pango.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import gio.c.types;
public import harfbuzz.c.types;
public import cairo.c.types;

/**
    A [pango.types.GLYPH_UNKNOWN_FLAG] represents a single glyph in the output form of a string.
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
  left = 0,

  /**
      Center the line within the available space
  */
  center = 1,

  /**
      Put all available space on the left
  */
  right = 2,
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
  invalid = 0,

  /**
      language ([pango.attr_language.AttrLanguage])
  */
  language = 1,

  /**
      font family name list ([pango.attr_string.AttrString])
  */
  family = 2,

  /**
      font slant style ([pango.attr_int.AttrInt])
  */
  style = 3,

  /**
      font weight ([pango.attr_int.AttrInt])
  */
  weight = 4,

  /**
      font variant (normal or small caps) ([pango.attr_int.AttrInt])
  */
  variant = 5,

  /**
      font stretch ([pango.attr_int.AttrInt])
  */
  stretch = 6,

  /**
      font size in points scaled by `PANGO_SCALE` ([pango.attr_int.AttrInt])
  */
  size = 7,

  /**
      font description ([pango.attr_font_desc.AttrFontDesc])
  */
  fontDesc = 8,

  /**
      foreground color ([pango.attr_color.AttrColor])
  */
  foreground = 9,

  /**
      background color ([pango.attr_color.AttrColor])
  */
  background = 10,

  /**
      whether the text has an underline ([pango.attr_int.AttrInt])
  */
  underline = 11,

  /**
      whether the text is struck-through ([pango.attr_int.AttrInt])
  */
  strikethrough = 12,

  /**
      baseline displacement ([pango.attr_int.AttrInt])
  */
  rise = 13,

  /**
      shape ([pango.attr_shape.AttrShape])
  */
  shape = 14,

  /**
      font size scale factor ([pango.attr_float.AttrFloat])
  */
  scale = 15,

  /**
      whether fallback is enabled ([pango.attr_int.AttrInt])
  */
  fallback = 16,

  /**
      letter spacing (`struct@PangoAttrInt`)
  */
  letterSpacing = 17,

  /**
      underline color ([pango.attr_color.AttrColor])
  */
  underlineColor = 18,

  /**
      strikethrough color ([pango.attr_color.AttrColor])
  */
  strikethroughColor = 19,

  /**
      font size in pixels scaled by `PANGO_SCALE` ([pango.attr_int.AttrInt])
  */
  absoluteSize = 20,

  /**
      base text gravity ([pango.attr_int.AttrInt])
  */
  gravity = 21,

  /**
      gravity hint ([pango.attr_int.AttrInt])
  */
  gravityHint = 22,

  /**
      OpenType font features ([pango.attr_font_features.AttrFontFeatures]). Since 1.38
  */
  fontFeatures = 23,

  /**
      foreground alpha ([pango.attr_int.AttrInt]). Since 1.38
  */
  foregroundAlpha = 24,

  /**
      background alpha ([pango.attr_int.AttrInt]). Since 1.38
  */
  backgroundAlpha = 25,

  /**
      whether breaks are allowed ([pango.attr_int.AttrInt]). Since 1.44
  */
  allowBreaks = 26,

  /**
      how to render invisible characters ([pango.attr_int.AttrInt]). Since 1.44
  */
  show = 27,

  /**
      whether to insert hyphens at intra-word line breaks ([pango.attr_int.AttrInt]). Since 1.44
  */
  insertHyphens = 28,

  /**
      whether the text has an overline ([pango.attr_int.AttrInt]). Since 1.46
  */
  overline = 29,

  /**
      overline color ([pango.attr_color.AttrColor]). Since 1.46
  */
  overlineColor = 30,

  /**
      line height factor ([pango.attr_float.AttrFloat]). Since: 1.50
  */
  lineHeight = 31,

  /**
      line height ([pango.attr_int.AttrInt]). Since: 1.50
  */
  absoluteLineHeight = 32,

  /** */
  textTransform = 33,

  /**
      override segmentation to classify the range of the attribute as a single word ([pango.attr_int.AttrInt]). Since 1.50
  */
  word = 34,

  /**
      override segmentation to classify the range of the attribute as a single sentence ([pango.attr_int.AttrInt]). Since 1.50
  */
  sentence = 35,

  /**
      baseline displacement ([pango.attr_int.AttrInt]). Since 1.50
  */
  baselineShift = 36,

  /**
      font-relative size change ([pango.attr_int.AttrInt]). Since 1.50
  */
  fontScale = 37,
}

/**
    An enumeration that affects baseline shifts between runs.
*/
enum PangoBaselineShift
{
  /**
      Leave the baseline unchanged
  */
  none = 0,

  /**
      Shift the baseline to the superscript position,
      relative to the previous run
  */
  superscript = 1,

  /**
      Shift the baseline to the subscript position,
      relative to the previous run
  */
  subscript = 2,
}

/**
    [pango.types.BidiType] represents the bidirectional character
  type of a Unicode character.
  
  The values in this enumeration are specified by the
  [Unicode bidirectional algorithm](http://www.unicode.org/reports/tr9/).

  Deprecated:     Use fribidi for this information
*/
enum PangoBidiType
{
  /**
      Left-to-Right
  */
  l = 0,

  /**
      Left-to-Right Embedding
  */
  lre = 1,

  /**
      Left-to-Right Override
  */
  lro = 2,

  /**
      Right-to-Left
  */
  r = 3,

  /**
      Right-to-Left Arabic
  */
  al = 4,

  /**
      Right-to-Left Embedding
  */
  rle = 5,

  /**
      Right-to-Left Override
  */
  rlo = 6,

  /**
      Pop Directional Format
  */
  pdf = 7,

  /**
      European Number
  */
  en = 8,

  /**
      European Number Separator
  */
  es = 9,

  /**
      European Number Terminator
  */
  et = 10,

  /**
      Arabic Number
  */
  an = 11,

  /**
      Common Number Separator
  */
  cs = 12,

  /**
      Nonspacing Mark
  */
  nsm = 13,

  /**
      Boundary Neutral
  */
  bn = 14,

  /**
      Paragraph Separator
  */
  b = 15,

  /**
      Segment Separator
  */
  s = 16,

  /**
      Whitespace
  */
  ws = 17,

  /**
      Other Neutrals
  */
  on = 18,

  /**
      Left-to-Right isolate. Since 1.48.6
  */
  lri = 19,

  /**
      Right-to-Left isolate. Since 1.48.6
  */
  rli = 20,

  /**
      First strong isolate. Since 1.48.6
  */
  fsi = 21,

  /**
      Pop directional isolate. Since 1.48.6
  */
  pdi = 22,
}

/**
    [pango.types.CoverageLevel] is used to indicate how well a font can
  represent a particular Unicode character for a particular script.
  
  Since 1.44, only [pango.types.CoverageLevel.none] and [pango.types.CoverageLevel.exact]
  will be returned.
*/
enum PangoCoverageLevel
{
  /**
      The character is not representable with
      the font.
  */
  none = 0,

  /**
      The character is represented in a
      way that may be comprehensible but is not the correct
      graphical form. For instance, a Hangul character represented
      as a a sequence of Jamos, or a Latin transliteration of a
      Cyrillic word.
  */
  fallback = 1,

  /**
      The character is represented as
      basically the correct graphical form, but with a stylistic
      variant inappropriate for the current script.
  */
  approximate = 2,

  /**
      The character is represented as the
      correct graphical form.
  */
  exact = 3,
}

/**
    [pango.types.Direction] represents a direction in the Unicode bidirectional
  algorithm.
  
  Not every value in this enumeration makes sense for every usage of
  [pango.types.Direction]; for example, the return value of `func@unichar_direction`
  and `func@find_base_dir` cannot be [pango.types.Direction.weakLtr] or
  [pango.types.Direction.weakRtl], since every character is either neutral
  or has a strong direction; on the other hand [pango.types.Direction.neutral]
  doesn't make sense to pass to `func@itemize_with_base_dir`.
  
  The [pango.types.Direction.ttbLtr], [pango.types.Direction.ttbRtl] values come from
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
  ltr = 0,

  /**
      A strong right-to-left direction
  */
  rtl = 1,

  /**
      Deprecated value; treated the
      same as [pango.types.Direction.rtl].
  */
  ttbLtr = 2,

  /**
      Deprecated value; treated the
      same as [pango.types.Direction.ltr]
  */
  ttbRtl = 3,

  /**
      A weak left-to-right direction
  */
  weakLtr = 4,

  /**
      A weak right-to-left direction
  */
  weakRtl = 5,

  /**
      No direction specified
  */
  neutral = 6,
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
  none = 0,

  /**
      Omit characters at the start of the text
  */
  start = 1,

  /**
      Omit characters in the middle of the text
  */
  middle = 2,

  /**
      Omit characters at the end of the text
  */
  end = 3,
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
  family = 1,

  /**
      the font style is specified.
  */
  style = 2,

  /**
      the font variant is specified.
  */
  variant = 4,

  /**
      the font weight is specified.
  */
  weight = 8,

  /**
      the font stretch is specified.
  */
  stretch = 16,

  /**
      the font size is specified.
  */
  size = 32,

  /**
      the font gravity is specified (Since: 1.16.)
  */
  gravity = 64,

  /**
      OpenType font variations are specified (Since: 1.42)
  */
  variations = 128,
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
  none = 0,

  /**
      Change the font to a size suitable for superscripts
  */
  superscript = 1,

  /**
      Change the font to a size suitable for subscripts
  */
  subscript = 2,

  /**
      Change the font to a size suitable for Small Caps
  */
  smallCaps = 3,
}

/**
    [pango.types.Gravity] represents the orientation of glyphs in a segment
  of text.
  
  This is useful when rendering vertical text layouts. In those situations,
  the layout is rotated using a non-identity [pango.matrix.Matrix], and then
  glyph orientation is controlled using [pango.types.Gravity].
  
  Not every value in this enumeration makes sense for every usage of
  [pango.types.Gravity]; for example, [pango.types.Gravity.auto_] only can be passed to
  [pango.context.Context.setBaseGravity] and can only be returned by
  [pango.context.Context.getBaseGravity].
  
  See also: [pango.types.GravityHint]
*/
enum PangoGravity
{
  /**
      Glyphs stand upright (default) <img align="right" valign="center" src="m-south.png">
  */
  south = 0,

  /**
      Glyphs are rotated 90 degrees counter-clockwise. <img align="right" valign="center" src="m-east.png">
  */
  east = 1,

  /**
      Glyphs are upside-down. <img align="right" valign="cener" src="m-north.png">
  */
  north = 2,

  /**
      Glyphs are rotated 90 degrees clockwise. <img align="right" valign="center" src="m-west.png">
  */
  west = 3,

  /**
      Gravity is resolved from the context matrix
  */
  auto_ = 4,
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
  natural = 0,

  /**
      always use the base gravity set, regardless of
      the script.
  */
  strong = 1,

  /**
      for scripts not in their natural direction (eg.
      Latin in East gravity), choose per-script gravity such that every script
      respects the line progression. This means, Latin and Arabic will take
      opposite gravities and both flow top-to-bottom for example.
  */
  line = 2,
}

/**
    Errors that can be returned by [pango.layout.Layout.deserialize].
*/
enum PangoLayoutDeserializeError
{
  /**
      Unspecified error
  */
  invalid = 0,

  /**
      A JSon value could not be
      interpreted
  */
  invalidValue = 1,

  /**
      A required JSon member was
      not found
  */
  missingValue = 2,
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
  default_ = 0,

  /**
      Apply context information
      from the serialization to the [pango.context.Context]
  */
  context = 1,
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
  default_ = 0,

  /**
      Include context information
  */
  context = 1,

  /**
      Include information about the formatted output
  */
  output = 2,
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
  none = 0,

  /**
      Draw a single line above the ink
      extents of the text being underlined.
  */
  single = 1,
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
  foreground = 0,

  /**
      the area behind the text
  */
  background = 1,

  /**
      underlines
  */
  underline = 2,

  /**
      strikethrough lines
  */
  strikethrough = 3,

  /**
      overlines
  */
  overline = 4,
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
  invalidCode = -1,

  /**
      a character used by multiple different scripts
  */
  common = 0,

  /**
      a mark glyph that takes its script from the
    base glyph to which it is attached
  */
  inherited = 1,

  /**
      Arabic
  */
  arabic = 2,

  /**
      Armenian
  */
  armenian = 3,

  /**
      Bengali
  */
  bengali = 4,

  /**
      Bopomofo
  */
  bopomofo = 5,

  /**
      Cherokee
  */
  cherokee = 6,

  /**
      Coptic
  */
  coptic = 7,

  /**
      Cyrillic
  */
  cyrillic = 8,

  /**
      Deseret
  */
  deseret = 9,

  /**
      Devanagari
  */
  devanagari = 10,

  /**
      Ethiopic
  */
  ethiopic = 11,

  /**
      Georgian
  */
  georgian = 12,

  /**
      Gothic
  */
  gothic = 13,

  /**
      Greek
  */
  greek = 14,

  /**
      Gujarati
  */
  gujarati = 15,

  /**
      Gurmukhi
  */
  gurmukhi = 16,

  /**
      Han
  */
  han = 17,

  /**
      Hangul
  */
  hangul = 18,

  /**
      Hebrew
  */
  hebrew = 19,

  /**
      Hiragana
  */
  hiragana = 20,

  /**
      Kannada
  */
  kannada = 21,

  /**
      Katakana
  */
  katakana = 22,

  /**
      Khmer
  */
  khmer = 23,

  /**
      Lao
  */
  lao = 24,

  /**
      Latin
  */
  latin = 25,

  /**
      Malayalam
  */
  malayalam = 26,

  /**
      Mongolian
  */
  mongolian = 27,

  /**
      Myanmar
  */
  myanmar = 28,

  /**
      Ogham
  */
  ogham = 29,

  /**
      Old Italic
  */
  oldItalic = 30,

  /**
      Oriya
  */
  oriya = 31,

  /**
      Runic
  */
  runic = 32,

  /**
      Sinhala
  */
  sinhala = 33,

  /**
      Syriac
  */
  syriac = 34,

  /**
      Tamil
  */
  tamil = 35,

  /**
      Telugu
  */
  telugu = 36,

  /**
      Thaana
  */
  thaana = 37,

  /**
      Thai
  */
  thai = 38,

  /**
      Tibetan
  */
  tibetan = 39,

  /**
      Canadian Aboriginal
  */
  canadianAboriginal = 40,

  /**
      Yi
  */
  yi = 41,

  /**
      Tagalog
  */
  tagalog = 42,

  /**
      Hanunoo
  */
  hanunoo = 43,

  /**
      Buhid
  */
  buhid = 44,

  /**
      Tagbanwa
  */
  tagbanwa = 45,

  /**
      Braille
  */
  braille = 46,

  /**
      Cypriot
  */
  cypriot = 47,

  /**
      Limbu
  */
  limbu = 48,

  /**
      Osmanya
  */
  osmanya = 49,

  /**
      Shavian
  */
  shavian = 50,

  /**
      Linear B
  */
  linearB = 51,

  /**
      Tai Le
  */
  taiLe = 52,

  /**
      Ugaritic
  */
  ugaritic = 53,

  /**
      New Tai Lue. Since 1.10
  */
  newTaiLue = 54,

  /**
      Buginese. Since 1.10
  */
  buginese = 55,

  /**
      Glagolitic. Since 1.10
  */
  glagolitic = 56,

  /**
      Tifinagh. Since 1.10
  */
  tifinagh = 57,

  /**
      Syloti Nagri. Since 1.10
  */
  sylotiNagri = 58,

  /**
      Old Persian. Since 1.10
  */
  oldPersian = 59,

  /**
      Kharoshthi. Since 1.10
  */
  kharoshthi = 60,

  /**
      an unassigned code point. Since 1.14
  */
  unknown = 61,

  /**
      Balinese. Since 1.14
  */
  balinese = 62,

  /**
      Cuneiform. Since 1.14
  */
  cuneiform = 63,

  /**
      Phoenician. Since 1.14
  */
  phoenician = 64,

  /**
      Phags-pa. Since 1.14
  */
  phagsPa = 65,

  /**
      N'Ko. Since 1.14
  */
  nko = 66,

  /**
      Kayah Li. Since 1.20.1
  */
  kayahLi = 67,

  /**
      Lepcha. Since 1.20.1
  */
  lepcha = 68,

  /**
      Rejang. Since 1.20.1
  */
  rejang = 69,

  /**
      Sundanese. Since 1.20.1
  */
  sundanese = 70,

  /**
      Saurashtra. Since 1.20.1
  */
  saurashtra = 71,

  /**
      Cham. Since 1.20.1
  */
  cham = 72,

  /**
      Ol Chiki. Since 1.20.1
  */
  olChiki = 73,

  /**
      Vai. Since 1.20.1
  */
  vai = 74,

  /**
      Carian. Since 1.20.1
  */
  carian = 75,

  /**
      Lycian. Since 1.20.1
  */
  lycian = 76,

  /**
      Lydian. Since 1.20.1
  */
  lydian = 77,

  /**
      Batak. Since 1.32
  */
  batak = 78,

  /**
      Brahmi. Since 1.32
  */
  brahmi = 79,

  /**
      Mandaic. Since 1.32
  */
  mandaic = 80,

  /**
      Chakma. Since: 1.32
  */
  chakma = 81,

  /**
      Meroitic Cursive. Since: 1.32
  */
  meroiticCursive = 82,

  /**
      Meroitic Hieroglyphs. Since: 1.32
  */
  meroiticHieroglyphs = 83,

  /**
      Miao. Since: 1.32
  */
  miao = 84,

  /**
      Sharada. Since: 1.32
  */
  sharada = 85,

  /**
      Sora Sompeng. Since: 1.32
  */
  soraSompeng = 86,

  /**
      Takri. Since: 1.32
  */
  takri = 87,

  /**
      Bassa. Since: 1.40
  */
  bassaVah = 88,

  /**
      Caucasian Albanian. Since: 1.40
  */
  caucasianAlbanian = 89,

  /**
      Duployan. Since: 1.40
  */
  duployan = 90,

  /**
      Elbasan. Since: 1.40
  */
  elbasan = 91,

  /**
      Grantha. Since: 1.40
  */
  grantha = 92,

  /**
      Kjohki. Since: 1.40
  */
  khojki = 93,

  /**
      Khudawadi, Sindhi. Since: 1.40
  */
  khudawadi = 94,

  /**
      Linear A. Since: 1.40
  */
  linearA = 95,

  /**
      Mahajani. Since: 1.40
  */
  mahajani = 96,

  /**
      Manichaean. Since: 1.40
  */
  manichaean = 97,

  /**
      Mende Kikakui. Since: 1.40
  */
  mendeKikakui = 98,

  /**
      Modi. Since: 1.40
  */
  modi = 99,

  /**
      Mro. Since: 1.40
  */
  mro = 100,

  /**
      Nabataean. Since: 1.40
  */
  nabataean = 101,

  /**
      Old North Arabian. Since: 1.40
  */
  oldNorthArabian = 102,

  /**
      Old Permic. Since: 1.40
  */
  oldPermic = 103,

  /**
      Pahawh Hmong. Since: 1.40
  */
  pahawhHmong = 104,

  /**
      Palmyrene. Since: 1.40
  */
  palmyrene = 105,

  /**
      Pau Cin Hau. Since: 1.40
  */
  pauCinHau = 106,

  /**
      Psalter Pahlavi. Since: 1.40
  */
  psalterPahlavi = 107,

  /**
      Siddham. Since: 1.40
  */
  siddham = 108,

  /**
      Tirhuta. Since: 1.40
  */
  tirhuta = 109,

  /**
      Warang Citi. Since: 1.40
  */
  warangCiti = 110,

  /**
      Ahom. Since: 1.40
  */
  ahom = 111,

  /**
      Anatolian Hieroglyphs. Since: 1.40
  */
  anatolianHieroglyphs = 112,

  /**
      Hatran. Since: 1.40
  */
  hatran = 113,

  /**
      Multani. Since: 1.40
  */
  multani = 114,

  /**
      Old Hungarian. Since: 1.40
  */
  oldHungarian = 115,

  /**
      Signwriting. Since: 1.40
  */
  signwriting = 116,
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
  none = 0,

  /**
      Round glyph positions and widths to whole device units
      This option should be set if the target renderer can't do subpixel positioning of glyphs
  */
  roundPositions = 1,
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
  none = 0,

  /**
      Render spaces, tabs and newlines visibly
  */
  spaces = 1,

  /**
      Render line breaks visibly
  */
  lineBreaks = 2,

  /**
      Render default-ignorable Unicode
      characters visibly
  */
  ignorables = 4,
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
  ultraCondensed = 0,

  /**
      extra condensed width
  */
  extraCondensed = 1,

  /**
      condensed width
  */
  condensed = 2,

  /**
      semi condensed width
  */
  semiCondensed = 3,

  /**
      the normal width
  */
  normal = 4,

  /**
      semi expanded width
  */
  semiExpanded = 5,

  /**
      expanded width
  */
  expanded = 6,

  /**
      extra expanded width
  */
  extraExpanded = 7,

  /**
      ultra expanded width
  */
  ultraExpanded = 8,
}

/**
    An enumeration specifying the various slant styles possible for a font.
*/
enum PangoStyle
{
  /**
      the font is upright.
  */
  normal = 0,

  /**
      the font is slanted, but in a roman style.
  */
  oblique = 1,

  /**
      the font is slanted in an italic style.
  */
  italic = 2,
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
  left = 0,

  /**
      the text appears to the left of the tab stop position
      until the available space is filled. Since: 1.50
  */
  right = 1,

  /**
      the text is centered at the tab stop position
      until the available space is filled. Since: 1.50
  */
  center = 2,

  /**
      text before the first occurrence of the decimal point
      character appears to the left of the tab stop position (until the available
      space is filled), the rest to the right. Since: 1.50
  */
  decimal = 3,
}

/**
    An enumeration that affects how Pango treats characters during shaping.
*/
enum PangoTextTransform
{
  /**
      Leave text unchanged
  */
  none = 0,

  /**
      Display letters and numbers as lowercase
  */
  lowercase = 1,

  /**
      Display letters and numbers as uppercase
  */
  uppercase = 2,

  /**
      Display the first character of a word
      in titlecase
  */
  capitalize = 3,
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
  none = 0,

  /**
      a single underline should be drawn
  */
  single = 1,

  /**
      a double underline should be drawn
  */
  double_ = 2,

  /**
      a single underline should be drawn at a
      position beneath the ink extents of the text being
      underlined. This should be used only for underlining
      single characters, such as for keyboard accelerators.
      [pango.types.Underline.single] should be used for extended
      portions of text.
  */
  low = 3,

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
  error = 4,

  /**
      Like @PANGO_UNDERLINE_SINGLE, but
      drawn continuously across multiple runs. This type
      of underlining is available since Pango 1.46.
  */
  singleLine = 5,

  /**
      Like @PANGO_UNDERLINE_DOUBLE, but
      drawn continuously across multiple runs. This type
      of underlining is available since Pango 1.46.
  */
  doubleLine = 6,

  /**
      Like @PANGO_UNDERLINE_ERROR, but
      drawn continuously across multiple runs. This type
      of underlining is available since Pango 1.46.
  */
  errorLine = 7,
}

/**
    An enumeration specifying capitalization variant of the font.
*/
enum PangoVariant
{
  /**
      A normal font.
  */
  normal = 0,

  /**
      A font with the lower case characters
      replaced by smaller variants of the capital characters.
  */
  smallCaps = 1,

  /**
      A font with all characters
      replaced by smaller variants of the capital characters. Since: 1.50
  */
  allSmallCaps = 2,

  /**
      A font with the lower case characters
      replaced by smaller variants of the capital characters.
      Petite Caps can be even smaller than Small Caps. Since: 1.50
  */
  petiteCaps = 3,

  /**
      A font with all characters
      replaced by smaller variants of the capital characters.
      Petite Caps can be even smaller than Small Caps. Since: 1.50
  */
  allPetiteCaps = 4,

  /**
      A font with the upper case characters
      replaced by smaller variants of the capital letters. Since: 1.50
  */
  unicase = 5,

  /**
      A font with capital letters that
      are more suitable for all-uppercase titles. Since: 1.50
  */
  titleCaps = 6,
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
  thin = 100,

  /**
      the ultralight weight (= 200)
  */
  ultralight = 200,

  /**
      the light weight (= 300)
  */
  light = 300,

  /**
      the semilight weight (= 350) Since: 1.36.7
  */
  semilight = 350,

  /**
      the book weight (= 380) Since: 1.24)
  */
  book = 380,

  /**
      the default weight (= 400)
  */
  normal = 400,

  /**
      the medium weight (= 500) Since: 1.24
  */
  medium = 500,

  /**
      the semibold weight (= 600)
  */
  semibold = 600,

  /**
      the bold weight (= 700)
  */
  bold = 700,

  /**
      the ultrabold weight (= 800)
  */
  ultrabold = 800,

  /**
      the heavy weight (= 900)
  */
  heavy = 900,

  /**
      the ultraheavy weight (= 1000) Since: 1.24
  */
  ultraheavy = 1000,
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
  word = 0,

  /**
      wrap lines at character boundaries.
  */
  char_ = 1,

  /**
      wrap lines at word boundaries, but fall back to
      character boundaries if there is not enough space for a full word.
  */
  wordChar = 2,
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
  extern(C) bool function(const(PangoAttribute)* attr1, const(PangoAttribute)* attr2) equal;
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
      size of font, in units of 1/`PANGO_SCALE` of a point (for
      [pango.types.AttrType.size]) or of a device unit (for [pango.types.AttrType.absoluteSize])
  */
  int size;

  /**
      whether the font size is in device units or points.
      This field is only present for compatibility with Pango-1.8.0
      ([pango.types.AttrType.absoluteSize] was added in 1.8.1); and always will
      be false for [pango.types.AttrType.size] and true for [pango.types.AttrType.absoluteSize].
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
  ObjectC parentInstance;
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
  ObjectC parentInstance;
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
  extern(C) bool function(PangoFontFace* face) isSynthesized;

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
  ObjectC parentInstance;
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
  extern(C) bool function(PangoFontFamily* family) isMonospace;

  /** */
  extern(C) bool function(PangoFontFamily* family) isVariable;

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
  ObjectC parentInstance;
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
  ObjectC parentInstance;
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
  ObjectC parentInstance;

  /** */
  PangoUnderline underline;

  /** */
  bool strikethrough;

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

alias extern(C) bool function(PangoAttribute* attribute, void* userData) PangoAttrFilterFunc;

alias extern(C) bool function(PangoFontset* fontset, PangoFont* font, void* userData) PangoFontsetForeachFunc;

