/// Module for [TextTag] class
module gtk.text_tag;

import gdk.color;
import gdk.event;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_iter;
import gtk.types;
import pango.font_description;
import pango.tab_array;
import pango.types;

/**
    You may wish to begin by reading the
    [text widget conceptual overview](TextWidget.html)
    which gives an overview of all the objects and
    data types related to the text widget and how they work together.
    
    Tags should be in the #GtkTextTagTable for a given #GtkTextBuffer
    before using them with that buffer.
    
    [gtk.text_buffer.TextBuffer.createTag] is the best way to create tags.
    See “gtk3-demo” for numerous examples.
    
    For each property of #GtkTextTag, there is a “set” property, e.g.
    “font-set” corresponds to “font”. These “set” properties reflect
    whether a property has been set or not.
    They are maintained by GTK+ and you should not set them independently.
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

  /** */
  @property void background(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("background", propval);
  }

  /** */
  @property bool backgroundFullHeight()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-full-height");
  }

  /** */
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
      Get `backgroundGdk` property.
      Returns: Background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:background-rgba instead.
  */
  @property gdk.color.Color backgroundGdk()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.color.Color)("background-gdk");
  }

  /**
      Set `backgroundGdk` property.
      Params:
        propval = Background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:background-rgba instead.
  */
  @property void backgroundGdk(gdk.color.Color propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.color.Color)("background-gdk", propval);
  }

  /**
      Get `backgroundRgba` property.
      Returns: Background color as a #GdkRGBA.
  */
  @property gdk.rgba.RGBA backgroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("background-rgba");
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a #GdkRGBA.
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

  /** */
  @property gtk.types.TextDirection direction()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.TextDirection)("direction");
  }

  /** */
  @property void direction(gtk.types.TextDirection propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.TextDirection)("direction", propval);
  }

  /** */
  @property bool editable()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /** */
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

  /** */
  @property string family()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("family");
  }

  /** */
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
      the internals of #PangoFontDescription.
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
        the internals of #PangoFontDescription.
  */
  @property void font(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("font", propval);
  }

  /** */
  @property pango.font_description.FontDescription fontDesc()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.font_description.FontDescription)("font-desc");
  }

  /** */
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

  /** */
  @property void foreground(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("foreground", propval);
  }

  /**
      Get `foregroundGdk` property.
      Returns: Foreground color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:foreground-rgba instead.
  */
  @property gdk.color.Color foregroundGdk()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.color.Color)("foreground-gdk");
  }

  /**
      Set `foregroundGdk` property.
      Params:
        propval = Foreground color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:foreground-rgba instead.
  */
  @property void foregroundGdk(gdk.color.Color propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.color.Color)("foreground-gdk", propval);
  }

  /**
      Get `foregroundRgba` property.
      Returns: Foreground color as a #GdkRGBA.
  */
  @property gdk.rgba.RGBA foregroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("foreground-rgba");
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a #GdkRGBA.
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

  /** */
  @property int indent()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("indent");
  }

  /** */
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

  /** */
  @property gtk.types.Justification justification()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Justification)("justification");
  }

  /** */
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
      Returns: The language this text is in, as an ISO code. Pango can use this as a
      hint when rendering the text. If not set, an appropriate default will be
      used.
      
      Note that the initial value of this property depends on the current
      locale, see also [gtk.global.getDefaultLanguage].
  */
  @property string language()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("language");
  }

  /**
      Set `language` property.
      Params:
        propval = The language this text is in, as an ISO code. Pango can use this as a
        hint when rendering the text. If not set, an appropriate default will be
        used.
        
        Note that the initial value of this property depends on the current
        locale, see also [gtk.global.getDefaultLanguage].
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

  /** */
  @property int leftMargin()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("left-margin");
  }

  /** */
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
      Set `paragraphBackground` property.
      Params:
        propval = The paragraph background color as a string.
  */
  @property void paragraphBackground(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("paragraph-background", propval);
  }

  /**
      Get `paragraphBackgroundGdk` property.
      Returns: The paragraph background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:paragraph-background-rgba instead.
  */
  @property gdk.color.Color paragraphBackgroundGdk()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.color.Color)("paragraph-background-gdk");
  }

  /**
      Set `paragraphBackgroundGdk` property.
      Params:
        propval = The paragraph background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:paragraph-background-rgba instead.
  */
  @property void paragraphBackgroundGdk(gdk.color.Color propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.color.Color)("paragraph-background-gdk", propval);
  }

  /**
      Get `paragraphBackgroundRgba` property.
      Returns: The paragraph background color as a #GdkRGBA.
  */
  @property gdk.rgba.RGBA paragraphBackgroundRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("paragraph-background-rgba");
  }

  /**
      Set `paragraphBackgroundRgba` property.
      Params:
        propval = The paragraph background color as a #GdkRGBA.
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

  /** */
  @property int pixelsAboveLines()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-above-lines");
  }

  /** */
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

  /** */
  @property int pixelsBelowLines()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-below-lines");
  }

  /** */
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

  /** */
  @property int pixelsInsideWrap()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-inside-wrap");
  }

  /** */
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

  /** */
  @property int rightMargin()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("right-margin");
  }

  /** */
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

  /** */
  @property int rise()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("rise");
  }

  /** */
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

  /** */
  @property double scale()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("scale");
  }

  /** */
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

  /** */
  @property int size()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("size");
  }

  /** */
  @property void size(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("size", propval);
  }

  /** */
  @property double sizePoints()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("size-points");
  }

  /** */
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

  /** */
  @property pango.types.Stretch stretch()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Stretch)("stretch");
  }

  /** */
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

  /** */
  @property bool strikethrough()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /** */
  @property void strikethrough(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough", propval);
  }

  /**
      Get `strikethroughRgba` property.
      Returns: This property modifies the color of strikeouts. If not set, strikeouts
      will use the forground color.
  */
  @property gdk.rgba.RGBA strikethroughRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("strikethrough-rgba");
  }

  /**
      Set `strikethroughRgba` property.
      Params:
        propval = This property modifies the color of strikeouts. If not set, strikeouts
        will use the forground color.
  */
  @property void strikethroughRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("strikethrough-rgba", propval);
  }

  /**
      Get `strikethroughRgbaSet` property.
      Returns: If the #GtkTextTag:strikethrough-rgba property has been set.
  */
  @property bool strikethroughRgbaSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-rgba-set");
  }

  /**
      Set `strikethroughRgbaSet` property.
      Params:
        propval = If the #GtkTextTag:strikethrough-rgba property has been set.
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

  /** */
  @property pango.types.Style style()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Style)("style");
  }

  /** */
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

  /** */
  @property pango.tab_array.TabArray tabs()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.tab_array.TabArray)("tabs");
  }

  /** */
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

  /** */
  @property pango.types.Underline underline()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Underline)("underline");
  }

  /** */
  @property void underline(pango.types.Underline propval)
  {
    gobject.object.ObjectWrap.setProperty!(pango.types.Underline)("underline", propval);
  }

  /**
      Get `underlineRgba` property.
      Returns: This property modifies the color of underlines. If not set, underlines
      will use the forground color.
      
      If #GtkTextTag:underline is set to [pango.types.Underline.Error], an alternate
      color may be applied instead of the foreground. Setting this property
      will always override those defaults.
  */
  @property gdk.rgba.RGBA underlineRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("underline-rgba");
  }

  /**
      Set `underlineRgba` property.
      Params:
        propval = This property modifies the color of underlines. If not set, underlines
        will use the forground color.
        
        If #GtkTextTag:underline is set to [pango.types.Underline.Error], an alternate
        color may be applied instead of the foreground. Setting this property
        will always override those defaults.
  */
  @property void underlineRgba(gdk.rgba.RGBA propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("underline-rgba", propval);
  }

  /**
      Get `underlineRgbaSet` property.
      Returns: If the #GtkTextTag:underline-rgba property has been set.
  */
  @property bool underlineRgbaSet()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-rgba-set");
  }

  /**
      Set `underlineRgbaSet` property.
      Params:
        propval = If the #GtkTextTag:underline-rgba property has been set.
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

  /** */
  @property pango.types.Variant variant()
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Variant)("variant");
  }

  /** */
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

  /** */
  @property int weight()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("weight");
  }

  /** */
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

  /** */
  @property gtk.types.WrapMode wrapMode()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.WrapMode)("wrap-mode");
  }

  /** */
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
      Creates a #GtkTextTag. Configure the tag using object arguments,
      i.e. using [gobject.object.ObjectWrap.set].
  
      Params:
        name = tag name, or null
      Returns: a new #GtkTextTag
  */
  this(string name = null)
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_text_tag_new(_name);
    this(_cretval, Yes.Take);
  }

  /**
      Emits the #GtkTextTagTable::tag-changed signal on the #GtkTextTagTable where
      the tag is included.
      
      The signal is already emitted when setting a #GtkTextTag property. This
      function is useful for a #GtkTextTag subclass.
  
      Params:
        sizeChanged = whether the change affects the #GtkTextView layout.
  */
  void changed(bool sizeChanged)
  {
    gtk_text_tag_changed(cast(GtkTextTag*)this._cPtr, sizeChanged);
  }

  /**
      Emits the “event” signal on the #GtkTextTag.
  
      Params:
        eventObject = object that received the event, such as a widget
        event = the event
        iter = location where the event was received
      Returns: result of signal emission (whether the event was handled)
  */
  bool event(gobject.object.ObjectWrap eventObject, gdk.event.Event event, gtk.text_iter.TextIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_text_tag_event(cast(GtkTextTag*)this._cPtr, eventObject ? cast(GObject*)eventObject._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr : null, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null);
    return _retval;
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
      Sets the priority of a #GtkTextTag. Valid priorities
      start at 0 and go to one less than [gtk.text_tag_table.TextTagTable.getSize].
      Each tag in a table has a unique priority; setting the priority
      of one tag shifts the priorities of all the other tags in the
      table to maintain a unique priority for each tag. Higher priority
      tags “win” if two tags both set the same text attribute. When adding
      a tag to a tag table, it will be assigned the highest priority in
      the table by default; so normally the precedence of a set of tags
      is the order in which they were added to the table, or created with
      [gtk.text_buffer.TextBuffer.createTag], which adds the tag to the buffer’s table
      automatically.
  
      Params:
        priority = the new priority
  */
  void setPriority(int priority)
  {
    gtk_text_tag_set_priority(cast(GtkTextTag*)this._cPtr, priority);
  }

  /**
      Connect to `Event` signal.
  
      The ::event signal is emitted when an event occurs on a region of the
      buffer marked with this tag.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gobject.object.ObjectWrap object, gdk.event.Event event, gtk.text_iter.TextIter iter, gtk.text_tag.TextTag textTag))
  
          `object` the object the event was fired from (typically a #GtkTextView) (optional)
  
          `event` the event which triggered the signal (optional)
  
          `iter` a #GtkTextIter pointing at the location the event occurred (optional)
  
          `textTag` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the
          event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.event.Event)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text_tag.TextTag)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}
