/// Module for [TextTag] class
module gtk.text_tag;

public import gid.basictypes;
import gdk.rgba;
import gid.gid;
import gobject.gid_builder;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_tag_get_type != &gidSymbolNotFound ? gtk_text_tag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextTag self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.text_tag.TextTag]
      Returns: New builder object
  */
  static TextTagGidBuilder builder() nothrow
  {
    return new TextTagGidBuilder;
  }

  /**
      Get `accumulativeMargin` property.
      Returns: Whether the margins accumulate or override each other.
        
        When set to true the margins of this tag are added to the margins
        of any other non-accumulative margins present. When set to false
        the margins override one another (the default).
  */
  @property bool accumulativeMargin() nothrow
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
  @property void accumulativeMargin(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("accumulative-margin", propval);
  }

  /**
      Get `allowBreaks` property.
      Returns: Whether breaks are allowed.
  */
  @property bool allowBreaks() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-breaks");
  }

  /**
      Set `allowBreaks` property.
      Params:
        propval = Whether breaks are allowed.
  */
  @property void allowBreaks(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-breaks", propval);
  }

  /** */
  @property bool allowBreaksSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-breaks-set");
  }

  /** */
  @property void allowBreaksSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-breaks-set", propval);
  }

  /**
      Set `background` property.
      Params:
        propval = Background color as a string.
  */
  @property void background(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("background", propval);
  }

  /**
      Get `backgroundFullHeight` property.
      Returns: Whether the background color fills the entire line height
        or only the height of the tagged characters.
  */
  @property bool backgroundFullHeight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-full-height");
  }

  /**
      Set `backgroundFullHeight` property.
      Params:
        propval = Whether the background color fills the entire line height
          or only the height of the tagged characters.
  */
  @property void backgroundFullHeight(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-full-height", propval);
  }

  /** */
  @property bool backgroundFullHeightSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-full-height-set");
  }

  /** */
  @property void backgroundFullHeightSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-full-height-set", propval);
  }

  /**
      Get `backgroundRgba` property.
      Returns: Background color as a [gdk.rgba.RGBA].
  */
  @property gdk.rgba.RGBA backgroundRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("background-rgba");
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a [gdk.rgba.RGBA].
  */
  @property void backgroundRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("background-rgba", propval);
  }

  /** */
  @property bool backgroundSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property void backgroundSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("background-set", propval);
  }

  /**
      Get `direction` property.
      Returns: Text direction, e.g. right-to-left or left-to-right.
  */
  @property gtk.types.TextDirection direction() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.TextDirection)("direction");
  }

  /**
      Set `direction` property.
      Params:
        propval = Text direction, e.g. right-to-left or left-to-right.
  */
  @property void direction(gtk.types.TextDirection propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.TextDirection)("direction", propval);
  }

  /**
      Get `editable` property.
      Returns: Whether the text can be modified by the user.
  */
  @property bool editable() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /**
      Set `editable` property.
      Params:
        propval = Whether the text can be modified by the user.
  */
  @property void editable(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editable", propval);
  }

  /** */
  @property bool editableSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable-set");
  }

  /** */
  @property void editableSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("editable-set", propval);
  }

  /**
      Get `fallback` property.
      Returns: Whether font fallback is enabled.
        
        When set to true, other fonts will be substituted
        where the current font is missing glyphs.
  */
  @property bool fallback() nothrow
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
  @property void fallback(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("fallback", propval);
  }

  /** */
  @property bool fallbackSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("fallback-set");
  }

  /** */
  @property void fallbackSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("fallback-set", propval);
  }

  /**
      Get `family` property.
      Returns: Name of the font family, e.g. Sans, Helvetica, Times, Monospace.
  */
  @property string family() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("family");
  }

  /**
      Set `family` property.
      Params:
        propval = Name of the font family, e.g. Sans, Helvetica, Times, Monospace.
  */
  @property void family(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("family", propval);
  }

  /** */
  @property bool familySet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("family-set");
  }

  /** */
  @property void familySet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("family-set", propval);
  }

  /**
      Get `font` property.
      Returns: Font description as string, e.g. \"Sans Italic 12\".
        
        Note that the initial value of this property depends on
        the internals of [pango.font_description.FontDescription].
  */
  @property string font() nothrow
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
  @property void font(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("font", propval);
  }

  /**
      Get `fontDesc` property.
      Returns: Font description as a [pango.font_description.FontDescription].
  */
  @property pango.font_description.FontDescription fontDesc() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.font_description.FontDescription)("font-desc");
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = Font description as a [pango.font_description.FontDescription].
  */
  @property void fontDesc(pango.font_description.FontDescription propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.font_description.FontDescription)("font-desc", propval);
  }

  /**
      Get `fontFeatures` property.
      Returns: OpenType font features, as a string.
  */
  @property string fontFeatures() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("font-features");
  }

  /**
      Set `fontFeatures` property.
      Params:
        propval = OpenType font features, as a string.
  */
  @property void fontFeatures(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("font-features", propval);
  }

  /** */
  @property bool fontFeaturesSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("font-features-set");
  }

  /** */
  @property void fontFeaturesSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("font-features-set", propval);
  }

  /**
      Set `foreground` property.
      Params:
        propval = Foreground color as a string.
  */
  @property void foreground(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("foreground", propval);
  }

  /**
      Get `foregroundRgba` property.
      Returns: Foreground color as a [gdk.rgba.RGBA].
  */
  @property gdk.rgba.RGBA foregroundRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("foreground-rgba");
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a [gdk.rgba.RGBA].
  */
  @property void foregroundRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("foreground-rgba", propval);
  }

  /** */
  @property bool foregroundSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("foreground-set");
  }

  /** */
  @property void foregroundSet(bool propval) nothrow
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
  @property int indent() nothrow
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
  @property void indent(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("indent", propval);
  }

  /** */
  @property bool indentSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("indent-set");
  }

  /** */
  @property void indentSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("indent-set", propval);
  }

  /**
      Get `insertHyphens` property.
      Returns: Whether to insert hyphens at breaks.
  */
  @property bool insertHyphens() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("insert-hyphens");
  }

  /**
      Set `insertHyphens` property.
      Params:
        propval = Whether to insert hyphens at breaks.
  */
  @property void insertHyphens(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("insert-hyphens", propval);
  }

  /** */
  @property bool insertHyphensSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("insert-hyphens-set");
  }

  /** */
  @property void insertHyphensSet(bool propval) nothrow
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
  @property bool invisible() nothrow
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
  @property void invisible(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible", propval);
  }

  /** */
  @property bool invisibleSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("invisible-set");
  }

  /** */
  @property void invisibleSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("invisible-set", propval);
  }

  /**
      Get `justification` property.
      Returns: Left, right, or center justification.
  */
  @property gtk.types.Justification justification() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Justification)("justification");
  }

  /**
      Set `justification` property.
      Params:
        propval = Left, right, or center justification.
  */
  @property void justification(gtk.types.Justification propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.Justification)("justification", propval);
  }

  /** */
  @property bool justificationSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("justification-set");
  }

  /** */
  @property void justificationSet(bool propval) nothrow
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
  @property string language() nothrow
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
  @property void language(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("language", propval);
  }

  /** */
  @property bool languageSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("language-set");
  }

  /** */
  @property void languageSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("language-set", propval);
  }

  /**
      Get `leftMargin` property.
      Returns: Width of the left margin in pixels.
  */
  @property int leftMargin() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("left-margin");
  }

  /**
      Set `leftMargin` property.
      Params:
        propval = Width of the left margin in pixels.
  */
  @property void leftMargin(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("left-margin", propval);
  }

  /** */
  @property bool leftMarginSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("left-margin-set");
  }

  /** */
  @property void leftMarginSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("left-margin-set", propval);
  }

  /**
      Get `letterSpacing` property.
      Returns: Extra spacing between graphemes, in Pango units.
  */
  @property int letterSpacing() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("letter-spacing");
  }

  /**
      Set `letterSpacing` property.
      Params:
        propval = Extra spacing between graphemes, in Pango units.
  */
  @property void letterSpacing(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("letter-spacing", propval);
  }

  /** */
  @property bool letterSpacingSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("letter-spacing-set");
  }

  /** */
  @property void letterSpacingSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("letter-spacing-set", propval);
  }

  /**
      Get `lineHeight` property.
      Returns: Factor to scale line height by.
  */
  @property float lineHeight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(float)("line-height");
  }

  /**
      Set `lineHeight` property.
      Params:
        propval = Factor to scale line height by.
  */
  @property void lineHeight(float propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(float)("line-height", propval);
  }

  /** */
  @property bool lineHeightSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("line-height-set");
  }

  /** */
  @property void lineHeightSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("line-height-set", propval);
  }

  /**
      Get `name` property.
      Returns: The name used to refer to the tag.
        
        null for anonymous tags.
  */
  @property string name() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("name");
  }

  /**
      Get `overline` property.
      Returns: Style of overline for this text.
  */
  @property pango.types.Overline overline() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Overline)("overline");
  }

  /**
      Set `overline` property.
      Params:
        propval = Style of overline for this text.
  */
  @property void overline(pango.types.Overline propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Overline)("overline", propval);
  }

  /**
      Get `overlineRgba` property.
      Returns: This property modifies the color of overlines.
        
        If not set, overlines will use the foreground color.
  */
  @property gdk.rgba.RGBA overlineRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("overline-rgba");
  }

  /**
      Set `overlineRgba` property.
      Params:
        propval = This property modifies the color of overlines.
          
          If not set, overlines will use the foreground color.
  */
  @property void overlineRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("overline-rgba", propval);
  }

  /** */
  @property bool overlineRgbaSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("overline-rgba-set");
  }

  /** */
  @property void overlineRgbaSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("overline-rgba-set", propval);
  }

  /** */
  @property bool overlineSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("overline-set");
  }

  /** */
  @property void overlineSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("overline-set", propval);
  }

  /**
      Set `paragraphBackground` property.
      Params:
        propval = The paragraph background color as a string.
  */
  @property void paragraphBackground(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("paragraph-background", propval);
  }

  /**
      Get `paragraphBackgroundRgba` property.
      Returns: The paragraph background color as a [gdk.rgba.RGBA].
  */
  @property gdk.rgba.RGBA paragraphBackgroundRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("paragraph-background-rgba");
  }

  /**
      Set `paragraphBackgroundRgba` property.
      Params:
        propval = The paragraph background color as a [gdk.rgba.RGBA].
  */
  @property void paragraphBackgroundRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("paragraph-background-rgba", propval);
  }

  /** */
  @property bool paragraphBackgroundSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("paragraph-background-set");
  }

  /** */
  @property void paragraphBackgroundSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("paragraph-background-set", propval);
  }

  /**
      Get `pixelsAboveLines` property.
      Returns: Pixels of blank space above paragraphs.
  */
  @property int pixelsAboveLines() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-above-lines");
  }

  /**
      Set `pixelsAboveLines` property.
      Params:
        propval = Pixels of blank space above paragraphs.
  */
  @property void pixelsAboveLines(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("pixels-above-lines", propval);
  }

  /** */
  @property bool pixelsAboveLinesSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("pixels-above-lines-set");
  }

  /** */
  @property void pixelsAboveLinesSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("pixels-above-lines-set", propval);
  }

  /**
      Get `pixelsBelowLines` property.
      Returns: Pixels of blank space below paragraphs.
  */
  @property int pixelsBelowLines() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-below-lines");
  }

  /**
      Set `pixelsBelowLines` property.
      Params:
        propval = Pixels of blank space below paragraphs.
  */
  @property void pixelsBelowLines(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("pixels-below-lines", propval);
  }

  /** */
  @property bool pixelsBelowLinesSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("pixels-below-lines-set");
  }

  /** */
  @property void pixelsBelowLinesSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("pixels-below-lines-set", propval);
  }

  /**
      Get `pixelsInsideWrap` property.
      Returns: Pixels of blank space between wrapped lines in a paragraph.
  */
  @property int pixelsInsideWrap() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-inside-wrap");
  }

  /**
      Set `pixelsInsideWrap` property.
      Params:
        propval = Pixels of blank space between wrapped lines in a paragraph.
  */
  @property void pixelsInsideWrap(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("pixels-inside-wrap", propval);
  }

  /** */
  @property bool pixelsInsideWrapSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("pixels-inside-wrap-set");
  }

  /** */
  @property void pixelsInsideWrapSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("pixels-inside-wrap-set", propval);
  }

  /**
      Get `rightMargin` property.
      Returns: Width of the right margin, in pixels.
  */
  @property int rightMargin() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("right-margin");
  }

  /**
      Set `rightMargin` property.
      Params:
        propval = Width of the right margin, in pixels.
  */
  @property void rightMargin(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("right-margin", propval);
  }

  /** */
  @property bool rightMarginSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("right-margin-set");
  }

  /** */
  @property void rightMarginSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("right-margin-set", propval);
  }

  /**
      Get `rise` property.
      Returns: Offset of text above the baseline, in Pango units.
        
        Negative values go below the baseline.
  */
  @property int rise() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("rise");
  }

  /**
      Set `rise` property.
      Params:
        propval = Offset of text above the baseline, in Pango units.
          
          Negative values go below the baseline.
  */
  @property void rise(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("rise", propval);
  }

  /** */
  @property bool riseSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("rise-set");
  }

  /** */
  @property void riseSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("rise-set", propval);
  }

  /**
      Get `scale` property.
      Returns: Font size as a scale factor relative to the default font size.
        
        This properly adapts to theme changes, etc. so is recommended.
        Pango predefines some scales such as `PANGO_SCALE_X_LARGE`.
  */
  @property double scale() nothrow
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
  @property void scale(double propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(double)("scale", propval);
  }

  /** */
  @property bool scaleSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("scale-set");
  }

  /** */
  @property void scaleSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("scale-set", propval);
  }

  /**
      Get `sentence` property.
      Returns: Whether this tag represents a single sentence.
        
        This affects cursor movement.
  */
  @property bool sentence() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("sentence");
  }

  /**
      Set `sentence` property.
      Params:
        propval = Whether this tag represents a single sentence.
          
          This affects cursor movement.
  */
  @property void sentence(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("sentence", propval);
  }

  /** */
  @property bool sentenceSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("sentence-set");
  }

  /** */
  @property void sentenceSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("sentence-set", propval);
  }

  /**
      Get `showSpaces` property.
      Returns: How to render invisible characters.
  */
  @property pango.types.ShowFlags showSpaces() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.ShowFlags)("show-spaces");
  }

  /**
      Set `showSpaces` property.
      Params:
        propval = How to render invisible characters.
  */
  @property void showSpaces(pango.types.ShowFlags propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.ShowFlags)("show-spaces", propval);
  }

  /** */
  @property bool showSpacesSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("show-spaces-set");
  }

  /** */
  @property void showSpacesSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("show-spaces-set", propval);
  }

  /**
      Get `size` property.
      Returns: Font size in Pango units.
  */
  @property int size() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("size");
  }

  /**
      Set `size` property.
      Params:
        propval = Font size in Pango units.
  */
  @property void size(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("size", propval);
  }

  /**
      Get `sizePoints` property.
      Returns: Font size in points.
  */
  @property double sizePoints() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(double)("size-points");
  }

  /**
      Set `sizePoints` property.
      Params:
        propval = Font size in points.
  */
  @property void sizePoints(double propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(double)("size-points", propval);
  }

  /** */
  @property bool sizeSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("size-set");
  }

  /** */
  @property void sizeSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("size-set", propval);
  }

  /**
      Get `stretch` property.
      Returns: Font stretch as a [pango.types.Stretch], e.g. [pango.types.Stretch.Condensed].
  */
  @property pango.types.Stretch stretch() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Stretch)("stretch");
  }

  /**
      Set `stretch` property.
      Params:
        propval = Font stretch as a [pango.types.Stretch], e.g. [pango.types.Stretch.Condensed].
  */
  @property void stretch(pango.types.Stretch propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Stretch)("stretch", propval);
  }

  /** */
  @property bool stretchSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("stretch-set");
  }

  /** */
  @property void stretchSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("stretch-set", propval);
  }

  /**
      Get `strikethrough` property.
      Returns: Whether to strike through the text.
  */
  @property bool strikethrough() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /**
      Set `strikethrough` property.
      Params:
        propval = Whether to strike through the text.
  */
  @property void strikethrough(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough", propval);
  }

  /**
      Get `strikethroughRgba` property.
      Returns: This property modifies the color of strikeouts.
        
        If not set, strikeouts will use the foreground color.
  */
  @property gdk.rgba.RGBA strikethroughRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("strikethrough-rgba");
  }

  /**
      Set `strikethroughRgba` property.
      Params:
        propval = This property modifies the color of strikeouts.
          
          If not set, strikeouts will use the foreground color.
  */
  @property void strikethroughRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("strikethrough-rgba", propval);
  }

  /**
      Get `strikethroughRgbaSet` property.
      Returns: If the `strikethrough-rgba` property has been set.
  */
  @property bool strikethroughRgbaSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-rgba-set");
  }

  /**
      Set `strikethroughRgbaSet` property.
      Params:
        propval = If the `strikethrough-rgba` property has been set.
  */
  @property void strikethroughRgbaSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough-rgba-set", propval);
  }

  /** */
  @property bool strikethroughSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-set");
  }

  /** */
  @property void strikethroughSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough-set", propval);
  }

  /**
      Get `style` property.
      Returns: Font style as a [pango.types.Style], e.g. [pango.types.Style.Italic].
  */
  @property pango.types.Style style() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Style)("style");
  }

  /**
      Set `style` property.
      Params:
        propval = Font style as a [pango.types.Style], e.g. [pango.types.Style.Italic].
  */
  @property void style(pango.types.Style propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Style)("style", propval);
  }

  /** */
  @property bool styleSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("style-set");
  }

  /** */
  @property void styleSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("style-set", propval);
  }

  /**
      Get `tabs` property.
      Returns: Custom tabs for this text.
  */
  @property pango.tab_array.TabArray tabs() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.tab_array.TabArray)("tabs");
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this text.
  */
  @property void tabs(pango.tab_array.TabArray propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.tab_array.TabArray)("tabs", propval);
  }

  /** */
  @property bool tabsSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("tabs-set");
  }

  /** */
  @property void tabsSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("tabs-set", propval);
  }

  /**
      Get `textTransform` property.
      Returns: How to transform the text for display.
  */
  @property pango.types.TextTransform textTransform() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.TextTransform)("text-transform");
  }

  /**
      Set `textTransform` property.
      Params:
        propval = How to transform the text for display.
  */
  @property void textTransform(pango.types.TextTransform propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.TextTransform)("text-transform", propval);
  }

  /** */
  @property bool textTransformSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("text-transform-set");
  }

  /** */
  @property void textTransformSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("text-transform-set", propval);
  }

  /**
      Get `underline` property.
      Returns: Style of underline for this text.
  */
  @property pango.types.Underline underline() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Underline)("underline");
  }

  /**
      Set `underline` property.
      Params:
        propval = Style of underline for this text.
  */
  @property void underline(pango.types.Underline propval) nothrow
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
  @property gdk.rgba.RGBA underlineRgba() nothrow
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
  @property void underlineRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("underline-rgba", propval);
  }

  /**
      Get `underlineRgbaSet` property.
      Returns: If the `underline-rgba` property has been set.
  */
  @property bool underlineRgbaSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-rgba-set");
  }

  /**
      Set `underlineRgbaSet` property.
      Params:
        propval = If the `underline-rgba` property has been set.
  */
  @property void underlineRgbaSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("underline-rgba-set", propval);
  }

  /** */
  @property bool underlineSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-set");
  }

  /** */
  @property void underlineSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("underline-set", propval);
  }

  /**
      Get `variant` property.
      Returns: Font variant as a [pango.types.Variant], e.g. [pango.types.Variant.SmallCaps].
  */
  @property pango.types.Variant variant() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Variant)("variant");
  }

  /**
      Set `variant` property.
      Params:
        propval = Font variant as a [pango.types.Variant], e.g. [pango.types.Variant.SmallCaps].
  */
  @property void variant(pango.types.Variant propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Variant)("variant", propval);
  }

  /** */
  @property bool variantSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("variant-set");
  }

  /** */
  @property void variantSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("variant-set", propval);
  }

  /**
      Get `weight` property.
      Returns: Font weight as an integer.
  */
  @property int weight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("weight");
  }

  /**
      Set `weight` property.
      Params:
        propval = Font weight as an integer.
  */
  @property void weight(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("weight", propval);
  }

  /** */
  @property bool weightSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("weight-set");
  }

  /** */
  @property void weightSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("weight-set", propval);
  }

  /**
      Get `word` property.
      Returns: Whether this tag represents a single word.
        
        This affects line breaks and cursor movement.
  */
  @property bool word() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("word");
  }

  /**
      Set `word` property.
      Params:
        propval = Whether this tag represents a single word.
          
          This affects line breaks and cursor movement.
  */
  @property void word(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("word", propval);
  }

  /** */
  @property bool wordSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("word-set");
  }

  /** */
  @property void wordSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("word-set", propval);
  }

  /**
      Get `wrapMode` property.
      Returns: Whether to wrap lines never, at word boundaries, or
        at character boundaries.
  */
  @property gtk.types.WrapMode wrapMode() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.WrapMode)("wrap-mode");
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Whether to wrap lines never, at word boundaries, or
          at character boundaries.
  */
  @property void wrapMode(gtk.types.WrapMode propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.WrapMode)("wrap-mode", propval);
  }

  /** */
  @property bool wrapModeSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("wrap-mode-set");
  }

  /** */
  @property void wrapModeSet(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("wrap-mode-set", propval);
  }

  /**
      Creates a [gtk.text_tag.TextTag].
  
      Params:
        name = tag name
      Returns: a new [gtk.text_tag.TextTag]
  */
  this(string name = null) nothrow
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_text_tag_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Emits the [gtk.text_tag_table.TextTagTable.tagChanged] signal on the
      [gtk.text_tag_table.TextTagTable] where the tag is included.
      
      The signal is already emitted when setting a [gtk.text_tag.TextTag] property.
      This function is useful for a [gtk.text_tag.TextTag] subclass.
  
      Params:
        sizeChanged = whether the change affects the [gtk.text_view.TextView] layout
  */
  void changed(bool sizeChanged) nothrow
  {
    gtk_text_tag_changed(cast(GtkTextTag*)this._cPtr, sizeChanged);
  }

  /**
      Get the tag priority.
      Returns: The tag’s priority.
  */
  int getPriority() nothrow
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
  void setPriority(int priority) nothrow
  {
    gtk_text_tag_set_priority(cast(GtkTextTag*)this._cPtr, priority);
  }
}

/// Fluent builder implementation template for [gtk.text_tag.TextTag]
class TextTagGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `accumulativeMargin` property.
      Params:
        propval = Whether the margins accumulate or override each other.
          
          When set to true the margins of this tag are added to the margins
          of any other non-accumulative margins present. When set to false
          the margins override one another (the default).
      Returns: Builder instance for fluent chaining
  */
  T accumulativeMargin(bool propval) nothrow
  {
    return setProperty("accumulative-margin", propval);
  }

  /**
      Set `allowBreaks` property.
      Params:
        propval = Whether breaks are allowed.
      Returns: Builder instance for fluent chaining
  */
  T allowBreaks(bool propval) nothrow
  {
    return setProperty("allow-breaks", propval);
  }

  /** */
  T allowBreaksSet(bool propval) nothrow
  {
    return setProperty("allow-breaks-set", propval);
  }

  /**
      Set `background` property.
      Params:
        propval = Background color as a string.
      Returns: Builder instance for fluent chaining
  */
  T background(string propval) nothrow
  {
    return setProperty("background", propval);
  }

  /**
      Set `backgroundFullHeight` property.
      Params:
        propval = Whether the background color fills the entire line height
          or only the height of the tagged characters.
      Returns: Builder instance for fluent chaining
  */
  T backgroundFullHeight(bool propval) nothrow
  {
    return setProperty("background-full-height", propval);
  }

  /** */
  T backgroundFullHeightSet(bool propval) nothrow
  {
    return setProperty("background-full-height-set", propval);
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a [gdk.rgba.RGBA].
      Returns: Builder instance for fluent chaining
  */
  T backgroundRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("background-rgba", propval);
  }

  /** */
  T backgroundSet(bool propval) nothrow
  {
    return setProperty("background-set", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = Text direction, e.g. right-to-left or left-to-right.
      Returns: Builder instance for fluent chaining
  */
  T direction(gtk.types.TextDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `editable` property.
      Params:
        propval = Whether the text can be modified by the user.
      Returns: Builder instance for fluent chaining
  */
  T editable(bool propval) nothrow
  {
    return setProperty("editable", propval);
  }

  /** */
  T editableSet(bool propval) nothrow
  {
    return setProperty("editable-set", propval);
  }

  /**
      Set `fallback` property.
      Params:
        propval = Whether font fallback is enabled.
          
          When set to true, other fonts will be substituted
          where the current font is missing glyphs.
      Returns: Builder instance for fluent chaining
  */
  T fallback(bool propval) nothrow
  {
    return setProperty("fallback", propval);
  }

  /** */
  T fallbackSet(bool propval) nothrow
  {
    return setProperty("fallback-set", propval);
  }

  /**
      Set `family` property.
      Params:
        propval = Name of the font family, e.g. Sans, Helvetica, Times, Monospace.
      Returns: Builder instance for fluent chaining
  */
  T family(string propval) nothrow
  {
    return setProperty("family", propval);
  }

  /** */
  T familySet(bool propval) nothrow
  {
    return setProperty("family-set", propval);
  }

  /**
      Set `font` property.
      Params:
        propval = Font description as string, e.g. \"Sans Italic 12\".
          
          Note that the initial value of this property depends on
          the internals of [pango.font_description.FontDescription].
      Returns: Builder instance for fluent chaining
  */
  T font(string propval) nothrow
  {
    return setProperty("font", propval);
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = Font description as a [pango.font_description.FontDescription].
      Returns: Builder instance for fluent chaining
  */
  T fontDesc(pango.font_description.FontDescription propval) nothrow
  {
    return setProperty("font-desc", propval);
  }

  /**
      Set `fontFeatures` property.
      Params:
        propval = OpenType font features, as a string.
      Returns: Builder instance for fluent chaining
  */
  T fontFeatures(string propval) nothrow
  {
    return setProperty("font-features", propval);
  }

  /** */
  T fontFeaturesSet(bool propval) nothrow
  {
    return setProperty("font-features-set", propval);
  }

  /**
      Set `foreground` property.
      Params:
        propval = Foreground color as a string.
      Returns: Builder instance for fluent chaining
  */
  T foreground(string propval) nothrow
  {
    return setProperty("foreground", propval);
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a [gdk.rgba.RGBA].
      Returns: Builder instance for fluent chaining
  */
  T foregroundRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("foreground-rgba", propval);
  }

  /** */
  T foregroundSet(bool propval) nothrow
  {
    return setProperty("foreground-set", propval);
  }

  /**
      Set `indent` property.
      Params:
        propval = Amount to indent the paragraph, in pixels.
          
          A negative value of indent will produce a hanging indentation.
          That is, the first line will have the full width, and subsequent
          lines will be indented by the absolute value of indent.
      Returns: Builder instance for fluent chaining
  */
  T indent(int propval) nothrow
  {
    return setProperty("indent", propval);
  }

  /** */
  T indentSet(bool propval) nothrow
  {
    return setProperty("indent-set", propval);
  }

  /**
      Set `insertHyphens` property.
      Params:
        propval = Whether to insert hyphens at breaks.
      Returns: Builder instance for fluent chaining
  */
  T insertHyphens(bool propval) nothrow
  {
    return setProperty("insert-hyphens", propval);
  }

  /** */
  T insertHyphensSet(bool propval) nothrow
  {
    return setProperty("insert-hyphens-set", propval);
  }

  /**
      Set `invisible` property.
      Params:
        propval = Whether this text is hidden.
          
          Note that there may still be problems with the support for invisible
          text, in particular when navigating programmatically inside a buffer
          containing invisible segments.
      Returns: Builder instance for fluent chaining
  */
  T invisible(bool propval) nothrow
  {
    return setProperty("invisible", propval);
  }

  /** */
  T invisibleSet(bool propval) nothrow
  {
    return setProperty("invisible-set", propval);
  }

  /**
      Set `justification` property.
      Params:
        propval = Left, right, or center justification.
      Returns: Builder instance for fluent chaining
  */
  T justification(gtk.types.Justification propval) nothrow
  {
    return setProperty("justification", propval);
  }

  /** */
  T justificationSet(bool propval) nothrow
  {
    return setProperty("justification-set", propval);
  }

  /**
      Set `language` property.
      Params:
        propval = The language this text is in, as an ISO code.
          
          Pango can use this as a hint when rendering the text.
          If not set, an appropriate default will be used.
          
          Note that the initial value of this property depends
          on the current locale, see also `func@Gtk.get_default_language`.
      Returns: Builder instance for fluent chaining
  */
  T language(string propval) nothrow
  {
    return setProperty("language", propval);
  }

  /** */
  T languageSet(bool propval) nothrow
  {
    return setProperty("language-set", propval);
  }

  /**
      Set `leftMargin` property.
      Params:
        propval = Width of the left margin in pixels.
      Returns: Builder instance for fluent chaining
  */
  T leftMargin(int propval) nothrow
  {
    return setProperty("left-margin", propval);
  }

  /** */
  T leftMarginSet(bool propval) nothrow
  {
    return setProperty("left-margin-set", propval);
  }

  /**
      Set `letterSpacing` property.
      Params:
        propval = Extra spacing between graphemes, in Pango units.
      Returns: Builder instance for fluent chaining
  */
  T letterSpacing(int propval) nothrow
  {
    return setProperty("letter-spacing", propval);
  }

  /** */
  T letterSpacingSet(bool propval) nothrow
  {
    return setProperty("letter-spacing-set", propval);
  }

  /**
      Set `lineHeight` property.
      Params:
        propval = Factor to scale line height by.
      Returns: Builder instance for fluent chaining
  */
  T lineHeight(float propval) nothrow
  {
    return setProperty("line-height", propval);
  }

  /** */
  T lineHeightSet(bool propval) nothrow
  {
    return setProperty("line-height-set", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name used to refer to the tag.
          
          null for anonymous tags.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `overline` property.
      Params:
        propval = Style of overline for this text.
      Returns: Builder instance for fluent chaining
  */
  T overline(pango.types.Overline propval) nothrow
  {
    return setProperty("overline", propval);
  }

  /**
      Set `overlineRgba` property.
      Params:
        propval = This property modifies the color of overlines.
          
          If not set, overlines will use the foreground color.
      Returns: Builder instance for fluent chaining
  */
  T overlineRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("overline-rgba", propval);
  }

  /** */
  T overlineRgbaSet(bool propval) nothrow
  {
    return setProperty("overline-rgba-set", propval);
  }

  /** */
  T overlineSet(bool propval) nothrow
  {
    return setProperty("overline-set", propval);
  }

  /**
      Set `paragraphBackground` property.
      Params:
        propval = The paragraph background color as a string.
      Returns: Builder instance for fluent chaining
  */
  T paragraphBackground(string propval) nothrow
  {
    return setProperty("paragraph-background", propval);
  }

  /**
      Set `paragraphBackgroundRgba` property.
      Params:
        propval = The paragraph background color as a [gdk.rgba.RGBA].
      Returns: Builder instance for fluent chaining
  */
  T paragraphBackgroundRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("paragraph-background-rgba", propval);
  }

  /** */
  T paragraphBackgroundSet(bool propval) nothrow
  {
    return setProperty("paragraph-background-set", propval);
  }

  /**
      Set `pixelsAboveLines` property.
      Params:
        propval = Pixels of blank space above paragraphs.
      Returns: Builder instance for fluent chaining
  */
  T pixelsAboveLines(int propval) nothrow
  {
    return setProperty("pixels-above-lines", propval);
  }

  /** */
  T pixelsAboveLinesSet(bool propval) nothrow
  {
    return setProperty("pixels-above-lines-set", propval);
  }

  /**
      Set `pixelsBelowLines` property.
      Params:
        propval = Pixels of blank space below paragraphs.
      Returns: Builder instance for fluent chaining
  */
  T pixelsBelowLines(int propval) nothrow
  {
    return setProperty("pixels-below-lines", propval);
  }

  /** */
  T pixelsBelowLinesSet(bool propval) nothrow
  {
    return setProperty("pixels-below-lines-set", propval);
  }

  /**
      Set `pixelsInsideWrap` property.
      Params:
        propval = Pixels of blank space between wrapped lines in a paragraph.
      Returns: Builder instance for fluent chaining
  */
  T pixelsInsideWrap(int propval) nothrow
  {
    return setProperty("pixels-inside-wrap", propval);
  }

  /** */
  T pixelsInsideWrapSet(bool propval) nothrow
  {
    return setProperty("pixels-inside-wrap-set", propval);
  }

  /**
      Set `rightMargin` property.
      Params:
        propval = Width of the right margin, in pixels.
      Returns: Builder instance for fluent chaining
  */
  T rightMargin(int propval) nothrow
  {
    return setProperty("right-margin", propval);
  }

  /** */
  T rightMarginSet(bool propval) nothrow
  {
    return setProperty("right-margin-set", propval);
  }

  /**
      Set `rise` property.
      Params:
        propval = Offset of text above the baseline, in Pango units.
          
          Negative values go below the baseline.
      Returns: Builder instance for fluent chaining
  */
  T rise(int propval) nothrow
  {
    return setProperty("rise", propval);
  }

  /** */
  T riseSet(bool propval) nothrow
  {
    return setProperty("rise-set", propval);
  }

  /**
      Set `scale` property.
      Params:
        propval = Font size as a scale factor relative to the default font size.
          
          This properly adapts to theme changes, etc. so is recommended.
          Pango predefines some scales such as `PANGO_SCALE_X_LARGE`.
      Returns: Builder instance for fluent chaining
  */
  T scale(double propval) nothrow
  {
    return setProperty("scale", propval);
  }

  /** */
  T scaleSet(bool propval) nothrow
  {
    return setProperty("scale-set", propval);
  }

  /**
      Set `sentence` property.
      Params:
        propval = Whether this tag represents a single sentence.
          
          This affects cursor movement.
      Returns: Builder instance for fluent chaining
  */
  T sentence(bool propval) nothrow
  {
    return setProperty("sentence", propval);
  }

  /** */
  T sentenceSet(bool propval) nothrow
  {
    return setProperty("sentence-set", propval);
  }

  /**
      Set `showSpaces` property.
      Params:
        propval = How to render invisible characters.
      Returns: Builder instance for fluent chaining
  */
  T showSpaces(pango.types.ShowFlags propval) nothrow
  {
    return setProperty("show-spaces", propval);
  }

  /** */
  T showSpacesSet(bool propval) nothrow
  {
    return setProperty("show-spaces-set", propval);
  }

  /**
      Set `size` property.
      Params:
        propval = Font size in Pango units.
      Returns: Builder instance for fluent chaining
  */
  T size(int propval) nothrow
  {
    return setProperty("size", propval);
  }

  /**
      Set `sizePoints` property.
      Params:
        propval = Font size in points.
      Returns: Builder instance for fluent chaining
  */
  T sizePoints(double propval) nothrow
  {
    return setProperty("size-points", propval);
  }

  /** */
  T sizeSet(bool propval) nothrow
  {
    return setProperty("size-set", propval);
  }

  /**
      Set `stretch` property.
      Params:
        propval = Font stretch as a [pango.types.Stretch], e.g. [pango.types.Stretch.Condensed].
      Returns: Builder instance for fluent chaining
  */
  T stretch(pango.types.Stretch propval) nothrow
  {
    return setProperty("stretch", propval);
  }

  /** */
  T stretchSet(bool propval) nothrow
  {
    return setProperty("stretch-set", propval);
  }

  /**
      Set `strikethrough` property.
      Params:
        propval = Whether to strike through the text.
      Returns: Builder instance for fluent chaining
  */
  T strikethrough(bool propval) nothrow
  {
    return setProperty("strikethrough", propval);
  }

  /**
      Set `strikethroughRgba` property.
      Params:
        propval = This property modifies the color of strikeouts.
          
          If not set, strikeouts will use the foreground color.
      Returns: Builder instance for fluent chaining
  */
  T strikethroughRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("strikethrough-rgba", propval);
  }

  /**
      Set `strikethroughRgbaSet` property.
      Params:
        propval = If the `strikethrough-rgba` property has been set.
      Returns: Builder instance for fluent chaining
  */
  T strikethroughRgbaSet(bool propval) nothrow
  {
    return setProperty("strikethrough-rgba-set", propval);
  }

  /** */
  T strikethroughSet(bool propval) nothrow
  {
    return setProperty("strikethrough-set", propval);
  }

  /**
      Set `style` property.
      Params:
        propval = Font style as a [pango.types.Style], e.g. [pango.types.Style.Italic].
      Returns: Builder instance for fluent chaining
  */
  T style(pango.types.Style propval) nothrow
  {
    return setProperty("style", propval);
  }

  /** */
  T styleSet(bool propval) nothrow
  {
    return setProperty("style-set", propval);
  }

  /**
      Set `tabs` property.
      Params:
        propval = Custom tabs for this text.
      Returns: Builder instance for fluent chaining
  */
  T tabs(pango.tab_array.TabArray propval) nothrow
  {
    return setProperty("tabs", propval);
  }

  /** */
  T tabsSet(bool propval) nothrow
  {
    return setProperty("tabs-set", propval);
  }

  /**
      Set `textTransform` property.
      Params:
        propval = How to transform the text for display.
      Returns: Builder instance for fluent chaining
  */
  T textTransform(pango.types.TextTransform propval) nothrow
  {
    return setProperty("text-transform", propval);
  }

  /** */
  T textTransformSet(bool propval) nothrow
  {
    return setProperty("text-transform-set", propval);
  }

  /**
      Set `underline` property.
      Params:
        propval = Style of underline for this text.
      Returns: Builder instance for fluent chaining
  */
  T underline(pango.types.Underline propval) nothrow
  {
    return setProperty("underline", propval);
  }

  /**
      Set `underlineRgba` property.
      Params:
        propval = This property modifies the color of underlines.
          
          If not set, underlines will use the foreground color.
          
          If [gtk.text_tag.TextTag.underline] is set to [pango.types.Underline.Error],
          an alternate color may be applied instead of the foreground. Setting
          this property will always override those defaults.
      Returns: Builder instance for fluent chaining
  */
  T underlineRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("underline-rgba", propval);
  }

  /**
      Set `underlineRgbaSet` property.
      Params:
        propval = If the `underline-rgba` property has been set.
      Returns: Builder instance for fluent chaining
  */
  T underlineRgbaSet(bool propval) nothrow
  {
    return setProperty("underline-rgba-set", propval);
  }

  /** */
  T underlineSet(bool propval) nothrow
  {
    return setProperty("underline-set", propval);
  }

  /**
      Set `variant` property.
      Params:
        propval = Font variant as a [pango.types.Variant], e.g. [pango.types.Variant.SmallCaps].
      Returns: Builder instance for fluent chaining
  */
  T variant(pango.types.Variant propval) nothrow
  {
    return setProperty("variant", propval);
  }

  /** */
  T variantSet(bool propval) nothrow
  {
    return setProperty("variant-set", propval);
  }

  /**
      Set `weight` property.
      Params:
        propval = Font weight as an integer.
      Returns: Builder instance for fluent chaining
  */
  T weight(int propval) nothrow
  {
    return setProperty("weight", propval);
  }

  /** */
  T weightSet(bool propval) nothrow
  {
    return setProperty("weight-set", propval);
  }

  /**
      Set `word` property.
      Params:
        propval = Whether this tag represents a single word.
          
          This affects line breaks and cursor movement.
      Returns: Builder instance for fluent chaining
  */
  T word(bool propval) nothrow
  {
    return setProperty("word", propval);
  }

  /** */
  T wordSet(bool propval) nothrow
  {
    return setProperty("word-set", propval);
  }

  /**
      Set `wrapMode` property.
      Params:
        propval = Whether to wrap lines never, at word boundaries, or
          at character boundaries.
      Returns: Builder instance for fluent chaining
  */
  T wrapMode(gtk.types.WrapMode propval) nothrow
  {
    return setProperty("wrap-mode", propval);
  }

  /** */
  T wrapModeSet(bool propval) nothrow
  {
    return setProperty("wrap-mode-set", propval);
  }
}

/// Fluent builder for [gtk.text_tag.TextTag]
final class TextTagGidBuilder : TextTagGidBuilderImpl!TextTagGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TextTag build() nothrow
  {
    return new TextTag(cast(void*)createGObject(TextTag._getGType), Yes.Take);
  }
}
