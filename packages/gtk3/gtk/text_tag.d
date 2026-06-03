/// Module for [TextTag] class
module gtk.text_tag;

public import gid.basictypes;
import gdk.color;
import gdk.event;
import gdk.rgba;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
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

  /** */
  @property void background(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("background", propval);
  }

  /** */
  @property bool backgroundFullHeight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("background-full-height");
  }

  /** */
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
      Get `backgroundGdk` property.
      Returns: Background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:background-rgba instead.
  */
  @property gdk.color.Color backgroundGdk() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.color.Color)("background-gdk");
  }

  /**
      Set `backgroundGdk` property.
      Params:
        propval = Background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:background-rgba instead.
  */
  @property void backgroundGdk(gdk.color.Color propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.color.Color)("background-gdk", propval);
  }

  /**
      Get `backgroundRgba` property.
      Returns: Background color as a #GdkRGBA.
  */
  @property gdk.rgba.RGBA backgroundRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("background-rgba");
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a #GdkRGBA.
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

  /** */
  @property gtk.types.TextDirection direction() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.TextDirection)("direction");
  }

  /** */
  @property void direction(gtk.types.TextDirection propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.TextDirection)("direction", propval);
  }

  /** */
  @property bool editable() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("editable");
  }

  /** */
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

  /** */
  @property string family() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("family");
  }

  /** */
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
        the internals of #PangoFontDescription.
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
          the internals of #PangoFontDescription.
  */
  @property void font(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("font", propval);
  }

  /** */
  @property pango.font_description.FontDescription fontDesc() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.font_description.FontDescription)("font-desc");
  }

  /** */
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

  /** */
  @property void foreground(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("foreground", propval);
  }

  /**
      Get `foregroundGdk` property.
      Returns: Foreground color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:foreground-rgba instead.
  */
  @property gdk.color.Color foregroundGdk() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.color.Color)("foreground-gdk");
  }

  /**
      Set `foregroundGdk` property.
      Params:
        propval = Foreground color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:foreground-rgba instead.
  */
  @property void foregroundGdk(gdk.color.Color propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.color.Color)("foreground-gdk", propval);
  }

  /**
      Get `foregroundRgba` property.
      Returns: Foreground color as a #GdkRGBA.
  */
  @property gdk.rgba.RGBA foregroundRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("foreground-rgba");
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a #GdkRGBA.
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

  /** */
  @property int indent() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("indent");
  }

  /** */
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

  /** */
  @property gtk.types.Justification justification() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.Justification)("justification");
  }

  /** */
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
      Returns: The language this text is in, as an ISO code. Pango can use this as a
        hint when rendering the text. If not set, an appropriate default will be
        used.
        
        Note that the initial value of this property depends on the current
        locale, see also [gtk.global.getDefaultLanguage].
  */
  @property string language() nothrow
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

  /** */
  @property int leftMargin() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("left-margin");
  }

  /** */
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

  /** */
  @property string name() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("name");
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
      Get `paragraphBackgroundGdk` property.
      Returns: The paragraph background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:paragraph-background-rgba instead.
  */
  @property gdk.color.Color paragraphBackgroundGdk() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.color.Color)("paragraph-background-gdk");
  }

  /**
      Set `paragraphBackgroundGdk` property.
      Params:
        propval = The paragraph background color as a #GdkColor.
  
      Deprecated: Use #GtkTextTag:paragraph-background-rgba instead.
  */
  @property void paragraphBackgroundGdk(gdk.color.Color propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.color.Color)("paragraph-background-gdk", propval);
  }

  /**
      Get `paragraphBackgroundRgba` property.
      Returns: The paragraph background color as a #GdkRGBA.
  */
  @property gdk.rgba.RGBA paragraphBackgroundRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("paragraph-background-rgba");
  }

  /**
      Set `paragraphBackgroundRgba` property.
      Params:
        propval = The paragraph background color as a #GdkRGBA.
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

  /** */
  @property int pixelsAboveLines() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-above-lines");
  }

  /** */
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

  /** */
  @property int pixelsBelowLines() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-below-lines");
  }

  /** */
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

  /** */
  @property int pixelsInsideWrap() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("pixels-inside-wrap");
  }

  /** */
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

  /** */
  @property int rightMargin() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("right-margin");
  }

  /** */
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

  /** */
  @property int rise() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("rise");
  }

  /** */
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

  /** */
  @property double scale() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(double)("scale");
  }

  /** */
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

  /** */
  @property int size() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("size");
  }

  /** */
  @property void size(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("size", propval);
  }

  /** */
  @property double sizePoints() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(double)("size-points");
  }

  /** */
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

  /** */
  @property pango.types.Stretch stretch() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Stretch)("stretch");
  }

  /** */
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

  /** */
  @property bool strikethrough() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough");
  }

  /** */
  @property void strikethrough(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("strikethrough", propval);
  }

  /**
      Get `strikethroughRgba` property.
      Returns: This property modifies the color of strikeouts. If not set, strikeouts
        will use the forground color.
  */
  @property gdk.rgba.RGBA strikethroughRgba() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.rgba.RGBA)("strikethrough-rgba");
  }

  /**
      Set `strikethroughRgba` property.
      Params:
        propval = This property modifies the color of strikeouts. If not set, strikeouts
          will use the forground color.
  */
  @property void strikethroughRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("strikethrough-rgba", propval);
  }

  /**
      Get `strikethroughRgbaSet` property.
      Returns: If the #GtkTextTag:strikethrough-rgba property has been set.
  */
  @property bool strikethroughRgbaSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("strikethrough-rgba-set");
  }

  /**
      Set `strikethroughRgbaSet` property.
      Params:
        propval = If the #GtkTextTag:strikethrough-rgba property has been set.
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

  /** */
  @property pango.types.Style style() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Style)("style");
  }

  /** */
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

  /** */
  @property pango.tab_array.TabArray tabs() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.tab_array.TabArray)("tabs");
  }

  /** */
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

  /** */
  @property pango.types.Underline underline() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Underline)("underline");
  }

  /** */
  @property void underline(pango.types.Underline propval) nothrow
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
  @property gdk.rgba.RGBA underlineRgba() nothrow
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
  @property void underlineRgba(gdk.rgba.RGBA propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.rgba.RGBA)("underline-rgba", propval);
  }

  /**
      Get `underlineRgbaSet` property.
      Returns: If the #GtkTextTag:underline-rgba property has been set.
  */
  @property bool underlineRgbaSet() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("underline-rgba-set");
  }

  /**
      Set `underlineRgbaSet` property.
      Params:
        propval = If the #GtkTextTag:underline-rgba property has been set.
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

  /** */
  @property pango.types.Variant variant() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(pango.types.Variant)("variant");
  }

  /** */
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

  /** */
  @property int weight() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("weight");
  }

  /** */
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

  /** */
  @property gtk.types.WrapMode wrapMode() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.WrapMode)("wrap-mode");
  }

  /** */
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
      Creates a #GtkTextTag. Configure the tag using object arguments,
      i.e. using [gobject.object.ObjectWrap.set].
  
      Params:
        name = tag name, or null
      Returns: a new #GtkTextTag
  */
  this(string name = null) nothrow
  {
    GtkTextTag* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
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
  void changed(bool sizeChanged) nothrow
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
  bool event(gobject.object.ObjectWrap eventObject, gdk.event.Event event, gtk.text_iter.TextIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_text_tag_event(cast(GtkTextTag*)this._cPtr, eventObject ? cast(GObject*)eventObject._cPtr(No.Dup) : null, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, iter ? cast(const(GtkTextIter)*)iter._cPtr(No.Dup) : null);
    return _retval;
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
  void setPriority(int priority) nothrow
  {
    gtk_text_tag_set_priority(cast(GtkTextTag*)this._cPtr, priority);
  }

  /**
      Connect to `Event` signal.
  
      The ::event signal is emitted when an event occurs on a region of the
        buffer marked with this tag.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gobject.object.ObjectWrap object, gdk.event.Event event, gtk.text_iter.TextIter iter, gtk.text_tag.TextTag textTag)`
  
          `object` the object the event was fired from (typically a #GtkTextView) (optional)
  
          `event` the event which triggered the signal (optional)
  
          `iter` a #GtkTextIter pointing at the location the event occurred (optional)
  
          `textTag` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being invoked for the
            event. false to propagate the event further.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gdk.event.Event)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gtk.text_iter.TextIter)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.text_tag.TextTag)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gtk.text_tag.TextTag.event");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
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

  /** */
  T background(string propval) nothrow
  {
    return setProperty("background", propval);
  }

  /** */
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
      Set `backgroundGdk` property.
      Params:
        propval = Background color as a #GdkColor.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkTextTag:background-rgba instead.
  */
  T backgroundGdk(gdk.color.Color propval) nothrow
  {
    return setProperty("background-gdk", propval);
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = Background color as a #GdkRGBA.
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

  /** */
  T direction(gtk.types.TextDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /** */
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

  /** */
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
          the internals of #PangoFontDescription.
      Returns: Builder instance for fluent chaining
  */
  T font(string propval) nothrow
  {
    return setProperty("font", propval);
  }

  /** */
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

  /** */
  T foreground(string propval) nothrow
  {
    return setProperty("foreground", propval);
  }

  /**
      Set `foregroundGdk` property.
      Params:
        propval = Foreground color as a #GdkColor.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkTextTag:foreground-rgba instead.
  */
  T foregroundGdk(gdk.color.Color propval) nothrow
  {
    return setProperty("foreground-gdk", propval);
  }

  /**
      Set `foregroundRgba` property.
      Params:
        propval = Foreground color as a #GdkRGBA.
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

  /** */
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

  /** */
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
        propval = The language this text is in, as an ISO code. Pango can use this as a
          hint when rendering the text. If not set, an appropriate default will be
          used.
          
          Note that the initial value of this property depends on the current
          locale, see also [gtk.global.getDefaultLanguage].
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

  /** */
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

  /** */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
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
      Set `paragraphBackgroundGdk` property.
      Params:
        propval = The paragraph background color as a #GdkColor.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkTextTag:paragraph-background-rgba instead.
  */
  T paragraphBackgroundGdk(gdk.color.Color propval) nothrow
  {
    return setProperty("paragraph-background-gdk", propval);
  }

  /**
      Set `paragraphBackgroundRgba` property.
      Params:
        propval = The paragraph background color as a #GdkRGBA.
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

  /** */
  T pixelsAboveLines(int propval) nothrow
  {
    return setProperty("pixels-above-lines", propval);
  }

  /** */
  T pixelsAboveLinesSet(bool propval) nothrow
  {
    return setProperty("pixels-above-lines-set", propval);
  }

  /** */
  T pixelsBelowLines(int propval) nothrow
  {
    return setProperty("pixels-below-lines", propval);
  }

  /** */
  T pixelsBelowLinesSet(bool propval) nothrow
  {
    return setProperty("pixels-below-lines-set", propval);
  }

  /** */
  T pixelsInsideWrap(int propval) nothrow
  {
    return setProperty("pixels-inside-wrap", propval);
  }

  /** */
  T pixelsInsideWrapSet(bool propval) nothrow
  {
    return setProperty("pixels-inside-wrap-set", propval);
  }

  /** */
  T rightMargin(int propval) nothrow
  {
    return setProperty("right-margin", propval);
  }

  /** */
  T rightMarginSet(bool propval) nothrow
  {
    return setProperty("right-margin-set", propval);
  }

  /** */
  T rise(int propval) nothrow
  {
    return setProperty("rise", propval);
  }

  /** */
  T riseSet(bool propval) nothrow
  {
    return setProperty("rise-set", propval);
  }

  /** */
  T scale(double propval) nothrow
  {
    return setProperty("scale", propval);
  }

  /** */
  T scaleSet(bool propval) nothrow
  {
    return setProperty("scale-set", propval);
  }

  /** */
  T size(int propval) nothrow
  {
    return setProperty("size", propval);
  }

  /** */
  T sizePoints(double propval) nothrow
  {
    return setProperty("size-points", propval);
  }

  /** */
  T sizeSet(bool propval) nothrow
  {
    return setProperty("size-set", propval);
  }

  /** */
  T stretch(pango.types.Stretch propval) nothrow
  {
    return setProperty("stretch", propval);
  }

  /** */
  T stretchSet(bool propval) nothrow
  {
    return setProperty("stretch-set", propval);
  }

  /** */
  T strikethrough(bool propval) nothrow
  {
    return setProperty("strikethrough", propval);
  }

  /**
      Set `strikethroughRgba` property.
      Params:
        propval = This property modifies the color of strikeouts. If not set, strikeouts
          will use the forground color.
      Returns: Builder instance for fluent chaining
  */
  T strikethroughRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("strikethrough-rgba", propval);
  }

  /**
      Set `strikethroughRgbaSet` property.
      Params:
        propval = If the #GtkTextTag:strikethrough-rgba property has been set.
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

  /** */
  T style(pango.types.Style propval) nothrow
  {
    return setProperty("style", propval);
  }

  /** */
  T styleSet(bool propval) nothrow
  {
    return setProperty("style-set", propval);
  }

  /** */
  T tabs(pango.tab_array.TabArray propval) nothrow
  {
    return setProperty("tabs", propval);
  }

  /** */
  T tabsSet(bool propval) nothrow
  {
    return setProperty("tabs-set", propval);
  }

  /** */
  T underline(pango.types.Underline propval) nothrow
  {
    return setProperty("underline", propval);
  }

  /**
      Set `underlineRgba` property.
      Params:
        propval = This property modifies the color of underlines. If not set, underlines
          will use the forground color.
          
          If #GtkTextTag:underline is set to [pango.types.Underline.Error], an alternate
          color may be applied instead of the foreground. Setting this property
          will always override those defaults.
      Returns: Builder instance for fluent chaining
  */
  T underlineRgba(gdk.rgba.RGBA propval) nothrow
  {
    return setProperty("underline-rgba", propval);
  }

  /**
      Set `underlineRgbaSet` property.
      Params:
        propval = If the #GtkTextTag:underline-rgba property has been set.
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

  /** */
  T variant(pango.types.Variant propval) nothrow
  {
    return setProperty("variant", propval);
  }

  /** */
  T variantSet(bool propval) nothrow
  {
    return setProperty("variant-set", propval);
  }

  /** */
  T weight(int propval) nothrow
  {
    return setProperty("weight", propval);
  }

  /** */
  T weightSet(bool propval) nothrow
  {
    return setProperty("weight-set", propval);
  }

  /** */
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
