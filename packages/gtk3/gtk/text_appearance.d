/// Module for [TextAppearance] class
module gtk.text_appearance;

public import gid.basictypes;
import gdk.color;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class TextAppearance
{
  GtkTextAppearance _cInstance;

  /**
      Create a `text_appearance.TextAppearance` wrap type.
      Params:
        bgColor = Background #GdkColor.
        fgColor = Foreground #GdkColor.
        rise = Super/subscript rise, can be negative.
        underline = #PangoUnderline
        strikethrough = Strikethrough style
        drawBg = Whether to use background-related values; this is
            irrelevant for the values struct when in a tag, but is used for
            the composite values struct; it’s true if any of the tags being
            composited had background stuff set.
        insideSelection = This are only used when we are actually laying
            out and rendering a paragraph; not when a #GtkTextAppearance is
            part of a #GtkTextAttributes.
        isText = This are only used when we are actually laying
            out and rendering a paragraph; not when a #GtkTextAppearance is
            part of a #GtkTextAttributes.
  */
  this(gdk.color.Color bgColor = gdk.color.Color.init, gdk.color.Color fgColor = gdk.color.Color.init, int rise = int.init, uint underline = uint.init, uint strikethrough = uint.init, uint drawBg = uint.init, uint insideSelection = uint.init, uint isText = uint.init) nothrow
  {
    this.bgColor = bgColor;
    this.fgColor = fgColor;
    this.rise = rise;
    this.underline = underline;
    this.strikethrough = strikethrough;
    this.drawBg = drawBg;
    this.insideSelection = insideSelection;
    this.isText = isText;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkTextAppearance*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `bgColor` field.
      Returns: Background #GdkColor.
  */
  @property gdk.color.Color bgColor() nothrow
  {
    return cToD!(gdk.color.Color)(cast(void*)&(cast(GtkTextAppearance*)this._cPtr).bgColor);
  }

  /**
      Set `bgColor` field.
      Params:
        propval = Background #GdkColor.
  */
  @property void bgColor(gdk.color.Color propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).bgColor = cast(GdkColor)propval;
  }

  /**
      Get `fgColor` field.
      Returns: Foreground #GdkColor.
  */
  @property gdk.color.Color fgColor() nothrow
  {
    return cToD!(gdk.color.Color)(cast(void*)&(cast(GtkTextAppearance*)this._cPtr).fgColor);
  }

  /**
      Set `fgColor` field.
      Params:
        propval = Foreground #GdkColor.
  */
  @property void fgColor(gdk.color.Color propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).fgColor = cast(GdkColor)propval;
  }

  /**
      Get `rise` field.
      Returns: Super/subscript rise, can be negative.
  */
  @property int rise() nothrow
  {
    return (cast(GtkTextAppearance*)this._cPtr).rise;
  }

  /**
      Set `rise` field.
      Params:
        propval = Super/subscript rise, can be negative.
  */
  @property void rise(int propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).rise = propval;
  }

  /**
      Get `underline` field.
      Returns: #PangoUnderline
  */
  @property uint underline() nothrow
  {
    return (cast(GtkTextAppearance*)this._cPtr).underline;
  }

  /**
      Set `underline` field.
      Params:
        propval = #PangoUnderline
  */
  @property void underline(uint propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).underline = propval;
  }

  /**
      Get `strikethrough` field.
      Returns: Strikethrough style
  */
  @property uint strikethrough() nothrow
  {
    return (cast(GtkTextAppearance*)this._cPtr).strikethrough;
  }

  /**
      Set `strikethrough` field.
      Params:
        propval = Strikethrough style
  */
  @property void strikethrough(uint propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).strikethrough = propval;
  }

  /**
      Get `drawBg` field.
      Returns: Whether to use background-related values; this is
          irrelevant for the values struct when in a tag, but is used for
          the composite values struct; it’s true if any of the tags being
          composited had background stuff set.
  */
  @property uint drawBg() nothrow
  {
    return (cast(GtkTextAppearance*)this._cPtr).drawBg;
  }

  /**
      Set `drawBg` field.
      Params:
        propval = Whether to use background-related values; this is
            irrelevant for the values struct when in a tag, but is used for
            the composite values struct; it’s true if any of the tags being
            composited had background stuff set.
  */
  @property void drawBg(uint propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).drawBg = propval;
  }

  /**
      Get `insideSelection` field.
      Returns: This are only used when we are actually laying
          out and rendering a paragraph; not when a #GtkTextAppearance is
          part of a #GtkTextAttributes.
  */
  @property uint insideSelection() nothrow
  {
    return (cast(GtkTextAppearance*)this._cPtr).insideSelection;
  }

  /**
      Set `insideSelection` field.
      Params:
        propval = This are only used when we are actually laying
            out and rendering a paragraph; not when a #GtkTextAppearance is
            part of a #GtkTextAttributes.
  */
  @property void insideSelection(uint propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).insideSelection = propval;
  }

  /**
      Get `isText` field.
      Returns: This are only used when we are actually laying
          out and rendering a paragraph; not when a #GtkTextAppearance is
          part of a #GtkTextAttributes.
  */
  @property uint isText() nothrow
  {
    return (cast(GtkTextAppearance*)this._cPtr).isText;
  }

  /**
      Set `isText` field.
      Params:
        propval = This are only used when we are actually laying
            out and rendering a paragraph; not when a #GtkTextAppearance is
            part of a #GtkTextAttributes.
  */
  @property void isText(uint propval) nothrow
  {
    (cast(GtkTextAppearance*)this._cPtr).isText = propval;
  }
}
