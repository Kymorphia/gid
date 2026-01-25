/// D types for pango1 library
module pango.types;

import gid.gid;
import pango.attribute;
import pango.c.functions;
import pango.c.types;
import pango.font;
import pango.fontset;
import pango.glyph_item;


// Aliases

/** */
alias Glyph = PangoGlyph;

/** */
alias GlyphUnit = PangoGlyphUnit;

/** */
alias LayoutRun = pango.glyph_item.GlyphItem;

// Enums

/** */
alias Alignment = PangoAlignment;

/** */
alias AttrType = PangoAttrType;

/** */
alias BaselineShift = PangoBaselineShift;

/** */
alias BidiType = PangoBidiType;

/** */
alias CoverageLevel = PangoCoverageLevel;

/** */
alias Direction = PangoDirection;

/** */
alias EllipsizeMode = PangoEllipsizeMode;

/** */
alias FontMask = PangoFontMask;

/** */
alias FontScale = PangoFontScale;

/** */
alias Gravity = PangoGravity;

/** */
alias GravityHint = PangoGravityHint;

/** */
alias LayoutDeserializeError = PangoLayoutDeserializeError;

/** */
alias LayoutDeserializeFlags = PangoLayoutDeserializeFlags;

/** */
alias LayoutSerializeFlags = PangoLayoutSerializeFlags;

/** */
alias Overline = PangoOverline;

/** */
alias RenderPart = PangoRenderPart;

/** */
alias Script = PangoScript;

/** */
alias ShapeFlags = PangoShapeFlags;

/** */
alias ShowFlags = PangoShowFlags;

/** */
alias Stretch = PangoStretch;

/** */
alias Style = PangoStyle;

/** */
alias TabAlign = PangoTabAlign;

/** */
alias TextTransform = PangoTextTransform;

/** */
alias Underline = PangoUnderline;

/** */
alias Variant = PangoVariant;

/** */
alias Weight = PangoWeight;

/** */
alias WrapMode = PangoWrapMode;

// Structs

/** */
alias GlyphGeometry = PangoGlyphGeometry;

/** */
alias GlyphVisAttr = PangoGlyphVisAttr;

/** */
alias LogAttr = PangoLogAttr;

/** */
alias Rectangle = PangoRectangle;

// Callbacks

/**
    Type of a function that can duplicate user data for an attribute.
    Returns: new copy of user_data.
*/
alias AttrDataCopyFunc = void* delegate();

/**
    Type of a function filtering a list of attributes.

    Params:
      attribute = a Pango attribute
    Returns: true if the attribute should be selected for
        filtering, false otherwise.
*/
alias AttrFilterFunc = bool delegate(pango.attribute.Attribute attribute);

/**
    Callback used when enumerating fonts in a fontset.
    
    See [pango.fontset.Fontset.foreach_].

    Params:
      fontset = a [pango.fontset.Fontset]
      font = a font from fontset
    Returns: if true, stop iteration and return immediately.
*/
alias FontsetForeachFunc = bool delegate(pango.fontset.Fontset fontset, pango.font.Font font);

/**
    Whether the segment should be shifted to center around the baseline.
    
    This is mainly used in vertical writing directions.
*/
enum ANALYSIS_FLAG_CENTERED_BASELINE = 1;

/**
    Whether this run holds ellipsized text.
*/
enum ANALYSIS_FLAG_IS_ELLIPSIS = 2;

/**
    Whether to add a hyphen at the end of the run during shaping.
*/
enum ANALYSIS_FLAG_NEED_HYPHEN = 4;

/**
    Value for @start_index in [pango.attribute.Attribute] that indicates
    the beginning of the text.
*/
enum ATTR_INDEX_FROM_TEXT_BEGINNING = 0;

/**
    Value for @end_index in [pango.attribute.Attribute] that indicates
    the end of the text.
*/
enum ATTR_INDEX_TO_TEXT_END = 4294967295;

/**
    A `PangoGlyph` value that indicates a zero-width empty glpyh.
    
    This is useful for example in shaper modules, to use as the glyph for
    various zero-width Unicode characters (those passing `func@is_zero_width`).
*/
enum GLYPH_EMPTY = 268435455;

/**
    A `PangoGlyph` value for invalid input.
    
    [pango.layout.Layout] produces one such glyph per invalid input UTF-8 byte and such
    a glyph is rendered as a crossed box.
    
    Note that this value is defined such that it has the [pango.types.GLYPH_UNKNOWN_FLAG]
    set.
*/
enum GLYPH_INVALID_INPUT = 4294967295;

/**
    Flag used in `PangoGlyph` to turn a `gunichar` value of a valid Unicode
    character into an unknown-character glyph for that `gunichar`.
    
    Such unknown-character glyphs may be rendered as a 'hex box'.
*/
enum GLYPH_UNKNOWN_FLAG = 268435456;

/**
    The scale between dimensions used for Pango distances and device units.
    
    The definition of device units is dependent on the output device; it will
    typically be pixels for a screen, and points for a printer. [pango.types.SCALE] is
    currently 1024, but this may be changed in the future.
    
    When setting font sizes, device units are always considered to be
    points (as in "12 point font"), rather than pixels.
*/
enum SCALE = 1024;

/**
    The major component of the version of Pango available at compile-time.
*/
enum VERSION_MAJOR = 1;

/**
    The micro component of the version of Pango available at compile-time.
*/
enum VERSION_MICRO = 1;

/**
    The minor component of the version of Pango available at compile-time.
*/
enum VERSION_MINOR = 52;

/**
    A string literal containing the version of Pango available at compile-time.
*/
enum VERSION_STRING = "1.52.1";
