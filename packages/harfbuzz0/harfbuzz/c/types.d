/// C types for harfbuzz0 library
module harfbuzz.c.types;

public import gid.basictypes;
public import gobject.c.types;
public import freetype2.c.types;

/**
    Data type for booleans.
*/
alias hb_bool_t = int;

/**
    Data type for holding Unicode codepoints. Also
    used to hold glyph IDs.
*/
alias hb_codepoint_t = uint;

/**
    Data type for holding color values. Colors are eight bits per
    channel RGB plus alpha transparency.
*/
alias hb_color_t = uint;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the extents for a font, for horizontal-direction
    text segments. Extents must be returned in an #hb_glyph_extents output
    parameter.
*/
alias hb_font_get_font_h_extents_func_t = hb_font_get_font_extents_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the extents for a font, for vertical-direction
    text segments. Extents must be returned in an #hb_glyph_extents output
    parameter.
*/
alias hb_font_get_font_v_extents_func_t = hb_font_get_font_extents_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the advance for a specified glyph, in
    horizontal-direction text segments. Advances must be returned in
    an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_h_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the advances for a sequence of glyphs, in
    horizontal-direction text segments.
*/
alias hb_font_get_glyph_h_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the kerning-adjustment value for a glyph-pair in
    the specified font, for horizontal text segments.
*/
alias hb_font_get_glyph_h_kerning_func_t = hb_font_get_glyph_kerning_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the (X,Y) coordinates (in font units) of the
    origin for a glyph, for horizontal-direction text segments. Each
    coordinate must be returned in an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_h_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the advance for a specified glyph, in
    vertical-direction text segments. Advances must be returned in
    an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_v_advance_func_t = hb_font_get_glyph_advance_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the advances for a sequence of glyphs, in
    vertical-direction text segments.
*/
alias hb_font_get_glyph_v_advances_func_t = hb_font_get_glyph_advances_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the kerning-adjustment value for a glyph-pair in
    the specified font, for vertical text segments.
*/
alias hb_font_get_glyph_v_kerning_func_t = hb_font_get_glyph_kerning_func_t;

/**
    A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
    
    This method should retrieve the (X,Y) coordinates (in font units) of the
    origin for a glyph, for vertical-direction text segments. Each coordinate
    must be returned in an #hb_position_t output parameter.
*/
alias hb_font_get_glyph_v_origin_func_t = hb_font_get_glyph_origin_func_t;

/**
    Data type for bitmasks.
*/
alias hb_mask_t = uint;

/**
    An integral type representing an OpenType 'name' table name identifier.
    There are predefined name IDs, as well as name IDs return from other
    API.  These can be used to fetch name strings from a font face.
*/
alias hb_ot_name_id_t = uint;

/**
    Data type for holding a single coordinate value.
    Contour points and other multi-dimensional data are
    stored as tuples of #hb_position_t's.
*/
alias hb_position_t = int;

/**
    Data type for tag identifiers. Tags are four
    byte integers, each byte representing a character.
    
    Tags are used to identify tables, design-variation axes,
    scripts, languages, font features, and baselines with
    human-readable names.
*/
alias hb_tag_t = uint;

/**
    The selectors defined for specifying AAT feature settings.
*/
enum hb_aat_layout_feature_selector_t
{
  /**
      Initial, unset feature selector
  */
  Invalid = 65535,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
  */
  AllTypeFeaturesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
  */
  AllTypeFeaturesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RequiredLigaturesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RequiredLigaturesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  CommonLigaturesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  CommonLigaturesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RareLigaturesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RareLigaturesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  LogosOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  LogosOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RebusPicturesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  RebusPicturesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  DiphthongLigaturesOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  DiphthongLigaturesOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SquaredLigaturesOn = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SquaredLigaturesOff = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  AbbrevSquaredLigaturesOn = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  AbbrevSquaredLigaturesOff = 15,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SymbolLigaturesOn = 16,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  SymbolLigaturesOff = 17,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  ContextualLigaturesOn = 18,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  ContextualLigaturesOff = 19,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  HistoricalLigaturesOn = 20,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  HistoricalLigaturesOff = 21,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  Unconnected = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  PartiallyConnected = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
  */
  Cursive = 2,

  /**
      Deprecated
  */
  UpperAndLowerCase = 0,

  /**
      Deprecated
  */
  AllCaps = 1,

  /**
      Deprecated
  */
  AllLowerCase = 2,

  /**
      Deprecated
  */
  SmallCaps = 3,

  /**
      Deprecated
  */
  InitialCaps = 4,

  /**
      Deprecated
  */
  InitialCapsAndSmallCaps = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
  */
  SubstituteVerticalFormsOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
  */
  SubstituteVerticalFormsOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
  */
  LinguisticRearrangementOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
  */
  LinguisticRearrangementOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  MonospacedNumbers = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  ProportionalNumbers = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  ThirdWidthNumbers = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
  */
  QuarterWidthNumbers = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordInitialSwashesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordInitialSwashesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordFinalSwashesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  WordFinalSwashesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineInitialSwashesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineInitialSwashesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineFinalSwashesOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  LineFinalSwashesOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  NonFinalSwashesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
  */
  NonFinalSwashesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  ShowDiacritics = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  HideDiacritics = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
  */
  DecomposeDiacritics = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  NormalPosition = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  Superiors = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  Inferiors = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  Ordinals = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
  */
  ScientificInferiors = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  NoFractions = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  VerticalFractions = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
  */
  DiagonalFractions = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
  */
  PreventOverlapOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
  */
  PreventOverlapOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphensToEmDashOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphensToEmDashOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphenToEnDashOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  HyphenToEnDashOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SlashedZeroOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SlashedZeroOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  FormInterrobangOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  FormInterrobangOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SmartQuotesOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  SmartQuotesOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  PeriodsToEllipsisOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
  */
  PeriodsToEllipsisOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  HyphenToMinusOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  HyphenToMinusOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  AsteriskToMultiplyOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  AsteriskToMultiplyOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  SlashToDivideOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  SlashToDivideOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  InequalityLigaturesOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  InequalityLigaturesOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  ExponentsOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  ExponentsOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  MathematicalGreekOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
  */
  MathematicalGreekOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  NoOrnaments = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  Dingbats = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  PiCharacters = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  Fleurons = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  DecorativeBorders = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  InternationalSymbols = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
  */
  MathSymbols = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_ALTERNATIVES
  */
  NoAlternates = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel1 = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel2 = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel3 = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel4 = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
  */
  DesignLevel5 = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  NoStyleOptions = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  DisplayText = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  EngravedText = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  IlluminatedCaps = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  TitlingCaps = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
  */
  TallCaps = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalCharacters = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  SimplifiedCharacters = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis1978Characters = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis1983Characters = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis1990Characters = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltOne = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltTwo = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltThree = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltFour = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalAltFive = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  ExpertCharacters = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Jis2004Characters = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  HojoCharacters = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  Nlccharacters = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
  */
  TraditionalNamesCharacters = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
  */
  LowerCaseNumbers = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
  */
  UpperCaseNumbers = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  ProportionalText = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  MonospacedText = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  HalfWidthText = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  ThirdWidthText = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  QuarterWidthText = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  AltProportionalText = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
  */
  AltHalfWidthText = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  NoTransliteration = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangul = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HiraganaToKatakana = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  KatakanaToHiragana = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  KanaToRomanization = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  RomanizationToHiragana = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  RomanizationToKatakana = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangulAltOne = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangulAltTwo = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
  */
  HanjaToHangulAltThree = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  NoAnnotation = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  BoxAnnotation = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  RoundedBoxAnnotation = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  CircleAnnotation = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  InvertedCircleAnnotation = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  ParenthesisAnnotation = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  PeriodAnnotation = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  RomanNumeralAnnotation = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  DiamondAnnotation = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  InvertedBoxAnnotation = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
  */
  InvertedRoundedBoxAnnotation = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
  */
  FullWidthKana = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
  */
  ProportionalKana = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  FullWidthIdeographs = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  ProportionalIdeographs = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
  */
  HalfWidthIdeographs = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CanonicalCompositionOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CanonicalCompositionOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CompatibilityCompositionOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  CompatibilityCompositionOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  TranscodingCompositionOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
  */
  TranscodingCompositionOff = 5,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_OFF instead
  */
  NoRubyKana = 0,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_ON instead
  */
  RubyKana = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
  */
  RubyKanaOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
  */
  RubyKanaOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  NoCjkSymbolAlternatives = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltOne = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltTwo = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltThree = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltFour = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
  */
  CjkSymbolAltFive = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  NoIdeographicAlternatives = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltOne = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltTwo = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltThree = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltFour = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
  */
  IdeographicAltFive = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
  */
  CjkVerticalRomanCentered = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
  */
  CjkVerticalRomanHbaseline = 1,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_OFF instead
  */
  NoCjkItalicRoman = 0,

  /**
      Deprecated; use #HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_ON instead
  */
  CjkItalicRoman = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
  */
  CjkItalicRomanOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
  */
  CjkItalicRomanOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveLayoutOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveLayoutOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveSpacingOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
  */
  CaseSensitiveSpacingOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateHorizKanaOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateHorizKanaOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateVertKanaOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
  */
  AlternateVertKanaOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  NoStylisticAlternates = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltOneOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltOneOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwoOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwoOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThreeOn = 6,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThreeOff = 7,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourOn = 8,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourOff = 9,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFiveOn = 10,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFiveOff = 11,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixOn = 12,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixOff = 13,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSevenOn = 14,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSevenOff = 15,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEightOn = 16,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEightOff = 17,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineOn = 18,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineOff = 19,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTenOn = 20,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTenOff = 21,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltElevenOn = 22,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltElevenOff = 23,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwelveOn = 24,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwelveOff = 25,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThirteenOn = 26,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltThirteenOff = 27,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourteenOn = 28,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFourteenOff = 29,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFifteenOn = 30,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltFifteenOff = 31,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixteenOn = 32,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSixteenOff = 33,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSeventeenOn = 34,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltSeventeenOff = 35,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEighteenOn = 36,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltEighteenOff = 37,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineteenOn = 38,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltNineteenOff = 39,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwentyOn = 40,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
  */
  StylisticAltTwentyOff = 41,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualAlternatesOn = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualAlternatesOff = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  SwashAlternatesOn = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  SwashAlternatesOff = 3,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualSwashAlternatesOn = 4,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
  */
  ContextualSwashAlternatesOff = 5,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  DefaultLowerCase = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  LowerCaseSmallCaps = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
  */
  LowerCasePetiteCaps = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  DefaultUpperCase = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  UpperCaseSmallCaps = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
  */
  UpperCasePetiteCaps = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  HalfWidthCjkRoman = 0,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  ProportionalCjkRoman = 1,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  DefaultCjkRoman = 2,

  /**
      for #HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
  */
  FullWidthCjkRoman = 3,
}

/**
    The possible feature types defined for AAT shaping, from Apple [Font Feature Registry](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html).
*/
enum hb_aat_layout_feature_type_t
{
  /**
      Initial, unset feature type
  */
  Invalid = 65535,

  /**
      [All Typographic Features](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type0)
  */
  AllTypographic = 0,

  /**
      [Ligatures](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type1)
  */
  Ligatures = 1,

  /**
      [Cursive Connection](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type2)
  */
  CursiveConnection = 2,

  /**
      [Letter Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type3)
  */
  LetterCase = 3,

  /**
      [Vertical Substitution](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type4)
  */
  VerticalSubstitution = 4,

  /**
      [Linguistic Rearrangement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type5)
  */
  LinguisticRearrangement = 5,

  /**
      [Number Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type6)
  */
  NumberSpacing = 6,

  /**
      [Smart Swash](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type8)
  */
  SmartSwashType = 8,

  /**
      [Diacritics](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type9)
  */
  DiacriticsType = 9,

  /**
      [Vertical Position](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type10)
  */
  VerticalPosition = 10,

  /**
      [Fractions](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type11)
  */
  Fractions = 11,

  /**
      [Overlapping Characters](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type13)
  */
  OverlappingCharactersType = 13,

  /**
      [Typographic Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type14)
  */
  TypographicExtras = 14,

  /**
      [Mathematical Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type15)
  */
  MathematicalExtras = 15,

  /**
      [Ornament Sets](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type16)
  */
  OrnamentSetsType = 16,

  /**
      [Character Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type17)
  */
  CharacterAlternatives = 17,

  /**
      [Design Complexity](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type18)
  */
  DesignComplexityType = 18,

  /**
      [Style Options](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type19)
  */
  StyleOptions = 19,

  /**
      [Character Shape](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type20)
  */
  CharacterShape = 20,

  /**
      [Number Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type21)
  */
  NumberCase = 21,

  /**
      [Text Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type22)
  */
  TextSpacing = 22,

  /**
      [Transliteration](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type23)
  */
  Transliteration = 23,

  /**
      [Annotation](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type24)
  */
  AnnotationType = 24,

  /**
      [Kana Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type25)
  */
  KanaSpacingType = 25,

  /**
      [Ideographic Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type26)
  */
  IdeographicSpacingType = 26,

  /**
      [Unicode Decomposition](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type27)
  */
  UnicodeDecompositionType = 27,

  /**
      [Ruby Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type28)
  */
  RubyKana = 28,

  /**
      [CJK Symbol Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type29)
  */
  CjkSymbolAlternativesType = 29,

  /**
      [Ideographic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type30)
  */
  IdeographicAlternativesType = 30,

  /**
      [CJK Vertical Roman Placement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type31)
  */
  CjkVerticalRomanPlacementType = 31,

  /**
      [Italic CJK Roman](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type32)
  */
  ItalicCjkRoman = 32,

  /**
      [Case Sensitive Layout](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type33)
  */
  CaseSensitiveLayout = 33,

  /**
      [Alternate Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type34)
  */
  AlternateKana = 34,

  /**
      [Stylistic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type35)
  */
  StylisticAlternatives = 35,

  /**
      [Contextual Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type36)
  */
  ContextualAlternatives = 36,

  /**
      [Lower Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type37)
  */
  LowerCase = 37,

  /**
      [Upper Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type38)
  */
  UpperCase = 38,

  /**
      [Language Tag](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type39)
  */
  LanguageTagType = 39,

  /**
      [CJK Roman Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html#Type103)
  */
  CjkRomanSpacingType = 103,
}

/**
    Data type for holding HarfBuzz's clustering behavior options. The cluster level
    dictates one aspect of how HarfBuzz will treat non-base characters
    during shaping.
    
    In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES, non-base
    characters are merged into the cluster of the base character that precedes them.
    
    In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS, non-base characters are initially
    assigned their own cluster values, which are not merged into preceding base
    clusters. This allows HarfBuzz to perform additional operations like reorder
    sequences of adjacent marks.
    
    @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES is the default, because it maintains
    backward compatibility with older versions of HarfBuzz. New client programs that
    do not need to maintain such backward compatibility are recommended to use
    @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS instead of the default.
*/
enum hb_buffer_cluster_level_t
{
  /**
      Return cluster values grouped by graphemes into
        monotone order.
  */
  MonotoneGraphemes = 0,

  /**
      Return cluster values grouped into monotone order.
  */
  MonotoneCharacters = 1,

  /**
      Don't group cluster values.
  */
  Characters = 2,

  /**
      Default cluster level,
        equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES.
  */
  Default = 0,
}

/**
    The type of #hb_buffer_t contents.
*/
enum hb_buffer_content_type_t
{
  /**
      Initial value for new buffer.
  */
  Invalid = 0,

  /**
      The buffer contains input characters (before shaping).
  */
  Unicode = 1,

  /**
      The buffer contains output glyphs (after shaping).
  */
  Glyphs = 2,
}

/**
    Flags from comparing two #hb_buffer_t's.
    
    Buffer with different #hb_buffer_content_type_t cannot be meaningfully
    compared in any further detail.
    
    For buffers with differing length, the per-glyph comparison is not
    attempted, though we do still scan reference buffer for dotted circle and
    `.notdef` glyphs.
    
    If the buffers have the same length, we compare them glyph-by-glyph and
    report which aspect(s) of the glyph info/position are different.
*/
enum hb_buffer_diff_flags_t : uint
{
  /**
      equal buffers.
  */
  Equal = 0,

  /**
      buffers with different
          #hb_buffer_content_type_t.
  */
  ContentTypeMismatch = 1,

  /**
      buffers with differing length.
  */
  LengthMismatch = 2,

  /**
      `.notdef` glyph is present in the
          reference buffer.
  */
  NotdefPresent = 4,

  /**
      dotted circle glyph is present
          in the reference buffer.
  */
  DottedCirclePresent = 8,

  /**
      difference in #hb_glyph_info_t.codepoint
  */
  CodepointMismatch = 16,

  /**
      difference in #hb_glyph_info_t.cluster
  */
  ClusterMismatch = 32,

  /**
      difference in #hb_glyph_flags_t.
  */
  GlyphFlagsMismatch = 64,

  /**
      difference in #hb_glyph_position_t.
  */
  PositionMismatch = 128,
}

/**
    Flags for #hb_buffer_t.
*/
enum hb_buffer_flags_t : uint
{
  /**
      the default buffer flag.
  */
  Default = 0,

  /**
      flag indicating that special handling of the beginning
                           of text paragraph can be applied to this buffer. Should usually
                           be set, unless you are passing to the buffer only part
                           of the text without the full context.
  */
  Bot = 1,

  /**
      flag indicating that special handling of the end of text
                           paragraph can be applied to this buffer, similar to
                           @HB_BUFFER_FLAG_BOT.
  */
  Eot = 2,

  /**
      flag indication that character with Default_Ignorable
                           Unicode property should use the corresponding glyph
                           from the font, instead of hiding them (done by
                           replacing them with the space glyph and zeroing the
                           advance width.)  This flag takes precedence over
                           @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES.
  */
  PreserveDefaultIgnorables = 4,

  /**
      flag indication that character with Default_Ignorable
                           Unicode property should be removed from glyph string
                           instead of hiding them (done by replacing them with the
                           space glyph and zeroing the advance width.)
                           @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES takes
                           precedence over this flag. Since: 1.8.0
  */
  RemoveDefaultIgnorables = 8,

  /**
      flag indicating that a dotted circle should
                           not be inserted in the rendering of incorrect
                           character sequences (such at <0905 093E>). Since: 2.4.0
  */
  DoNotInsertDottedCircle = 16,

  /**
      flag indicating that the [harfbuzz.global.shape] call and its variants
                           should perform various verification processes on the results
                           of the shaping operation on the buffer.  If the verification
                           fails, then either a buffer message is sent, if a message
                           handler is installed on the buffer, or a message is written
                           to standard error.  In either case, the shaping result might
                           be modified to show the failed output. Since: 3.4.0
  */
  Verify = 32,

  /**
      flag indicating that the @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT
                           glyph-flag should be produced by the shaper. By default
                           it will not be produced since it incurs a cost. Since: 4.0.0
  */
  ProduceUnsafeToConcat = 64,

  /**
      flag indicating that the @HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL
                           glyph-flag should be produced by the shaper. By default
                           it will not be produced. Since: 5.1.0
  */
  ProduceSafeToInsertTatweel = 128,

  /**
      All currently defined flags: Since: 4.4.0
  */
  Defined = 255,
}

/**
    Flags that control what glyph information are serialized in [harfbuzz.global.bufferSerializeGlyphs].
*/
enum hb_buffer_serialize_flags_t : uint
{
  /**
      serialize glyph names, clusters and positions.
  */
  Default = 0,

  /**
      do not serialize glyph cluster.
  */
  NoClusters = 1,

  /**
      do not serialize glyph position information.
  */
  NoPositions = 2,

  /**
      do no serialize glyph name.
  */
  NoGlyphNames = 4,

  /**
      serialize glyph extents.
  */
  GlyphExtents = 8,

  /**
      serialize glyph flags. Since: 1.5.0
  */
  GlyphFlags = 16,

  /**
      do not serialize glyph advances,
       glyph offsets will reflect absolute glyph positions. Since: 1.8.0
  */
  NoAdvances = 32,

  /**
      All currently defined flags. Since: 4.4.0
  */
  Defined = 63,
}

/**
    The buffer serialization and de-serialization format used in
    [harfbuzz.global.bufferSerializeGlyphs] and [harfbuzz.global.bufferDeserializeGlyphs].
*/
enum hb_buffer_serialize_format_t
{
  /**
      a human-readable, plain text format.
  */
  Text = 1413830740,

  /**
      a machine-readable JSON format.
  */
  Json = 1246973774,

  /**
      invalid format.
  */
  Invalid = 0,
}

/**
    The direction of a text segment or buffer.
    
    A segment can also be tested for horizontal or vertical
    orientation (irrespective of specific direction) with
    HB_DIRECTION_IS_HORIZONTAL() or HB_DIRECTION_IS_VERTICAL().
*/
enum hb_direction_t
{
  /**
      Initial, unset direction.
  */
  Invalid = 0,

  /**
      Text is set horizontally from left to right.
  */
  Ltr = 4,

  /**
      Text is set horizontally from right to left.
  */
  Rtl = 5,

  /**
      Text is set vertically from top to bottom.
  */
  Ttb = 6,

  /**
      Text is set vertically from bottom to top.
  */
  Btt = 7,
}

/**
    Flags for #hb_glyph_info_t.
*/
enum hb_glyph_flags_t : uint
{
  /**
      Indicates that if input text is broken at the
      				   beginning of the cluster this glyph is part of,
      				   then both sides need to be re-shaped, as the
      				   result might be different.
      				   On the flip side, it means that when this
      				   flag is not present, then it is safe to break
      				   the glyph-run at the beginning of this
      				   cluster, and the two sides will represent the
      				   exact same result one would get if breaking
      				   input text at the beginning of this cluster
      				   and shaping the two sides separately.
      				   This can be used to optimize paragraph
      				   layout, by avoiding re-shaping of each line
      				   after line-breaking.
  */
  UnsafeToBreak = 1,

  /**
      Indicates that if input text is changed on one
      				   side of the beginning of the cluster this glyph
      				   is part of, then the shaping results for the
      				   other side might change.
      				   Note that the absence of this flag will NOT by
      				   itself mean that it IS safe to concat text.
      				   Only two pieces of text both of which clear of
      				   this flag can be concatenated safely.
      				   This can be used to optimize paragraph
      				   layout, by avoiding re-shaping of each line
      				   after line-breaking, by limiting the
      				   reshaping to a small piece around the
      				   breaking position only, even if the breaking
      				   position carries the
      				   #HB_GLYPH_FLAG_UNSAFE_TO_BREAK or when
      				   hyphenation or other text transformation
      				   happens at line-break position, in the following
      				   way:
      				   1. Iterate back from the line-break position
      				   until the first cluster start position that is
      				   NOT unsafe-to-concat, 2. shape the segment from
      				   there till the end of line, 3. check whether the
      				   resulting glyph-run also is clear of the
      				   unsafe-to-concat at its start-of-text position;
      				   if it is, just splice it into place and the line
      				   is shaped; If not, move on to a position further
      				   back that is clear of unsafe-to-concat and retry
      				   from there, and repeat.
      				   At the start of next line a similar algorithm can
      				   be implemented. That is: 1. Iterate forward from
      				   the line-break position until the first cluster
      				   start position that is NOT unsafe-to-concat, 2.
      				   shape the segment from beginning of the line to
      				   that position, 3. check whether the resulting
      				   glyph-run also is clear of the unsafe-to-concat
      				   at its end-of-text position; if it is, just splice
      				   it into place and the beginning is shaped; If not,
      				   move on to a position further forward that is clear
      				   of unsafe-to-concat and retry up to there, and repeat.
      				   A slight complication will arise in the
      				   implementation of the algorithm above,
      				   because while our buffer API has a way to
      				   return flags for position corresponding to
      				   start-of-text, there is currently no position
      				   corresponding to end-of-text.  This limitation
      				   can be alleviated by shaping more text than needed
      				   and looking for unsafe-to-concat flag within text
      				   clusters.
      				   The #HB_GLYPH_FLAG_UNSAFE_TO_BREAK flag will
      				   always imply this flag.
      			   To use this flag, you must enable the buffer flag
      			   @HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT during
      			   shaping, otherwise the buffer flag will not be
      			   reliably produced.
      				   Since: 4.0.0
  */
  UnsafeToConcat = 2,

  /**
      In scripts that use elongation (Arabic,
      				   Mongolian, Syriac, etc.), this flag signifies
      				   that it is safe to insert a U+0640 TATWEEL
      				   character before this cluster for elongation.
      				   This flag does not determine the
      				   script-specific elongation places, but only
      				   when it is safe to do the elongation without
      				   interrupting text shaping.
      				   Since: 5.1.0
  */
  SafeToInsertTatweel = 4,

  /**
      All the currently defined flags.
  */
  Defined = 7,
}

/**
    Data type holding the memory modes available to
    client programs.
    
    Regarding these various memory-modes:
    
    $(LIST
      * In no case shall the HarfBuzz client modify memory
        that is passed to HarfBuzz in a blob.  If there is
        any such possibility, @HB_MEMORY_MODE_DUPLICATE should be used
        such that HarfBuzz makes a copy immediately,
      
      * Use @HB_MEMORY_MODE_READONLY otherwise, unless you really really
        really know what you are doing,
      
      * @HB_MEMORY_MODE_WRITABLE is appropriate if you really made a
        copy of data solely for the purpose of passing to
        HarfBuzz and doing that just once (no reuse!),
      
      * If the font is mmap()ed, it's okay to use
        @HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE, however, using that mode
        correctly is very tricky.  Use @HB_MEMORY_MODE_READONLY instead.
    )
*/
enum hb_memory_mode_t
{
  /**
      HarfBuzz immediately makes a copy of the data.
  */
  Duplicate = 0,

  /**
      HarfBuzz client will never modify the data,
          and HarfBuzz will never modify the data.
  */
  Readonly = 1,

  /**
      HarfBuzz client made a copy of the data solely
          for HarfBuzz, so HarfBuzz may modify the data.
  */
  Writable = 2,

  /**
      See above
  */
  ReadonlyMayMakeWritable = 3,
}

/**
    Flags that describe the properties of color palette.
*/
enum hb_ot_color_palette_flags_t : uint
{
  /**
      Default indicating that there is nothing special
        to note about a color palette.
  */
  Default = 0,

  /**
      Flag indicating that the color
        palette is appropriate to use when displaying the font on a light background such as white.
  */
  UsableWithLightBackground = 1,

  /**
      Flag indicating that the color
        palette is appropriate to use when displaying the font on a dark background such as black.
  */
  UsableWithDarkBackground = 2,
}

/**
    Baseline tags from [Baseline Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/baselinetags) registry.
*/
enum hb_ot_layout_baseline_tag_t
{
  /**
      The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek.
      In vertical writing mode, the alphabetic baseline for characters rotated 90 degrees clockwise.
      (This would not apply to alphabetic characters that remain upright in vertical writing mode, since these
      characters are not rotated.)
  */
  Roman = 1919905134,

  /**
      The hanging baseline. In horizontal direction, this is the horizontal
      line from which syllables seem, to hang in Tibetan and other similar scripts. In vertical writing mode,
      for Tibetan (or some other similar script) characters rotated 90 degrees clockwise.
  */
  Hanging = 1751215719,

  /**
      Ideographic character face bottom or left edge,
      if the direction is horizontal or vertical, respectively.
  */
  IdeoFaceBottomOrLeft = 1768121954,

  /**
      Ideographic character face top or right edge,
      if the direction is horizontal or vertical, respectively.
  */
  IdeoFaceTopOrRight = 1768121972,

  /**
      The center of the ideographic character face. Since: 4.0.0
  */
  IdeoFaceCentral = 1231251043,

  /**
      Ideographic em-box bottom or left edge,
      if the direction is horizontal or vertical, respectively.
  */
  IdeoEmboxBottomOrLeft = 1768187247,

  /**
      Ideographic em-box top or right edge baseline,
  */
  IdeoEmboxTopOrRight = 1768191088,

  /**
      The center of the ideographic em-box. Since: 4.0.0
      if the direction is horizontal or vertical, respectively.
  */
  IdeoEmboxCentral = 1231315813,

  /**
      The baseline about which mathematical characters are centered.
      In vertical writing mode when mathematical characters rotated 90 degrees clockwise, are centered.
  */
  Math = 1835103336,
}

/**
    The GDEF classes defined for glyphs.
*/
enum hb_ot_layout_glyph_class_t
{
  /**
      Glyphs not matching the other classifications
  */
  Unclassified = 0,

  /**
      Spacing, single characters, capable of accepting marks
  */
  BaseGlyph = 1,

  /**
      Glyphs that represent ligation of multiple characters
  */
  Ligature = 2,

  /**
      Non-spacing, combining glyphs that represent marks
  */
  Mark = 3,

  /**
      Spacing glyphs that represent part of a single character
  */
  Component = 4,
}

/**
    The 'MATH' table constants, refer to
    [OpenType documentation](https://docs.microsoft.com/en-us/typography/opentype/spec/math#mathconstants-table)
    For more explanations.
*/
enum hb_ot_math_constant_t
{
  /**
      scriptPercentScaleDown
  */
  ScriptPercentScaleDown = 0,

  /**
      scriptScriptPercentScaleDown
  */
  ScriptScriptPercentScaleDown = 1,

  /**
      delimitedSubFormulaMinHeight
  */
  DelimitedSubFormulaMinHeight = 2,

  /**
      displayOperatorMinHeight
  */
  DisplayOperatorMinHeight = 3,

  /**
      mathLeading
  */
  MathLeading = 4,

  /**
      axisHeight
  */
  AxisHeight = 5,

  /**
      accentBaseHeight
  */
  AccentBaseHeight = 6,

  /**
      flattenedAccentBaseHeight
  */
  FlattenedAccentBaseHeight = 7,

  /**
      subscriptShiftDown
  */
  SubscriptShiftDown = 8,

  /**
      subscriptTopMax
  */
  SubscriptTopMax = 9,

  /**
      subscriptBaselineDropMin
  */
  SubscriptBaselineDropMin = 10,

  /**
      superscriptShiftUp
  */
  SuperscriptShiftUp = 11,

  /**
      superscriptShiftUpCramped
  */
  SuperscriptShiftUpCramped = 12,

  /**
      superscriptBottomMin
  */
  SuperscriptBottomMin = 13,

  /**
      superscriptBaselineDropMax
  */
  SuperscriptBaselineDropMax = 14,

  /**
      subSuperscriptGapMin
  */
  SubSuperscriptGapMin = 15,

  /**
      superscriptBottomMaxWithSubscript
  */
  SuperscriptBottomMaxWithSubscript = 16,

  /**
      spaceAfterScript
  */
  SpaceAfterScript = 17,

  /**
      upperLimitGapMin
  */
  UpperLimitGapMin = 18,

  /**
      upperLimitBaselineRiseMin
  */
  UpperLimitBaselineRiseMin = 19,

  /**
      lowerLimitGapMin
  */
  LowerLimitGapMin = 20,

  /**
      lowerLimitBaselineDropMin
  */
  LowerLimitBaselineDropMin = 21,

  /**
      stackTopShiftUp
  */
  StackTopShiftUp = 22,

  /**
      stackTopDisplayStyleShiftUp
  */
  StackTopDisplayStyleShiftUp = 23,

  /**
      stackBottomShiftDown
  */
  StackBottomShiftDown = 24,

  /**
      stackBottomDisplayStyleShiftDown
  */
  StackBottomDisplayStyleShiftDown = 25,

  /**
      stackGapMin
  */
  StackGapMin = 26,

  /**
      stackDisplayStyleGapMin
  */
  StackDisplayStyleGapMin = 27,

  /**
      stretchStackTopShiftUp
  */
  StretchStackTopShiftUp = 28,

  /**
      stretchStackBottomShiftDown
  */
  StretchStackBottomShiftDown = 29,

  /**
      stretchStackGapAboveMin
  */
  StretchStackGapAboveMin = 30,

  /**
      stretchStackGapBelowMin
  */
  StretchStackGapBelowMin = 31,

  /**
      fractionNumeratorShiftUp
  */
  FractionNumeratorShiftUp = 32,

  /**
      fractionNumeratorDisplayStyleShiftUp
  */
  FractionNumeratorDisplayStyleShiftUp = 33,

  /**
      fractionDenominatorShiftDown
  */
  FractionDenominatorShiftDown = 34,

  /**
      fractionDenominatorDisplayStyleShiftDown
  */
  FractionDenominatorDisplayStyleShiftDown = 35,

  /**
      fractionNumeratorGapMin
  */
  FractionNumeratorGapMin = 36,

  /**
      fractionNumDisplayStyleGapMin
  */
  FractionNumDisplayStyleGapMin = 37,

  /**
      fractionRuleThickness
  */
  FractionRuleThickness = 38,

  /**
      fractionDenominatorGapMin
  */
  FractionDenominatorGapMin = 39,

  /**
      fractionDenomDisplayStyleGapMin
  */
  FractionDenomDisplayStyleGapMin = 40,

  /**
      skewedFractionHorizontalGap
  */
  SkewedFractionHorizontalGap = 41,

  /**
      skewedFractionVerticalGap
  */
  SkewedFractionVerticalGap = 42,

  /**
      overbarVerticalGap
  */
  OverbarVerticalGap = 43,

  /**
      overbarRuleThickness
  */
  OverbarRuleThickness = 44,

  /**
      overbarExtraAscender
  */
  OverbarExtraAscender = 45,

  /**
      underbarVerticalGap
  */
  UnderbarVerticalGap = 46,

  /**
      underbarRuleThickness
  */
  UnderbarRuleThickness = 47,

  /**
      underbarExtraDescender
  */
  UnderbarExtraDescender = 48,

  /**
      radicalVerticalGap
  */
  RadicalVerticalGap = 49,

  /**
      radicalDisplayStyleVerticalGap
  */
  RadicalDisplayStyleVerticalGap = 50,

  /**
      radicalRuleThickness
  */
  RadicalRuleThickness = 51,

  /**
      radicalExtraAscender
  */
  RadicalExtraAscender = 52,

  /**
      radicalKernBeforeDegree
  */
  RadicalKernBeforeDegree = 53,

  /**
      radicalKernAfterDegree
  */
  RadicalKernAfterDegree = 54,

  /**
      radicalDegreeBottomRaisePercent
  */
  RadicalDegreeBottomRaisePercent = 55,
}

/**
    Flags for math glyph parts.
*/
enum hb_ot_math_glyph_part_flags_t : uint
{
  /**
      This is an extender glyph part that
      can be repeated to reach the desired length.
  */
  Extender = 1,
}

/**
    The math kerning-table types defined for the four corners
    of a glyph.
*/
enum hb_ot_math_kern_t
{
  /**
      The top right corner of the glyph.
  */
  TopRight = 0,

  /**
      The top left corner of the glyph.
  */
  TopLeft = 1,

  /**
      The bottom right corner of the glyph.
  */
  BottomRight = 2,

  /**
      The bottom left corner of the glyph.
  */
  BottomLeft = 3,
}

/**
    Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta
*/
enum hb_ot_meta_tag_t
{
  /**
      Design languages. Text, using only
      Basic Latin (ASCII) characters. Indicates languages and/or scripts
      for the user audiences that the font was primarily designed for.
  */
  DesignLanguages = 1684827751,

  /**
      Supported languages. Text, using
      only Basic Latin (ASCII) characters. Indicates languages and/or scripts
      that the font is declared to be capable of supporting.
  */
  SupportedLanguages = 1936485991,
}

/**
    Metric tags corresponding to [MVAR Value
    Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/mvar#value-tags)
*/
enum hb_ot_metrics_tag_t
{
  /**
      horizontal ascender.
  */
  HorizontalAscender = 1751216995,

  /**
      horizontal descender.
  */
  HorizontalDescender = 1751413603,

  /**
      horizontal line gap.
  */
  HorizontalLineGap = 1751934832,

  /**
      horizontal clipping ascent.
  */
  HorizontalClippingAscent = 1751346273,

  /**
      horizontal clipping descent.
  */
  HorizontalClippingDescent = 1751346276,

  /**
      vertical ascender.
  */
  VerticalAscender = 1986098019,

  /**
      vertical descender.
  */
  VerticalDescender = 1986294627,

  /**
      vertical line gap.
  */
  VerticalLineGap = 1986815856,

  /**
      horizontal caret rise.
  */
  HorizontalCaretRise = 1751347827,

  /**
      horizontal caret run.
  */
  HorizontalCaretRun = 1751347822,

  /**
      horizontal caret offset.
  */
  HorizontalCaretOffset = 1751347046,

  /**
      vertical caret rise.
  */
  VerticalCaretRise = 1986228851,

  /**
      vertical caret run.
  */
  VerticalCaretRun = 1986228846,

  /**
      vertical caret offset.
  */
  VerticalCaretOffset = 1986228070,

  /**
      x height.
  */
  XHeight = 2020108148,

  /**
      cap height.
  */
  CapHeight = 1668311156,

  /**
      subscript em x size.
  */
  SubscriptEmXSize = 1935833203,

  /**
      subscript em y size.
  */
  SubscriptEmYSize = 1935833459,

  /**
      subscript em x offset.
  */
  SubscriptEmXOffset = 1935833199,

  /**
      subscript em y offset.
  */
  SubscriptEmYOffset = 1935833455,

  /**
      superscript em x size.
  */
  SuperscriptEmXSize = 1936750707,

  /**
      superscript em y size.
  */
  SuperscriptEmYSize = 1936750963,

  /**
      superscript em x offset.
  */
  SuperscriptEmXOffset = 1936750703,

  /**
      superscript em y offset.
  */
  SuperscriptEmYOffset = 1936750959,

  /**
      strikeout size.
  */
  StrikeoutSize = 1937011315,

  /**
      strikeout offset.
  */
  StrikeoutOffset = 1937011311,

  /**
      underline size.
  */
  UnderlineSize = 1970168947,

  /**
      underline offset.
  */
  UnderlineOffset = 1970168943,
}

/**
    An enum type representing the pre-defined name IDs.
    
    For more information on these fields, see the
    [OpenType spec](https://docs.microsoft.com/en-us/typography/opentype/spec/name#name-ids).
*/
enum hb_ot_name_id_predefined_t
{
  /**
      Copyright notice
  */
  Copyright = 0,

  /**
      Font Family name
  */
  FontFamily = 1,

  /**
      Font Subfamily name
  */
  FontSubfamily = 2,

  /**
      Unique font identifier
  */
  UniqueId = 3,

  /**
      Full font name that reflects
      all family and relevant subfamily descriptors
  */
  FullName = 4,

  /**
      Version string
  */
  VersionString = 5,

  /**
      PostScript name for the font
  */
  PostscriptName = 6,

  /**
      Trademark
  */
  Trademark = 7,

  /**
      Manufacturer Name
  */
  Manufacturer = 8,

  /**
      Designer
  */
  Designer = 9,

  /**
      Description
  */
  Description = 10,

  /**
      URL of font vendor
  */
  VendorUrl = 11,

  /**
      URL of typeface designer
  */
  DesignerUrl = 12,

  /**
      License Description
  */
  License = 13,

  /**
      URL where additional licensing
      information can be found
  */
  LicenseUrl = 14,

  /**
      Typographic Family name
  */
  TypographicFamily = 16,

  /**
      Typographic Subfamily name
  */
  TypographicSubfamily = 17,

  /**
      Compatible Full Name for MacOS
  */
  MacFullName = 18,

  /**
      Sample text
  */
  SampleText = 19,

  /**
      PostScript CID findfont name
  */
  CidFindfontName = 20,

  /**
      WWS Family Name
  */
  WwsFamily = 21,

  /**
      WWS Subfamily Name
  */
  WwsSubfamily = 22,

  /**
      Light Background Palette
  */
  LightBackground = 23,

  /**
      Dark Background Palette
  */
  DarkBackground = 24,

  /**
      Variations PostScript Name Prefix
  */
  VariationsPsPrefix = 25,

  /**
      Value to represent a nonexistent name ID.
  */
  Invalid = 65535,
}

/**
    Flags for #hb_ot_var_axis_info_t.
*/
enum hb_ot_var_axis_flags_t : uint
{
  /**
      The axis should not be exposed directly in user interfaces.
  */
  Hidden = 1,
}

/**
    The values of this enumeration describe the compositing modes
    that can be used when combining temporary redirected drawing
    with the backdrop.
    
    See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
    section for details.
*/
enum hb_paint_composite_mode_t
{
  /**
      clear destination layer (bounded)
  */
  Clear = 0,

  /**
      replace destination layer (bounded)
  */
  Src = 1,

  /**
      ignore the source
  */
  Dest = 2,

  /**
      draw source layer on top of destination layer
      (bounded)
  */
  SrcOver = 3,

  /**
      draw destination on top of source
  */
  DestOver = 4,

  /**
      draw source where there was destination content
      (unbounded)
  */
  SrcIn = 5,

  /**
      leave destination only where there was
      source content (unbounded)
  */
  DestIn = 6,

  /**
      draw source where there was no destination
      content (unbounded)
  */
  SrcOut = 7,

  /**
      leave destination only where there was no
      source content
  */
  DestOut = 8,

  /**
      draw source on top of destination content and
      only there
  */
  SrcAtop = 9,

  /**
      leave destination on top of source content
      and only there (unbounded)
  */
  DestAtop = 10,

  /**
      source and destination are shown where there is only
      one of them
  */
  Xor = 11,

  /**
      source and destination layers are accumulated
  */
  Plus = 12,

  /**
      source and destination are complemented and
      multiplied. This causes the result to be at least as light as the lighter
      inputs.
  */
  Screen = 13,

  /**
      multiplies or screens, depending on the
      lightness of the destination color.
  */
  Overlay = 14,

  /**
      replaces the destination with the source if it
      is darker, otherwise keeps the source.
  */
  Darken = 15,

  /**
      replaces the destination with the source if it
      is lighter, otherwise keeps the source.
  */
  Lighten = 16,

  /**
      brightens the destination color to reflect
      the source color.
  */
  ColorDodge = 17,

  /**
      darkens the destination color to reflect
      the source color.
  */
  ColorBurn = 18,

  /**
      Multiplies or screens, dependent on source
      color.
  */
  HardLight = 19,

  /**
      Darkens or lightens, dependent on source
      color.
  */
  SoftLight = 20,

  /**
      Takes the difference of the source and
      destination color.
  */
  Difference = 21,

  /**
      Produces an effect similar to difference, but
      with lower contrast.
  */
  Exclusion = 22,

  /**
      source and destination layers are multiplied.
      This causes the result to be at least as dark as the darker inputs.
  */
  Multiply = 23,

  /**
      Creates a color with the hue of the source
      and the saturation and luminosity of the target.
  */
  HslHue = 24,

  /**
      Creates a color with the saturation
      of the source and the hue and luminosity of the target. Painting with
      this mode onto a gray area produces no change.
  */
  HslSaturation = 25,

  /**
      Creates a color with the hue and saturation
      of the source and the luminosity of the target. This preserves the gray
      levels of the target and is useful for coloring monochrome images or
      tinting color images.
  */
  HslColor = 26,

  /**
      Creates a color with the luminosity of
      the source and the hue and saturation of the target. This produces an
      inverse effect to @HB_PAINT_COMPOSITE_MODE_HSL_COLOR.
  */
  HslLuminosity = 27,
}

/**
    The values of this enumeration determine how color values
    outside the minimum and maximum defined offset on a #hb_color_line_t
    are determined.
    
    See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
    section for details.
*/
enum hb_paint_extend_t
{
  /**
      Outside the defined interval,
        the color of the closest color stop is used.
  */
  Pad = 0,

  /**
      The color line is repeated over
        repeated multiples of the defined interval
  */
  Repeat = 1,

  /**
      The color line is repeated over
           repeated intervals, as for the repeat mode.
           However, in each repeated interval, the ordering of
           color stops is the reverse of the adjacent interval.
  */
  Reflect = 2,
}

/**
    Data type for scripts. Each #hb_script_t's value is an #hb_tag_t corresponding
    to the four-letter values defined by [ISO 15924](https://unicode.org/iso15924/).
    
    See also the Script (sc) property of the Unicode Character Database.
*/
enum hb_script_t
{
  /**
      `Zyyy`
  */
  Common = 1517910393,

  /**
      `Zinh`
  */
  Inherited = 1516858984,

  /**
      `Zzzz`
  */
  Unknown = 1517976186,

  /**
      `Arab`
  */
  Arabic = 1098015074,

  /**
      `Armn`
  */
  Armenian = 1098018158,

  /**
      `Beng`
  */
  Bengali = 1113943655,

  /**
      `Cyrl`
  */
  Cyrillic = 1132032620,

  /**
      `Deva`
  */
  Devanagari = 1147500129,

  /**
      `Geor`
  */
  Georgian = 1197830002,

  /**
      `Grek`
  */
  Greek = 1198679403,

  /**
      `Gujr`
  */
  Gujarati = 1198877298,

  /**
      `Guru`
  */
  Gurmukhi = 1198879349,

  /**
      `Hang`
  */
  Hangul = 1214344807,

  /**
      `Hani`
  */
  Han = 1214344809,

  /**
      `Hebr`
  */
  Hebrew = 1214603890,

  /**
      `Hira`
  */
  Hiragana = 1214870113,

  /**
      `Knda`
  */
  Kannada = 1265525857,

  /**
      `Kana`
  */
  Katakana = 1264676449,

  /**
      `Laoo`
  */
  Lao = 1281453935,

  /**
      `Latn`
  */
  Latin = 1281455214,

  /**
      `Mlym`
  */
  Malayalam = 1298954605,

  /**
      `Orya`
  */
  Oriya = 1332902241,

  /**
      `Taml`
  */
  Tamil = 1415671148,

  /**
      `Telu`
  */
  Telugu = 1415933045,

  /**
      `Thai`
  */
  Thai = 1416126825,

  /**
      `Tibt`
  */
  Tibetan = 1416192628,

  /**
      `Bopo`
  */
  Bopomofo = 1114599535,

  /**
      `Brai`
  */
  Braille = 1114792297,

  /**
      `Cans`
  */
  CanadianSyllabics = 1130458739,

  /**
      `Cher`
  */
  Cherokee = 1130915186,

  /**
      `Ethi`
  */
  Ethiopic = 1165256809,

  /**
      `Khmr`
  */
  Khmer = 1265134962,

  /**
      `Mong`
  */
  Mongolian = 1299148391,

  /**
      `Mymr`
  */
  Myanmar = 1299803506,

  /**
      `Ogam`
  */
  Ogham = 1332175213,

  /**
      `Runr`
  */
  Runic = 1383427698,

  /**
      `Sinh`
  */
  Sinhala = 1399418472,

  /**
      `Syrc`
  */
  Syriac = 1400468067,

  /**
      `Thaa`
  */
  Thaana = 1416126817,

  /**
      `Yiii`
  */
  Yi = 1500080489,

  /**
      `Dsrt`
  */
  Deseret = 1148416628,

  /**
      `Goth`
  */
  Gothic = 1198486632,

  /**
      `Ital`
  */
  OldItalic = 1232363884,

  /**
      `Buhd`
  */
  Buhid = 1114990692,

  /**
      `Hano`
  */
  Hanunoo = 1214344815,

  /**
      `Tglg`
  */
  Tagalog = 1416064103,

  /**
      `Tagb`
  */
  Tagbanwa = 1415669602,

  /**
      `Cprt`
  */
  Cypriot = 1131442804,

  /**
      `Limb`
  */
  Limbu = 1281977698,

  /**
      `Linb`
  */
  LinearB = 1281977954,

  /**
      `Osma`
  */
  Osmanya = 1332964705,

  /**
      `Shaw`
  */
  Shavian = 1399349623,

  /**
      `Tale`
  */
  TaiLe = 1415670885,

  /**
      `Ugar`
  */
  Ugaritic = 1432838514,

  /**
      `Bugi`
  */
  Buginese = 1114990441,

  /**
      `Copt`
  */
  Coptic = 1131376756,

  /**
      `Glag`
  */
  Glagolitic = 1198285159,

  /**
      `Khar`
  */
  Kharoshthi = 1265131890,

  /**
      `Talu`
  */
  NewTaiLue = 1415670901,

  /**
      `Xpeo`
  */
  OldPersian = 1483761007,

  /**
      `Sylo`
  */
  SylotiNagri = 1400466543,

  /**
      `Tfng`
  */
  Tifinagh = 1415999079,

  /**
      `Bali`
  */
  Balinese = 1113681001,

  /**
      `Xsux`
  */
  Cuneiform = 1483961720,

  /**
      `Nkoo`
  */
  Nko = 1315663727,

  /**
      `Phag`
  */
  PhagsPa = 1349017959,

  /**
      `Phnx`
  */
  Phoenician = 1349021304,

  /**
      `Cari`
  */
  Carian = 1130459753,

  /**
      `Cham`
  */
  Cham = 1130914157,

  /**
      `Kali`
  */
  KayahLi = 1264675945,

  /**
      `Lepc`
  */
  Lepcha = 1281716323,

  /**
      `Lyci`
  */
  Lycian = 1283023721,

  /**
      `Lydi`
  */
  Lydian = 1283023977,

  /**
      `Olck`
  */
  OlChiki = 1332503403,

  /**
      `Rjng`
  */
  Rejang = 1382706791,

  /**
      `Saur`
  */
  Saurashtra = 1398895986,

  /**
      `Sund`
  */
  Sundanese = 1400204900,

  /**
      `Vaii`
  */
  Vai = 1449224553,

  /**
      `Avst`
  */
  Avestan = 1098281844,

  /**
      `Bamu`
  */
  Bamum = 1113681269,

  /**
      `Egyp`
  */
  EgyptianHieroglyphs = 1164409200,

  /**
      `Armi`
  */
  ImperialAramaic = 1098018153,

  /**
      `Phli`
  */
  InscriptionalPahlavi = 1349020777,

  /**
      `Prti`
  */
  InscriptionalParthian = 1349678185,

  /**
      `Java`
  */
  Javanese = 1247901281,

  /**
      `Kthi`
  */
  Kaithi = 1265920105,

  /**
      `Lisu`
  */
  Lisu = 1281979253,

  /**
      `Mtei`
  */
  MeeteiMayek = 1299473769,

  /**
      `Sarb`
  */
  OldSouthArabian = 1398895202,

  /**
      `Orkh`
  */
  OldTurkic = 1332898664,

  /**
      `Samr`
  */
  Samaritan = 1398893938,

  /**
      `Lana`
  */
  TaiTham = 1281453665,

  /**
      `Tavt`
  */
  TaiViet = 1415673460,

  /**
      `Batk`
  */
  Batak = 1113683051,

  /**
      `Brah`
  */
  Brahmi = 1114792296,

  /**
      `Mand`
  */
  Mandaic = 1298230884,

  /**
      `Cakm`
  */
  Chakma = 1130457965,

  /**
      `Merc`
  */
  MeroiticCursive = 1298494051,

  /**
      `Mero`
  */
  MeroiticHieroglyphs = 1298494063,

  /**
      `Plrd`
  */
  Miao = 1349284452,

  /**
      `Shrd`
  */
  Sharada = 1399353956,

  /**
      `Sora`
  */
  SoraSompeng = 1399812705,

  /**
      `Takr`
  */
  Takri = 1415670642,

  /**
      `Bass`, Since: 0.9.30
  */
  BassaVah = 1113682803,

  /**
      `Aghb`, Since: 0.9.30
  */
  CaucasianAlbanian = 1097295970,

  /**
      `Dupl`, Since: 0.9.30
  */
  Duployan = 1148547180,

  /**
      `Elba`, Since: 0.9.30
  */
  Elbasan = 1164730977,

  /**
      `Gran`, Since: 0.9.30
  */
  Grantha = 1198678382,

  /**
      `Khoj`, Since: 0.9.30
  */
  Khojki = 1265135466,

  /**
      `Sind`, Since: 0.9.30
  */
  Khudawadi = 1399418468,

  /**
      `Lina`, Since: 0.9.30
  */
  LinearA = 1281977953,

  /**
      `Mahj`, Since: 0.9.30
  */
  Mahajani = 1298229354,

  /**
      `Mani`, Since: 0.9.30
  */
  Manichaean = 1298230889,

  /**
      `Mend`, Since: 0.9.30
  */
  MendeKikakui = 1298493028,

  /**
      `Modi`, Since: 0.9.30
  */
  Modi = 1299145833,

  /**
      `Mroo`, Since: 0.9.30
  */
  Mro = 1299345263,

  /**
      `Nbat`, Since: 0.9.30
  */
  Nabataean = 1315070324,

  /**
      `Narb`, Since: 0.9.30
  */
  OldNorthArabian = 1315009122,

  /**
      `Perm`, Since: 0.9.30
  */
  OldPermic = 1348825709,

  /**
      `Hmng`, Since: 0.9.30
  */
  PahawhHmong = 1215131239,

  /**
      `Palm`, Since: 0.9.30
  */
  Palmyrene = 1348562029,

  /**
      `Pauc`, Since: 0.9.30
  */
  PauCinHau = 1348564323,

  /**
      `Phlp`, Since: 0.9.30
  */
  PsalterPahlavi = 1349020784,

  /**
      `Sidd`, Since: 0.9.30
  */
  Siddham = 1399415908,

  /**
      `Tirh`, Since: 0.9.30
  */
  Tirhuta = 1416196712,

  /**
      `Wara`, Since: 0.9.30
  */
  WarangCiti = 1466004065,

  /**
      `Ahom`, Since: 0.9.30
  */
  Ahom = 1097363309,

  /**
      `Hluw`, Since: 0.9.30
  */
  AnatolianHieroglyphs = 1215067511,

  /**
      `Hatr`, Since: 0.9.30
  */
  Hatran = 1214346354,

  /**
      `Mult`, Since: 0.9.30
  */
  Multani = 1299541108,

  /**
      `Hung`, Since: 0.9.30
  */
  OldHungarian = 1215655527,

  /**
      `Sgnw`, Since: 0.9.30
  */
  Signwriting = 1399287415,

  /**
      `Adlm`, Since: 1.3.0
  */
  Adlam = 1097100397,

  /**
      `Bhks`, Since: 1.3.0
  */
  Bhaiksuki = 1114139507,

  /**
      `Marc`, Since: 1.3.0
  */
  Marchen = 1298231907,

  /**
      `Osge`, Since: 1.3.0
  */
  Osage = 1332963173,

  /**
      `Tang`, Since: 1.3.0
  */
  Tangut = 1415671399,

  /**
      `Newa`, Since: 1.3.0
  */
  Newa = 1315272545,

  /**
      `Gonm`, Since: 1.6.0
  */
  MasaramGondi = 1198485101,

  /**
      `Nshu`, Since: 1.6.0
  */
  Nushu = 1316186229,

  /**
      `Soyo`, Since: 1.6.0
  */
  Soyombo = 1399814511,

  /**
      `Zanb`, Since: 1.6.0
  */
  ZanabazarSquare = 1516334690,

  /**
      `Dogr`, Since: 1.8.0
  */
  Dogra = 1148151666,

  /**
      `Gong`, Since: 1.8.0
  */
  GunjalaGondi = 1198485095,

  /**
      `Rohg`, Since: 1.8.0
  */
  HanifiRohingya = 1383032935,

  /**
      `Maka`, Since: 1.8.0
  */
  Makasar = 1298230113,

  /**
      `Medf`, Since: 1.8.0
  */
  Medefaidrin = 1298490470,

  /**
      `Sogo`, Since: 1.8.0
  */
  OldSogdian = 1399809903,

  /**
      `Sogd`, Since: 1.8.0
  */
  Sogdian = 1399809892,

  /**
      `Elym`, Since: 2.4.0
  */
  Elymaic = 1164736877,

  /**
      `Nand`, Since: 2.4.0
  */
  Nandinagari = 1315008100,

  /**
      `Hmnp`, Since: 2.4.0
  */
  NyiakengPuachueHmong = 1215131248,

  /**
      `Wcho`, Since: 2.4.0
  */
  Wancho = 1466132591,

  /**
      `Chrs`, Since: 2.6.7
  */
  Chorasmian = 1130918515,

  /**
      `Diak`, Since: 2.6.7
  */
  DivesAkuru = 1147756907,

  /**
      `Kits`, Since: 2.6.7
  */
  KhitanSmallScript = 1265202291,

  /**
      `Yezi`, Since: 2.6.7
  */
  Yezidi = 1499822697,

  /**
      `Cpmn`, Since: 3.0.0
  */
  CyproMinoan = 1131441518,

  /**
      `Ougr`, Since: 3.0.0
  */
  OldUyghur = 1333094258,

  /**
      `Tnsa`, Since: 3.0.0
  */
  Tangsa = 1416524641,

  /**
      `Toto`, Since: 3.0.0
  */
  Toto = 1416590447,

  /**
      `Vith`, Since: 3.0.0
  */
  Vithkuqi = 1449751656,

  /**
      `Zmth`, Since: 3.4.0
  */
  Math = 1517122664,

  /**
      `Kawi`, Since: 5.2.0
  */
  Kawi = 1264678761,

  /**
      `Nagm`, Since: 5.2.0
  */
  NagMundari = 1315006317,

  /**
      No script set
  */
  Invalid = 0,
}

/**
    Defined by [OpenType Design-Variation Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
enum hb_style_tag_t
{
  /**
      Used to vary between non-italic and italic.
      A value of 0 can be interpreted as "Roman" (non-italic); a value of 1 can
      be interpreted as (fully) italic.
  */
  Italic = 1769234796,

  /**
      Used to vary design to suit different text sizes.
      Non-zero. Values can be interpreted as text size, in points.
  */
  OpticalSize = 1869640570,

  /**
      Used to vary between upright and slanted text. Values
      must be greater than -90 and less than +90. Values can be interpreted as
      the angle, in counter-clockwise degrees, of oblique slant from whatever the
      designer considers to be upright for that font design. Typical right-leaning
      Italic fonts have a negative slant angle (typically around -12)
  */
  SlantAngle = 1936486004,

  /**
      same as @HB_STYLE_TAG_SLANT_ANGLE expression as ratio.
      Typical right-leaning Italic fonts have a positive slant ratio (typically around 0.2)
  */
  SlantRatio = 1399615092,

  /**
      Used to vary width of text from narrower to wider.
      Non-zero. Values can be interpreted as a percentage of whatever the font
      designer considers “normal width” for that font design.
  */
  Width = 2003072104,

  /**
      Used to vary stroke thicknesses or other design details
      to give variation from lighter to blacker. Values can be interpreted in direct
      comparison to values for usWeightClass in the OS/2 table,
      or the CSS font-weight property.
  */
  Weight = 2003265652,
}

/**
    Data type for the Canonical_Combining_Class (ccc) property
    from the Unicode Character Database.
    
    <note>Note: newer versions of Unicode may add new values.
    Client programs should be ready to handle any value in the 0..254 range
    being returned from [harfbuzz.global.unicodeCombiningClass].</note>
*/
enum hb_unicode_combining_class_t
{
  /**
      Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing
  */
  NotReordered = 0,

  /**
      Marks which overlay a base letter or symbol
  */
  Overlay = 1,

  /**
      Diacritic nukta marks in Brahmi-derived scripts
  */
  Nukta = 7,

  /**
      Hiragana/Katakana voicing marks
  */
  KanaVoicing = 8,

  /**
      Viramas
  */
  Virama = 9,

  /**
      [Hebrew]
  */
  Ccc10 = 10,

  /**
      [Hebrew]
  */
  Ccc11 = 11,

  /**
      [Hebrew]
  */
  Ccc12 = 12,

  /**
      [Hebrew]
  */
  Ccc13 = 13,

  /**
      [Hebrew]
  */
  Ccc14 = 14,

  /**
      [Hebrew]
  */
  Ccc15 = 15,

  /**
      [Hebrew]
  */
  Ccc16 = 16,

  /**
      [Hebrew]
  */
  Ccc17 = 17,

  /**
      [Hebrew]
  */
  Ccc18 = 18,

  /**
      [Hebrew]
  */
  Ccc19 = 19,

  /**
      [Hebrew]
  */
  Ccc20 = 20,

  /**
      [Hebrew]
  */
  Ccc21 = 21,

  /**
      [Hebrew]
  */
  Ccc22 = 22,

  /**
      [Hebrew]
  */
  Ccc23 = 23,

  /**
      [Hebrew]
  */
  Ccc24 = 24,

  /**
      [Hebrew]
  */
  Ccc25 = 25,

  /**
      [Hebrew]
  */
  Ccc26 = 26,

  /**
      [Arabic]
  */
  Ccc27 = 27,

  /**
      [Arabic]
  */
  Ccc28 = 28,

  /**
      [Arabic]
  */
  Ccc29 = 29,

  /**
      [Arabic]
  */
  Ccc30 = 30,

  /**
      [Arabic]
  */
  Ccc31 = 31,

  /**
      [Arabic]
  */
  Ccc32 = 32,

  /**
      [Arabic]
  */
  Ccc33 = 33,

  /**
      [Arabic]
  */
  Ccc34 = 34,

  /**
      [Arabic]
  */
  Ccc35 = 35,

  /**
      [Syriac]
  */
  Ccc36 = 36,

  /**
      [Telugu]
  */
  Ccc84 = 84,

  /**
      [Telugu]
  */
  Ccc91 = 91,

  /**
      [Thai]
  */
  Ccc103 = 103,

  /**
      [Thai]
  */
  Ccc107 = 107,

  /**
      [Lao]
  */
  Ccc118 = 118,

  /**
      [Lao]
  */
  Ccc122 = 122,

  /**
      [Tibetan]
  */
  Ccc129 = 129,

  /**
      [Tibetan]
  */
  Ccc130 = 130,

  /**
      [Tibetan] Since: 7.2.0
  */
  Ccc132 = 132,

  /**
      Marks attached at the bottom left
  */
  AttachedBelowLeft = 200,

  /**
      Marks attached directly below
  */
  AttachedBelow = 202,

  /**
      Marks attached directly above
  */
  AttachedAbove = 214,

  /**
      Marks attached at the top right
  */
  AttachedAboveRight = 216,

  /**
      Distinct marks at the bottom left
  */
  BelowLeft = 218,

  /**
      Distinct marks directly below
  */
  Below = 220,

  /**
      Distinct marks at the bottom right
  */
  BelowRight = 222,

  /**
      Distinct marks to the left
  */
  Left = 224,

  /**
      Distinct marks to the right
  */
  Right = 226,

  /**
      Distinct marks at the top left
  */
  AboveLeft = 228,

  /**
      Distinct marks directly above
  */
  Above = 230,

  /**
      Distinct marks at the top right
  */
  AboveRight = 232,

  /**
      Distinct marks subtending two bases
  */
  DoubleBelow = 233,

  /**
      Distinct marks extending above two bases
  */
  DoubleAbove = 234,

  /**
      Greek iota subscript only
  */
  IotaSubscript = 240,

  /**
      Invalid combining class
  */
  Invalid = 255,
}

/**
    Data type for the "General_Category" (gc) property from
    the Unicode Character Database.
*/
enum hb_unicode_general_category_t
{
  /**
      [Cc]
  */
  Control = 0,

  /**
      [Cf]
  */
  Format = 1,

  /**
      [Cn]
  */
  Unassigned = 2,

  /**
      [Co]
  */
  PrivateUse = 3,

  /**
      [Cs]
  */
  Surrogate = 4,

  /**
      [Ll]
  */
  LowercaseLetter = 5,

  /**
      [Lm]
  */
  ModifierLetter = 6,

  /**
      [Lo]
  */
  OtherLetter = 7,

  /**
      [Lt]
  */
  TitlecaseLetter = 8,

  /**
      [Lu]
  */
  UppercaseLetter = 9,

  /**
      [Mc]
  */
  SpacingMark = 10,

  /**
      [Me]
  */
  EnclosingMark = 11,

  /**
      [Mn]
  */
  NonSpacingMark = 12,

  /**
      [Nd]
  */
  DecimalNumber = 13,

  /**
      [Nl]
  */
  LetterNumber = 14,

  /**
      [No]
  */
  OtherNumber = 15,

  /**
      [Pc]
  */
  ConnectPunctuation = 16,

  /**
      [Pd]
  */
  DashPunctuation = 17,

  /**
      [Pe]
  */
  ClosePunctuation = 18,

  /**
      [Pf]
  */
  FinalPunctuation = 19,

  /**
      [Pi]
  */
  InitialPunctuation = 20,

  /**
      [Po]
  */
  OtherPunctuation = 21,

  /**
      [Ps]
  */
  OpenPunctuation = 22,

  /**
      [Sc]
  */
  CurrencySymbol = 23,

  /**
      [Sk]
  */
  ModifierSymbol = 24,

  /**
      [Sm]
  */
  MathSymbol = 25,

  /**
      [So]
  */
  OtherSymbol = 26,

  /**
      [Zl]
  */
  LineSeparator = 27,

  /**
      [Zp]
  */
  ParagraphSeparator = 28,

  /**
      [Zs]
  */
  SpaceSeparator = 29,
}

/**
    Structure representing a setting for an #hb_aat_layout_feature_type_t.
*/
struct hb_aat_layout_feature_selector_info_t
{
  /**
      The selector's name identifier
  */
  hb_ot_name_id_t nameId;

  /**
      The value to turn the selector on
  */
  hb_aat_layout_feature_selector_t enable;

  /**
      The value to turn the selector off
  */
  hb_aat_layout_feature_selector_t disable;

  /** */
  uint reserved;
}

/**
    Data type for blobs. A blob wraps a chunk of binary
    data and facilitates its lifecycle management between
    a client program and HarfBuzz.
*/
struct hb_blob_t;

/**
    The main structure holding the input text and its properties before shaping,
    and output glyphs and their information after shaping.
*/
struct hb_buffer_t;

/**
    A struct containing color information for a gradient.
*/
struct hb_color_line_t
{
  /** */
  void* data;

  /** */
  hb_color_line_get_color_stops_func_t getColorStops;

  /** */
  void* getColorStopsUserData;

  /** */
  hb_color_line_get_extend_func_t getExtend;

  /** */
  void* getExtendUserData;

  /** */
  void* reserved0;

  /** */
  void* reserved1;

  /** */
  void* reserved2;

  /** */
  void* reserved3;

  /** */
  void* reserved5;

  /** */
  void* reserved6;

  /** */
  void* reserved7;

  /** */
  void* reserved8;
}

/**
    Information about a color stop on a color line.
    
    Color lines typically have offsets ranging between 0 and 1,
    but that is not required.
    
    Note: despite @color being unpremultiplied here, interpolation in
    gradients shall happen in premultiplied space. See the OpenType spec
    [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
    section for details.
*/
struct hb_color_stop_t
{
  /**
      the offset of the color stop
  */
  float offset;

  /**
      whether the color is the foreground
  */
  hb_bool_t isForeground;

  /**
      the color, unpremultiplied
  */
  hb_color_t color;
}

/**
    Glyph draw callbacks.
    
    #hb_draw_move_to_func_t, #hb_draw_line_to_func_t and
    #hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
    #hb_draw_quadratic_to_func_t calls to #hb_draw_cubic_to_func_t if the
    callback isn't defined.
*/
struct hb_draw_funcs_t;

/**
    Data type for holding font faces.
*/
struct hb_face_t;

/**
    The #hb_feature_t is the structure that holds information about requested
    feature application. The feature will be applied with the given value to all
    glyphs which are in clusters between @start (inclusive) and @end (exclusive).
    Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
    specifies that the feature always applies to the entire buffer.
*/
struct hb_feature_t
{
  /**
      The #hb_tag_t tag of the feature
  */
  hb_tag_t tag;

  /**
      The value of the feature. 0 disables the feature, non-zero (usually
      1) enables the feature.  For features implemented as lookup type 3 (like
      'salt') the @value is a one based index into the alternates.
  */
  uint value;

  /**
      the cluster to start applying this feature setting (inclusive).
  */
  uint start;

  /**
      the cluster to end applying this feature setting (exclusive).
  */
  uint end;
}

/**
    Data type for holding fonts.
*/
struct hb_font_t;

/**
    Font-wide extent values, measured in font units.
    
    Note that typically @ascender is positive and @descender
    negative, in coordinate systems that grow up.
*/
struct hb_font_extents_t
{
  /**
      The height of typographic ascenders.
  */
  hb_position_t ascender;

  /**
      The depth of typographic descenders.
  */
  hb_position_t descender;

  /**
      The suggested line-spacing gap.
  */
  hb_position_t lineGap;

  /** */
  hb_position_t reserved9;

  /** */
  hb_position_t reserved8;

  /** */
  hb_position_t reserved7;

  /** */
  hb_position_t reserved6;

  /** */
  hb_position_t reserved5;

  /** */
  hb_position_t reserved4;

  /** */
  hb_position_t reserved3;

  /** */
  hb_position_t reserved2;

  /** */
  hb_position_t reserved1;
}

/**
    Data type containing a set of virtual methods used for
    working on #hb_font_t font objects.
    
    HarfBuzz provides a lightweight default function for each of
    the methods in #hb_font_funcs_t. Client programs can implement
    their own replacements for the individual font functions, as
    needed, and replace the default by calling the setter for a
    method.
*/
struct hb_font_funcs_t;

/**
    Glyph extent values, measured in font units.
    
    Note that @height is negative, in coordinate systems that grow up.
*/
struct hb_glyph_extents_t
{
  /**
      Distance from the x-origin to the left extremum of the glyph.
  */
  hb_position_t xBearing;

  /**
      Distance from the top extremum of the glyph to the y-origin.
  */
  hb_position_t yBearing;

  /**
      Distance from the left extremum of the glyph to the right extremum.
  */
  hb_position_t width;

  /**
      Distance from the top extremum of the glyph to the bottom extremum.
  */
  hb_position_t height;
}

/**
    Data type for languages. Each #hb_language_t corresponds to a BCP 47
    language tag.
*/
alias hb_language_t = hb_language_t_st*;

struct hb_language_t_st;

/**
    Data type for holding integer-to-integer hash maps.
*/
struct hb_map_t;

/**
    Pairs of glyph and color index.
    
    A color index of 0xFFFF does not refer to a palette
    color, but indicates that the foreground color should
    be used.
*/
struct hb_ot_color_layer_t
{
  /**
      the glyph ID of the layer
  */
  hb_codepoint_t glyph;

  /**
      the palette color index of the layer
  */
  uint colorIndex;
}

/**
    Data type to hold information for a "part" component of a math-variant glyph.
    Large variants for stretchable math glyphs (such as parentheses) can be constructed
    on the fly from parts.
*/
struct hb_ot_math_glyph_part_t
{
  /**
      The glyph index of the variant part
  */
  hb_codepoint_t glyph;

  /**
      The length of the connector on the starting side of the variant part
  */
  hb_position_t startConnectorLength;

  /**
      The length of the connector on the ending side of the variant part
  */
  hb_position_t endConnectorLength;

  /**
      The total advance of the part
  */
  hb_position_t fullAdvance;

  /**
      #hb_ot_math_glyph_part_flags_t flags for the part
  */
  hb_ot_math_glyph_part_flags_t flags;
}

/**
    Data type to hold math-variant information for a glyph.
*/
struct hb_ot_math_glyph_variant_t
{
  /**
      The glyph index of the variant
  */
  hb_codepoint_t glyph;

  /**
      The advance width of the variant
  */
  hb_position_t advance;
}

/**
    Data type to hold math kerning (cut-in) information for a glyph.
*/
struct hb_ot_math_kern_entry_t
{
  /**
      The maximum height at which this entry should be used
  */
  hb_position_t maxCorrectionHeight;

  /**
      The kern value of the entry
  */
  hb_position_t kernValue;
}

/**
    Structure representing a name ID in a particular language.
*/
struct hb_ot_name_entry_t
{
  /**
      name ID
  */
  hb_ot_name_id_t nameId;

  /** */
  hb_var_int_t var;

  /**
      language
  */
  hb_language_t language;
}

/**
    Use #hb_ot_var_axis_info_t instead.
*/
struct hb_ot_var_axis_t
{
  /**
      axis tag
  */
  hb_tag_t tag;

  /**
      axis name identifier
  */
  hb_ot_name_id_t nameId;

  /**
      minimum value of the axis
  */
  float minValue;

  /**
      default value of the axis
  */
  float defaultValue;

  /**
      maximum value of the axis
  */
  float maxValue;
}

/**
    Data type for holding variation-axis values.
    
    The minimum, default, and maximum values are in un-normalized, user scales.
    
    <note>Note: at present, the only flag defined for @flags is
    #HB_OT_VAR_AXIS_FLAG_HIDDEN.</note>
*/
struct hb_ot_var_axis_info_t
{
  /**
      Index of the axis in the variation-axis array
  */
  uint axisIndex;

  /**
      The #hb_tag_t tag identifying the design variation of the axis
  */
  hb_tag_t tag;

  /**
      The `name` table Name ID that provides display names for the axis
  */
  hb_ot_name_id_t nameId;

  /**
      The #hb_ot_var_axis_flags_t flags for the axis
  */
  hb_ot_var_axis_flags_t flags;

  /**
      The minimum value on the variation axis that the font covers
  */
  float minValue;

  /**
      The position on the variation axis corresponding to the font's defaults
  */
  float defaultValue;

  /**
      The maximum value on the variation axis that the font covers
  */
  float maxValue;

  /** */
  uint reserved;
}

/**
    Glyph paint callbacks.
    
    The callbacks assume that the caller maintains a stack
    of current transforms, clips and intermediate surfaces,
    as evidenced by the pairs of push/pop callbacks. The
    push/pop calls will be properly nested, so it is fine
    to store the different kinds of object on a single stack.
    
    Not all callbacks are required for all kinds of glyphs.
    For rendering COLRv0 or non-color outline glyphs, the
    gradient callbacks are not needed, and the composite
    callback only needs to handle simple alpha compositing
    (#HB_PAINT_COMPOSITE_MODE_SRC_OVER).
    
    The paint-image callback is only needed for glyphs
    with image blobs in the CBDT, sbix or SVG tables.
    
    The custom-palette-color callback is only necessary if
    you want to override colors from the font palette with
    custom colors.
*/
struct hb_paint_funcs_t;

/**
    The structure that holds various text properties of an #hb_buffer_t. Can be
    set and retrieved using [harfbuzz.global.bufferSetSegmentProperties] and
    [harfbuzz.global.bufferGetSegmentProperties], respectively.
*/
struct hb_segment_properties_t
{
  /**
      the #hb_direction_t of the buffer, see [harfbuzz.global.bufferSetDirection].
  */
  hb_direction_t direction;

  /**
      the #hb_script_t of the buffer, see [harfbuzz.global.bufferSetScript].
  */
  hb_script_t script;

  /**
      the #hb_language_t of the buffer, see [harfbuzz.global.bufferSetLanguage].
  */
  hb_language_t language;

  /** */
  void* reserved1;

  /** */
  void* reserved2;
}

/**
    Data type for holding a set of integers. #hb_set_t's are
    used to gather and contain glyph IDs, Unicode code
    points, and various other collections of discrete
    values.
*/
struct hb_set_t;

/**
    Data type for holding a shaping plan.
    
    Shape plans contain information about how HarfBuzz will shape a
    particular text segment, based on the segment's properties and the
    capabilities in the font face in use.
    
    Shape plans can be queried about how shaping will perform, given a set
    of specific input parameters (script, language, direction, features,
    etc.).
*/
struct hb_shape_plan_t;

/**
    Data type containing a set of virtual methods used for
    accessing various Unicode character properties.
    
    HarfBuzz provides a default function for each of the
    methods in #hb_unicode_funcs_t. Client programs can implement
    their own replacements for the individual Unicode functions, as
    needed, and replace the default by calling the setter for a
    method.
*/
struct hb_unicode_funcs_t;

/**
    Data structure for holding user-data keys.
*/
struct hb_user_data_key_t
{
  /** */
  char unused;
}

/** */
union hb_var_int_t
{
  /** */
  uint u32;

  /** */
  int i32;

  /** */
  ushort[2] u16;

  /** */
  short[2] i16;

  /** */
  ubyte[4] u8;

  /** */
  byte[4] i8;
}

/** */
union hb_var_num_t
{
  /** */
  float f;

  /** */
  uint u32;

  /** */
  int i32;

  /** */
  ushort[2] u16;

  /** */
  short[2] i16;

  /** */
  ubyte[4] u8;

  /** */
  byte[4] i8;
}

/**
    Data type for holding variation data. Registered OpenType
    variation-axis tags are listed in
    [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*/
struct hb_variation_t
{
  /**
      The #hb_tag_t tag of the variation-axis name
  */
  hb_tag_t tag;

  /**
      The value of the variation axis
  */
  float value;
}

/**
    Current drawing state.
*/
struct hb_draw_state_t
{
  /**
      Whether there is an open path
  */
  hb_bool_t pathOpen;

  /**
      X component of the start of current path
  */
  float pathStartX;

  /**
      Y component of the start of current path
  */
  float pathStartY;

  /**
      X component of current point
  */
  float currentX;

  /**
      Y component of current point
  */
  float currentY;

  /** */
  hb_var_num_t reserved1;

  /** */
  hb_var_num_t reserved2;

  /** */
  hb_var_num_t reserved3;

  /** */
  hb_var_num_t reserved4;

  /** */
  hb_var_num_t reserved5;

  /** */
  hb_var_num_t reserved6;

  /** */
  hb_var_num_t reserved7;
}

/**
    The #hb_glyph_info_t is the structure that holds information about the
    glyphs and their relation to input text.
*/
struct hb_glyph_info_t
{
  /**
      either a Unicode code point (before shaping) or a glyph index
                  (after shaping).
  */
  hb_codepoint_t codepoint;

  /** */
  hb_mask_t mask;

  /**
      the index of the character in the original text that corresponds
                to this #hb_glyph_info_t, or whatever the client passes to
                [harfbuzz.global.bufferAdd]. More than one #hb_glyph_info_t can have the same
                @cluster value, if they resulted from the same character (e.g. one
                to many glyph substitution), and when more than one character gets
                merged in the same glyph (e.g. many to one glyph substitution) the
                #hb_glyph_info_t will have the smallest cluster value of them.
                By default some characters are merged into the same cluster
                (e.g. combining marks have the same cluster as their bases)
                even if they are separate glyphs, [harfbuzz.global.bufferSetClusterLevel]
                allow selecting more fine-grained cluster handling.
  */
  uint cluster;

  /** */
  hb_var_int_t var1;

  /** */
  hb_var_int_t var2;
}

/**
    The #hb_glyph_position_t is the structure that holds the positions of the
    glyph in both horizontal and vertical directions. All positions in
    #hb_glyph_position_t are relative to the current point.
*/
struct hb_glyph_position_t
{
  /**
      how much the line advances after drawing this glyph when setting
                  text in horizontal direction.
  */
  hb_position_t xAdvance;

  /**
      how much the line advances after drawing this glyph when setting
                  text in vertical direction.
  */
  hb_position_t yAdvance;

  /**
      how much the glyph moves on the X-axis before drawing it, this
                 should not affect how much the line advances.
  */
  hb_position_t xOffset;

  /**
      how much the glyph moves on the Y-axis before drawing it, this
                 should not affect how much the line advances.
  */
  hb_position_t yOffset;

  /** */
  hb_var_int_t var;
}

alias extern(C) hb_bool_t function(hb_buffer_t* buffer, hb_font_t* font, const(char)* message, void* userData) hb_buffer_message_func_t;

alias extern(C) uint function(hb_color_line_t* colorLine, void* colorLineData, uint start, uint* count, hb_color_stop_t* colorStops, void* userData) hb_color_line_get_color_stops_func_t;

alias extern(C) hb_paint_extend_t function(hb_color_line_t* colorLine, void* colorLineData, void* userData) hb_color_line_get_extend_func_t;

alias extern(C) void function(void* userData) hb_destroy_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, void* userData) hb_draw_close_path_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float control1X, float control1Y, float control2X, float control2Y, float toX, float toY, void* userData) hb_draw_cubic_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData) hb_draw_line_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float toX, float toY, void* userData) hb_draw_move_to_func_t;

alias extern(C) void function(hb_draw_funcs_t* dfuncs, void* drawData, hb_draw_state_t* st, float controlX, float controlY, float toX, float toY, void* userData) hb_draw_quadratic_to_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData) hb_font_draw_glyph_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_font_extents_t* extents, void* userData) hb_font_get_font_extents_func_t;

alias extern(C) hb_position_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, void* userData) hb_font_get_glyph_advance_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, uint count, const(hb_codepoint_t)* firstGlyph, uint glyphStride, hb_position_t* firstAdvance, uint advanceStride, void* userData) hb_font_get_glyph_advances_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, uint pointIndex, hb_position_t* x, hb_position_t* y, void* userData) hb_font_get_glyph_contour_point_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_glyph_extents_t* extents, void* userData) hb_font_get_glyph_extents_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, const(char)* name, int len, hb_codepoint_t* glyph, void* userData) hb_font_get_glyph_from_name_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData) hb_font_get_glyph_func_t;

alias extern(C) hb_position_t function(hb_font_t* font, void* fontData, hb_codepoint_t firstGlyph, hb_codepoint_t secondGlyph, void* userData) hb_font_get_glyph_kerning_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, char* name, uint size, void* userData) hb_font_get_glyph_name_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y, void* userData) hb_font_get_glyph_origin_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_draw_funcs_t* drawFuncs, void* drawData, void* userData) hb_font_get_glyph_shape_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t* glyph, void* userData) hb_font_get_nominal_glyph_func_t;

alias extern(C) uint function(hb_font_t* font, void* fontData, uint count, const(hb_codepoint_t)* firstUnicode, uint unicodeStride, hb_codepoint_t* firstGlyph, uint glyphStride, void* userData) hb_font_get_nominal_glyphs_func_t;

alias extern(C) hb_bool_t function(hb_font_t* font, void* fontData, hb_codepoint_t unicode, hb_codepoint_t variationSelector, hb_codepoint_t* glyph, void* userData) hb_font_get_variation_glyph_func_t;

alias extern(C) void function(hb_font_t* font, void* fontData, hb_codepoint_t glyph, hb_paint_funcs_t* paintFuncs, void* paintData, uint paletteIndex, hb_color_t foreground, void* userData) hb_font_paint_glyph_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_bool_t isForeground, hb_color_t color, void* userData) hb_paint_color_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData) hb_paint_color_glyph_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, uint colorIndex, hb_color_t* color, void* userData) hb_paint_custom_palette_color_func_t;

alias extern(C) hb_bool_t function(hb_paint_funcs_t* funcs, void* paintData, hb_blob_t* image, uint width, uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents, void* userData) hb_paint_image_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float x1, float y1, float x2, float y2, void* userData) hb_paint_linear_gradient_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_pop_clip_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_paint_composite_mode_t mode, void* userData) hb_paint_pop_group_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_pop_transform_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_codepoint_t glyph, hb_font_t* font, void* userData) hb_paint_push_clip_glyph_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xmin, float ymin, float xmax, float ymax, void* userData) hb_paint_push_clip_rectangle_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, void* userData) hb_paint_push_group_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, float xx, float yx, float xy, float yy, float dx, float dy, void* userData) hb_paint_push_transform_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float r0, float x1, float y1, float r1, void* userData) hb_paint_radial_gradient_func_t;

alias extern(C) void function(hb_paint_funcs_t* funcs, void* paintData, hb_color_line_t* colorLine, float x0, float y0, float startAngle, float endAngle, void* userData) hb_paint_sweep_gradient_func_t;

alias extern(C) hb_blob_t* function(hb_face_t* face, hb_tag_t tag, void* userData) hb_reference_table_func_t;

alias extern(C) hb_unicode_combining_class_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_combining_class_func_t;

alias extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, hb_codepoint_t* ab, void* userData) hb_unicode_compose_func_t;

alias extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t u, hb_codepoint_t* decomposed, void* userData) hb_unicode_decompose_compatibility_func_t;

alias extern(C) hb_bool_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, hb_codepoint_t* a, hb_codepoint_t* b, void* userData) hb_unicode_decompose_func_t;

alias extern(C) uint function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_eastasian_width_func_t;

alias extern(C) hb_unicode_general_category_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_general_category_func_t;

alias extern(C) hb_codepoint_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_mirroring_func_t;

alias extern(C) hb_script_t function(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* userData) hb_unicode_script_func_t;

