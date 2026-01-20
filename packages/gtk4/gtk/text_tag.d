/// Module for [TextTag] class
module gtk.text_tag;

import gdk.rgba;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import pango.font_description;
import pango.tab_array;
import pango.types;

/**
    A tag that can be applied to text contained in a [gtk.text_buffer.TextBuffer].
    
    You may wish to begin by reading the
    [text widget conceptual overview](section-text-widget.html),
    which gives an overview of all the objects and data types
    related to the text widget and how they work together.
    
    Tags should be in the [gtk.text_tag_table.TextTagTable] for a given
    [gtk.text_buffer.TextBuffer] before using them with that buffer.
    
    [gtk.text_buffer.TextBuffer.createTag] is the best way to create tags.
    See “gtk4-demo” for numerous examples.
    
    For each property of [gtk.text_tag.TextTag], there is a “set” property, e.g.
    “font-set” corresponds to “font”. These “set” properties reflect
    whether a property has been set or not.
    
    They are maintained by GTK and you should not set them independently.
*/
class TextTag : gobject.object.ObjectWrap
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
    return cast(void function())gtk_text_tag_get_type != &gidSymbolNotFound ? gtk_text_tag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextTag self()
  {
    return this;
  }

  /**
      Get `accumulativeMargin` property.
      Returns: Whether the margins accumulate or override each other.
        
        When set to true the margins of this tag are added to the margins
        of any other non-accumulative margins present. When set to false
        the margins override one another (the default).
  */
  @property bool accumulativeMargin()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("accumulative-margin");
  }

  /**
      Set `accumulativeMargin` property.
      Params:
        propval = Whether the margins accumulate or override each other.
          
          When set to true the margins of this tag are added to the margins
          of any other non-accumulative margins present. When set to false
          the margins override one another (the default).
  */
  @property void accumulativeMargin(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("accumulative-margin", propval);
  }

  /**
      Get `allowBreaks` property.
      Returns: Whether breaks are allowed.
  */
  @property bool allowBreaks()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-breaks");
  }

  /**
      Set `allowBreaks` property.
      Params:
        propval = Whether breaks are allowed.
  */
  @property void allowBreaks(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-breaks", propval);
  }

  /** */
  @property bool allowBreaksSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-breaks-set");
  }

  /** */
  @property void allowBreaksSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-breaks-set", propval);
  }

  /**
      Set `background` property.
      Params:
        propval = Background color as a string.
  */
  @property void background(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("background", propval);
  }

  /**
      Get `backgroundFullHeight` property.
      Returns: Whether the background color fills the entire line height
        or only the height of the tagged characters.
  */
  @property bool backgroundFullHeight()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-full-height");
  }

  /**
      Set `backgroundFullHeight` property.
      Params:
        propval = Whether the background color fills the entire line height
          or only the height of the tagged characters.
  */
  @property void backgroundFullHeight(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-full-height", propval);
  }

  /** */
  @property bool backgroundFullHeightSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-full-height-set");
  }

  /** */
  @property void backgroundFullHeightSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-full-height-set", propval);
  }

  /**
      Get `backgroundRgba` property.
      Returns: Background color as a [gdk.rgba.RGBA].
  */
  @property gdk.rgba.RGBA backgroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("background-rgba");
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a [gdk.rgba.RGBA].
  */
  @property void backgroundRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("background-rgba", propval);
  }

  /** */
  @property bool backgroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property void backgroundSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-set", propval);
  }

  /**
      Get `direction` property.
      Returns: Text direction, e.g. right-to-left or left-to-right.
  */
  @property gtk.types.TextDirection direction()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.TextDirection)("direction");
  }

  /**
      Set `direction` property.
      Params:
        propval = Text direction, e.g. right-to-left or left-to-right.
  */
  @property void direction(gtk.types.TextDirection propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.TextDirection)("direction", propval);
  }

  /**
      Get `editable` property.
      Returns: Whether the text can be modified by the user.
  */
  @property bool editable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /**
      Set `editable` property.
      Params:
        propval = Whether the text can be modified by the user.
  */
  @property void editable(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editable", propval);
  }

  /** */
  @property bool editableSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable-set");
  }

  /** */
  @property void editableSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editable-set", propval);
  }

  /**
      Get `fallback` property.
      Returns: Whether font fallback is enabled.
        
        When set to true, other fonts will be substituted
        where the current font is missing glyphs.
  */
  @property bool fallback()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("fallback");
  }

  /**
      Set `fallback` property.
      Params:
        propval = Whether font fallback is enabled.
          
          When set to true, other fonts will be substituted
          where the current font is missing glyphs.
  */
  @property void fallback(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("fallback", propval);
  }

  /** */
  @property bool fallbackSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("fallback-set");
  }

  /** */
  @property void fallbackSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("fallback-set", propval);
  }

  /**
      Get `family` property.
      Returns: Name of the font family, e.g. Sans, Helvetica, Times, Monospace.
  */
  @property string family()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("family");
  }

  /**
      Set `family` property.
      Params:
        propval = Name of the font family, e.g. Sans, Helvetica, Times, Monospace.
  */
  @property void family(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("family", propval);
  }

  /** */
  @property bool familySet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("family-set");
  }

  /** */
  @property void familySet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("family-set", propval);
  }

  /**
      Get `font` property.
      Returns: Font description as string, e.g. \"Sans Italic 12\".
        
        Note that the initial value of this property depends on
        the internals of [pango.font_description.FontDescription].
  */
  @property string font()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("font");
  }

  /**
      Set `font` property.
      Params:
        propval = Font description as string, e.g. \"Sans Italic 12\".
          
          Note that the initial value of this property depends on
          the internals of [pango.font_description.FontDescription].
  */
  @property void font(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("font", propval);
  }

  /**
      Get `fontDesc` property.
      Returns: Font description as a [pango.font_description.FontDescription].
  */
  @property pango.font_description.FontDescription fontDesc()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.font_description.FontDescription)("font-desc");
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = Font description as a [pango.font_description.FontDescription].
  */
  @property void fontDesc(pango.font_description.FontDescription propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.font_description.FontDescription)("font-desc", propval);
  }

  /**
      Get `fontFeatures` property.
      Returns: OpenType font features, as a string.
  */
  @property string fontFeatures()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("font-features");
  }

  /**
      Set `fontFeatures` property.
      Params:
        propval = OpenType font features, as a string.
  */
  @property void fontFeatures(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("font-features", propval);
  }

  /** */
  @property bool fontFeaturesSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("font-features-set");
  }

  /** */
  @property void fontFeaturesSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("font-features-set", propval);
  }

  /**
      Set `foreground` property.
      Params:
        propval = Foreground color as a string.
  */
  @property void foreground(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("foreground", propval);
  }

  /**
      Get `foregroundRgba` property.
      Returns: Foreground color as a [gdk.rgba.RGBA].
  */
  @property gdk.rgba.RGBA foregroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("foreground-rgba");
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a [gdk.rgba.RGBA].
  */
  @property void foregroundRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("foreground-rgba", propval);
  }

  /** */
  @property bool foregroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("foreground-set");
  }

  /** */
  @property void foregroundSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("foreground-set", propval);
  }

  /**
      Get `indent` property.
      Returns: Amount to indent the paragraph, in pixels.
        
        A negative value of indent will produce a hanging indentation.
        That is, the first line will have the full width, and subsequent
        lines will be indented by the absolute value of indent.
  */
  @property int indent()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("indent");
  }

  /**
      Set `indent` property.
      Params:
        propval = Amount to indent the paragraph, in pixels.
          
          A negative value of indent will produce a hanging indentation.
          That is, the first line will have the full width, and subsequent
          lines will be indented by the absolute value of indent.
  */
  @property void indent(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("indent", propval);
  }

  /** */
  @property bool indentSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("indent-set");
  }

  /** */
  @property void indentSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("indent-set", propval);
  }

  /**
      Get `insertHyphens` property.
      Returns: Whether to insert hyphens at breaks.
  */
  @property bool insertHyphens()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("insert-hyphens");
  }

  /**
      Set `insertHyphens` property.
      Params:
        propval = Whether to insert hyphens at breaks.
  */
  @property void insertHyphens(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("insert-hyphens", propval);
  }

  /** */
  @property bool insertHyphensSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("insert-hyphens-set");
  }

  /** */
  @property void insertHyphensSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("insert-hyphens-set", propval);
  }

  /**
      Get `invisible` property.
      Returns: Whether this text is hidden.
        
        Note that there may still be problems with the support for invisible
        text, in particular when navigating programmatically inside a buffer
        containing invisible segments.
  */
  @property bool invisible()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("invisible");
  }

  /**
      Set `invisible` property.
      Params:
        propval = Whether this text is hidden.
          
          Note that there may still be problems with the support for invisible
          text, in particular when navigating programmatically inside a buffer
          containing invisible segments.
  */
  @property void invisible(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible", propval);
  }

  /** */
  @property bool invisibleSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("invisible-set");
  }

  /** */
  @property void invisibleSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible-set", propval);
  }

  /**
      Get `justification` property.
      Returns: Left, right, or center justification.
  */
  @property gtk.types.Justification justification()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Justification)("justification");
  }

  /**
      Set `justification` property.
      Params:
        propval = Left, right, or center justification.
  */
  @property void justification(gtk.types.Justification propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.Justification)("justification", propval);
  }

  /** */
  @property bool justificationSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("justification-set");
  }

  /** */
  @property void justificationSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("justification-set", propval);
  }

  /**
      Get `language` property.
      Returns: The language this text is in, as an ISO code.
        
        Pango can use this as a hint when rendering the text.
        If not set, an appropriate default will be used.
        
        Note that the initial value of this property depends
        on the current locale, see also `func@Gtk.get_default_language`.
  */
  @property string language()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("language");
  }

  /**
      Set `language` property.
      Params:
        propval = The language this text is in, as an ISO code.
          
          Pango can use this as a hint when rendering the text.
          If not set, an appropriate default will be used.
          
          Note that the initial value of this property depends
          on the current locale, see also `func@Gtk.get_default_language`.
  */
  @property void language(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("language", propval);
  }

  /** */
  @property bool languageSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("language-set");
  }

  /** */
  @property void languageSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("language-set", propval);
  }

  /**
      Get `leftMargin` property.
      Returns: Width of the left margin in pixels.
  */
  @property int leftMargin()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("left-margin");
  }

  /**
      Set `leftMargin` property.
      Params:
        propval = Width of the left margin in pixels.
  */
  @property void leftMargin(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("left-margin", propval);
  }

  /** */
  @property bool leftMarginSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("left-margin-set");
  }

  /** */
  @property void leftMarginSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("left-margin-set", propval);
  }

  /**
      Get `letterSpacing` property.
      Returns: Extra spacing between graphemes, in Pango units.
  */
  @property int letterSpacing()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("letter-spacing");
  }

  /**
      Set `letterSpacing` property.
      Params:
        propval = Extra spacing between graphemes, in Pango units.
  */
  @property void letterSpacing(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("letter-spacing", propval);
  }

  /** */
  @property bool letterSpacingSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("letter-spacing-set");
  }

  /** */
  @property void letterSpacingSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("letter-spacing-set", propval);
  }

  /**
      Get `lineHeight` property.
      Returns: Factor to scale line height by.
  */
  @property float lineHeight()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("line-height");
  }

  /**
      Set `lineHeight` property.
      Params:
        propval = Factor to scale line height by.
  */
  @property void lineHeight(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("line-height", propval);
  }

  /** */
  @property bool lineHeightSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("line-height-set");
  }

  /** */
  @property void lineHeightSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("line-height-set", propval);
  }

  /**
      Get `overline` property.
      Returns: Style of overline for this text.
  */
  @property pango.types.Overline overline()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Overline)("overline");
  }

  /**
      Set `overline` property.
      Params:
        propval = Style of overline for this text.
  */
  @property void overline(pango.types.Overline propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Overline)("overline", propval);
  }

  /**
      Get `overlineRgba` property.
      Returns: This property modifies the color of overlines.
        
        If not set, overlines will use the foreground color.
  */
  @property gdk.rgba.RGBA overlineRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("overline-rgba");
  }

  /**
      Set `overlineRgba` property.
      Params:
        propval = This property modifies the color of overlines.
          
          If not set, overlines will use the foreground color.
  */
  @property void overlineRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("overline-rgba", propval);
  }

  /** */
  @property bool overlineRgbaSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("overline-rgba-set");
  }

  /** */
  @property void overlineRgbaSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("overline-rgba-set", propval);
  }

  /** */
  @property bool overlineSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("overline-set");
  }

  /** */
  @property void overlineSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("overline-set", propval);
  }

  /**
      Set `paragraphBackground` property.
      Params:
        propval = The paragraph background color as a string.
  */
  @property void paragraphBackground(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("paragraph-background", propval);
  }

  /**
      Get `paragraphBackgroundRgba` property.
      Returns: The paragraph background color as a [gdk.rgba.RGBA].
  */
  @property gdk.rgba.RGBA paragraphBackgroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("paragraph-background-rgba");
  }

  /**
      Set `paragraphBackgroundRgba` property.
      Params:
        propval = The paragraph background color as a [gdk.rgba.RGBA].
  */
  @property void paragraphBackgroundRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("paragraph-background-rgba", propval);
  }

  /** */
  @property bool paragraphBackgroundSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("paragraph-background-set");
  }

  /** */
  @property void paragraphBackgroundSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("paragraph-background-set", propval);
  }

  /**
      Get `pixelsAboveLines` property.
      Returns: Pixels of blank space above paragraphs.
  */
  @property int pixelsAboveLines()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-above-lines");
  }

  /**
      Set `pixelsAboveLines` property.
      Params:
        propval = Pixels of blank space above paragraphs.
  */
  @property void pixelsAboveLines(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("pixels-above-lines", propval);
  }

  /** */
  @property bool pixelsAboveLinesSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("pixels-above-lines-set");
  }

  /** */
  @property void pixelsAboveLinesSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("pixels-above-lines-set", propval);
  }

  /**
      Get `pixelsBelowLines` property.
      Returns: Pixels of blank space below paragraphs.
  */
  @property int pixelsBelowLines()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-below-lines");
  }

  /**
      Set `pixelsBelowLines` property.
      Params:
        propval = Pixels of blank space below paragraphs.
  */
  @property void pixelsBelowLines(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("pixels-below-lines", propval);
  }

  /** */
  @property bool pixelsBelowLinesSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("pixels-below-lines-set");
  }

  /** */
  @property void pixelsBelowLinesSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("pixels-below-lines-set", propval);
  }

  /**
      Get `pixelsInsideWrap` property.
      Returns: Pixels of blank space between wrapped lines in a paragraph.
  */
  @property int pixelsInsideWrap()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-inside-wrap");
  }

  /**
      Set `pixelsInsideWrap` property.
      Params:
        propval = Pixels of blank space between wrapped lines in a paragraph.
  */
  @property void pixelsInsideWrap(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("pixels-inside-wrap", propval);
  }

  /** */
  @property bool pixelsInsideWrapSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("pixels-inside-wrap-set");
  }

  /** */
  @property void pixelsInsideWrapSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("pixels-inside-wrap-set", propval);
  }

  /**
      Get `rightMargin` property.
      Returns: Width of the right margin, in pixels.
  */
  @property int rightMargin()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("right-margin");
  }

  /**
      Set `rightMargin` property.
      Params:
        propval = Width of the right margin, in pixels.
  */
  @property void rightMargin(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("right-margin", propval);
  }

  /** */
  @property bool rightMarginSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("right-margin-set");
  }

  /** */
  @property void rightMarginSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("right-margin-set", propval);
  }

  /**
      Get `rise` property.
      Returns: Offset of text above the baseline, in Pango units.
        
        Negative values go below the baseline.
  */
  @property int rise()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("rise");
  }

  /**
      Set `rise` property.
      Params:
        propval = Offset of text above the baseline, in Pango units.
          
          Negative values go below the baseline.
  */
  @property void rise(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("rise", propval);
  }

  /** */
  @property bool riseSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("rise-set");
  }

  /** */
  @property void riseSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("rise-set", propval);
  }

  /**
      Get `scale` property.
      Returns: Font size as a scale factor relative to the default font size.
        
        This properly adapts to theme changes, etc. so is recommended.
        Pango predefines some scales such as `PANGO_SCALE_X_LARGE`.
  */
  @property double scale()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("scale");
  }

  /**
      Set `scale` property.
      Params:
        propval = Font size as a scale factor relative to the default font size.
          
          This properly adapts to theme changes, etc. so is recommended.
          Pango predefines some scales such as `PANGO_SCALE_X_LARGE`.
  */
  @property void scale(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("scale", propval);
  }

  /** */
  @property bool scaleSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("scale-set");
  }

  /** */
  @property void scaleSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("scale-set", propval);
  }

  /**
      Get `sentence` property.
      Returns: Whether this tag represents a single sentence.
        
        This affects cursor movement.
  */
  @property bool sentence()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("sentence");
  }

  /**
      Set `sentence` property.
      Params:
        propval = Whether this tag represents a single sentence.
          
          This affects cursor movement.
  */
  @property void sentence(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("sentence", propval);
  }

  /** */
  @property bool sentenceSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("sentence-set");
  }

  /** */
  @property void sentenceSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("sentence-set", propval);
  }

  /**
      Get `showSpaces` property.
      Returns: How to render invisible characters.
  */
  @property pango.types.ShowFlags showSpaces()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.ShowFlags)("show-spaces");
  }

  /**
      Set `showSpaces` property.
      Params:
        propval = How to render invisible characters.
  */
  @property void showSpaces(pango.types.ShowFlags propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.ShowFlags)("show-spaces", propval);
  }

  /** */
  @property bool showSpacesSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-spaces-set");
  }

  /** */
  @property void showSpacesSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-spaces-set", propval);
  }

  /**
      Get `size` property.
      Returns: Font size in Pango units.
  */
  @property int size()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("size");
  }

  /**
      Set `size` property.
      Params:
        propval = Font size in Pango units.
  */
  @property void size(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("size", propval);
  }

  /**
      Get `sizePoints` property.
      Returns: Font size in points.
  */
  @property double sizePoints()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("size-points");
  }

  /**
      Set `sizePoints` property.
      Params:
        propval = Font size in points.
  */
  @property void sizePoints(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("size-points", propval);
  }

  /** */
  @property bool sizeSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("size-set");
  }

  /** */
  @property void sizeSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("size-set", propval);
  }

  /**
      Get `stretch` property.
      Returns: Font stretch as a [pango.types.Stretch], e.g. [pango.types.Stretch.Condensed].
  */
  @property pango.types.Stretch stretch()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Stretch)("stretch");
  }

  /**
      Set `stretch` property.
      Params:
        propval = Font stretch as a [pango.types.Stretch], e.g. [pango.types.Stretch.Condensed].
  */
  @property void stretch(pango.types.Stretch propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Stretch)("stretch", propval);
  }

  /** */
  @property bool stretchSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("stretch-set");
  }

  /** */
  @property void stretchSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("stretch-set", propval);
  }

  /**
      Get `strikethrough` property.
      Returns: Whether to strike through the text.
  */
  @property bool strikethrough()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /**
      Set `strikethrough` property.
      Params:
        propval = Whether to strike through the text.
  */
  @property void strikethrough(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough", propval);
  }

  /**
      Get `strikethroughRgba` property.
      Returns: This property modifies the color of strikeouts.
        
        If not set, strikeouts will use the foreground color.
  */
  @property gdk.rgba.RGBA strikethroughRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("strikethrough-rgba");
  }

  /**
      Set `strikethroughRgba` property.
      Params:
        propval = This property modifies the color of strikeouts.
          
          If not set, strikeouts will use the foreground color.
  */
  @property void strikethroughRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("strikethrough-rgba", propval);
  }

  /**
      Get `strikethroughRgbaSet` property.
      Returns: If the `strikethrough-rgba` property has been set.
  */
  @property bool strikethroughRgbaSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-rgba-set");
  }

  /**
      Set `strikethroughRgbaSet` property.
      Params:
        propval = If the `strikethrough-rgba` property has been set.
  */
  @property void strikethroughRgbaSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough-rgba-set", propval);
  }

  /** */
  @property bool strikethroughSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-set");
  }

  /** */
  @property void strikethroughSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough-set", propval);
  }

  /**
      Get `style` property.
      Returns: Font style as a [pango.types.Style], e.g. [pango.types.Style.Italic].
  */
  @property pango.types.Style style()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Style)("style");
  }

  /**
      Set `style` property.
      Params:
        propval = Font style as a [pango.types.Style], e.g. [pango.types.Style.Italic].
  */
  @property void style(pango.types.Style propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Style)("style", propval);
  }

  /** */
  @property bool styleSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("style-set");
  }

  /** */
  @property void styleSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("style-set", propval);
  }

  /**
      Get `tabs` property.
      Returns: Custom tabs for this text.
  */
  @property pango.tab_array.TabArray tabs()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.tab_array.TabArray)("tabs");
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this text.
  */
  @property void tabs(pango.tab_array.TabArray propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.tab_array.TabArray)("tabs", propval);
  }

  /** */
  @property bool tabsSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("tabs-set");
  }

  /** */
  @property void tabsSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("tabs-set", propval);
  }

  /**
      Get `textTransform` property.
      Returns: How to transform the text for display.
  */
  @property pango.types.TextTransform textTransform()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.TextTransform)("text-transform");
  }

  /**
      Set `textTransform` property.
      Params:
        propval = How to transform the text for display.
  */
  @property void textTransform(pango.types.TextTransform propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.TextTransform)("text-transform", propval);
  }

  /** */
  @property bool textTransformSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("text-transform-set");
  }

  /** */
  @property void textTransformSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("text-transform-set", propval);
  }

  /**
      Get `underline` property.
      Returns: Style of underline for this text.
  */
  @property pango.types.Underline underline()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Underline)("underline");
  }

  /**
      Set `underline` property.
      Params:
        propval = Style of underline for this text.
  */
  @property void underline(pango.types.Underline propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Underline)("underline", propval);
  }

  /**
      Get `underlineRgba` property.
      Returns: This property modifies the color of underlines.
        
        If not set, underlines will use the foreground color.
        
        If [gtk.text_tag.TextTag.underline] is set to [pango.types.Underline.Error],
        an alternate color may be applied instead of the foreground. Setting
        this property will always override those defaults.
  */
  @property gdk.rgba.RGBA underlineRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("underline-rgba");
  }

  /**
      Set `underlineRgba` property.
      Params:
        propval = This property modifies the color of underlines.
          
          If not set, underlines will use the foreground color.
          
          If [gtk.text_tag.TextTag.underline] is set to [pango.types.Underline.Error],
          an alternate color may be applied instead of the foreground. Setting
          this property will always override those defaults.
  */
  @property void underlineRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("underline-rgba", propval);
  }

  /**
      Get `underlineRgbaSet` property.
      Returns: If the `underline-rgba` property has been set.
  */
  @property bool underlineRgbaSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-rgba-set");
  }

  /**
      Set `underlineRgbaSet` property.
      Params:
        propval = If the `underline-rgba` property has been set.
  */
  @property void underlineRgbaSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("underline-rgba-set", propval);
  }

  /** */
  @property bool underlineSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-set");
  }

  /** */
  @property void underlineSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("underline-set", propval);
  }

  /**
      Get `variant` property.
      Returns: Font variant as a [pango.types.Variant], e.g. [pango.types.Variant.SmallCaps].
  */
  @property pango.types.Variant variant()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Variant)("variant");
  }

  /**
      Set `variant` property.
      Params:
        propval = Font variant as a [pango.types.Variant], e.g. [pango.types.Variant.SmallCaps].
  */
  @property void variant(pango.types.Variant propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Variant)("variant", propval);
  }

  /** */
  @property bool variantSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("variant-set");
  }

  /** */
  @property void variantSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("variant-set", propval);
  }

  /**
      Get `weight` property.
      Returns: Font weight as an integer.
  */
  @property int weight()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("weight");
  }

  /**
      Set `weight` property.
      Params:
        propval = Font weight as an integer.
  */
  @property void weight(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("weight", propval);
  }

  /** */
  @property bool weightSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("weight-set");
  }

  /** */
  @property void weightSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("weight-set", propval);
  }

  /**
      Get `word` property.
      Returns: Whether this tag represents a single word.
        
        This affects line breaks and cursor movement.
  */
  @property bool word()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("word");
  }

  /**
      Set `word` property.
      Params:
        propval = Whether this tag represents a single word.
          
          This affects line breaks and cursor movement.
  */
  @property void word(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("word", propval);
  }

  /** */
  @property bool wordSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("word-set");
  }

  /** */
  @property void wordSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("word-set", propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Whether to wrap lines never, at word boundaries, or
        at character boundaries.
  */
  @property gtk.types.WrapMode wrapMode()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.WrapMode)("wrap-mode");
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Whether to wrap lines never, at word boundaries, or
          at character boundaries.
  */
  @property void wrapMode(gtk.types.WrapMode propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.WrapMode)("wrap-mode", propval);
  }

  /** */
  @property bool wrapModeSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("wrap-mode-set");
  }

  /** */
  @property void wrapModeSet(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("wrap-mode-set", propval);
  }

  /**
      Creates a [gtk.text_tag.TextTag].
  
      Params:
        name = tag name
      Returns: a new [gtk.text_tag.TextTag]
  */
  this(string name = null)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_tag_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Emits the `signalGtk.TextTagTable::tag-changed` signal on the
      [gtk.text_tag_table.TextTagTable] where the tag is included.
      
      The signal is already emitted when setting a [gtk.text_tag.TextTag] property.
      This function is useful for a [gtk.text_tag.TextTag] subclass.
  
      Params:
        sizeChanged = whether the change affects the [gtk.text_view.TextView] layout
  */
  void changed(bool sizeChanged)
  {
    gtk_text_tag_changed(cast(GtkTextTag*)this._cPtr, sizeChanged);
  }

  /**
      Get the tag priority.
      Returns: The tag’s priority.
  */
  int getPriority()
  {
    int _retval;
    _retval = gtk_text_tag_get_priority(cast(GtkTextTag*)this._cPtr);
    return _retval;
  }

  /**
      Sets the priority of a [gtk.text_tag.TextTag].
      
      Valid priorities start at 0 and go to one less than
      [gtk.text_tag_table.TextTagTable.getSize]. Each tag in a table
      has a unique priority; setting the priority of one tag shifts
      the priorities of all the other tags in the table to maintain
      a unique priority for each tag.
      
      Higher priority tags “win” if two tags both set the same text
      attribute. When adding a tag to a tag table, it will be assigned
      the highest priority in the table by default; so normally the
      precedence of a set of tags is the order in which they were added
      to the table, or created with [gtk.text_buffer.TextBuffer.createTag],
      which adds the tag to the buffer’s table automatically.
  
      Params:
        priority = the new priority
  */
  void setPriority(int priority)
  {
    gtk_text_tag_set_priority(cast(GtkTextTag*)this._cPtr, priority);
  }
}
