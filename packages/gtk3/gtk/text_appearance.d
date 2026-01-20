/// Module for [TextAppearance] class
module gtk.text_appearance;

import gdk.color;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class TextAppearance
{
  GtkTextAppearance _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gtk.text_appearance.TextAppearance");

    _cInstance = *cast(GtkTextAppearance*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `bgColor` field.
      Returns: Background #GdkColor.
  */
  @property gdk.color.Color bgColor()
  {
    return cToD!(gdk.color.Color)(cast(void*)&(cast(GtkTextAppearance*)this._cPtr).bgColor);
  }

  /**
      Set `bgColor` field.
      Params:
        propval = Background #GdkColor.
  */
  @property void bgColor(gdk.color.Color propval)
  {
    (cast(GtkTextAppearance*)this._cPtr).bgColor = cast(GdkColor)propval;
  }

  /**
      Get `fgColor` field.
      Returns: Foreground #GdkColor.
  */
  @property gdk.color.Color fgColor()
  {
    return cToD!(gdk.color.Color)(cast(void*)&(cast(GtkTextAppearance*)this._cPtr).fgColor);
  }

  /**
      Set `fgColor` field.
      Params:
        propval = Foreground #GdkColor.
  */
  @property void fgColor(gdk.color.Color propval)
  {
    (cast(GtkTextAppearance*)this._cPtr).fgColor = cast(GdkColor)propval;
  }

  /**
      Get `rise` field.
      Returns: Super/subscript rise, can be negative.
  */
  @property int rise()
  {
    return (cast(GtkTextAppearance*)this._cPtr).rise;
  }

  /**
      Set `rise` field.
      Params:
        propval = Super/subscript rise, can be negative.
  */
  @property void rise(int propval)
  {
    (cast(GtkTextAppearance*)this._cPtr).rise = propval;
  }

  /**
      Get `underline` field.
      Returns: #PangoUnderline
  */
  @property uint underline()
  {
    return (cast(GtkTextAppearance*)this._cPtr).underline;
  }

  /**
      Set `underline` field.
      Params:
        propval = #PangoUnderline
  */
  @property void underline(uint propval)
  {
    (cast(GtkTextAppearance*)this._cPtr).underline = propval;
  }

  /**
      Get `strikethrough` field.
      Returns: Strikethrough style
  */
  @property uint strikethrough()
  {
    return (cast(GtkTextAppearance*)this._cPtr).strikethrough;
  }

  /**
      Set `strikethrough` field.
      Params:
        propval = Strikethrough style
  */
  @property void strikethrough(uint propval)
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
  @property uint drawBg()
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
  @property void drawBg(uint propval)
  {
    (cast(GtkTextAppearance*)this._cPtr).drawBg = propval;
  }

  /**
      Get `insideSelection` field.
      Returns: This are only used when we are actually laying
          out and rendering a paragraph; not when a #GtkTextAppearance is
          part of a #GtkTextAttributes.
  */
  @property uint insideSelection()
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
  @property void insideSelection(uint propval)
  {
    (cast(GtkTextAppearance*)this._cPtr).insideSelection = propval;
  }

  /**
      Get `isText` field.
      Returns: This are only used when we are actually laying
          out and rendering a paragraph; not when a #GtkTextAppearance is
          part of a #GtkTextAttributes.
  */
  @property uint isText()
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
  @property void isText(uint propval)
  {
    (cast(GtkTextAppearance*)this._cPtr).isText = propval;
  }
}
