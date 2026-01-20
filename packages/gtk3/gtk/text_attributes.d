/// Module for [TextAttributes] class
module gtk.text_attributes;

import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.text_appearance;
import gtk.types;
import pango.font_description;
import pango.language;
import pango.tab_array;

/**
    Using #GtkTextAttributes directly should rarely be necessary.
    It’s primarily useful with [gtk.text_iter.TextIter.getAttributes].
    As with most GTK+ structs, the fields in this struct should only
    be read, never modified directly.
*/
class TextAttributes : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_text_attributes_get_type != &gidSymbolNotFound ? gtk_text_attributes_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TextAttributes self()
  {
    return this;
  }

  /**
      Get `appearance` field.
      Returns: #GtkTextAppearance for text.
  */
  @property gtk.text_appearance.TextAppearance appearance()
  {
    return new gtk.text_appearance.TextAppearance(cast(GtkTextAppearance*)&(cast(GtkTextAttributes*)this._cPtr).appearance, No.Take);
  }

  /**
      Get `justification` field.
      Returns: #GtkJustification for text.
  */
  @property gtk.types.Justification justification()
  {
    return cast(gtk.types.Justification)(cast(GtkTextAttributes*)this._cPtr).justification;
  }

  /**
      Set `justification` field.
      Params:
        propval = #GtkJustification for text.
  */
  @property void justification(gtk.types.Justification propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).justification = cast(GtkJustification)propval;
  }

  /**
      Get `direction` field.
      Returns: #GtkTextDirection for text.
  */
  @property gtk.types.TextDirection direction()
  {
    return cast(gtk.types.TextDirection)(cast(GtkTextAttributes*)this._cPtr).direction;
  }

  /**
      Set `direction` field.
      Params:
        propval = #GtkTextDirection for text.
  */
  @property void direction(gtk.types.TextDirection propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).direction = cast(GtkTextDirection)propval;
  }

  /**
      Get `font` field.
      Returns: #PangoFontDescription for text.
  */
  @property pango.font_description.FontDescription font()
  {
    return cToD!(pango.font_description.FontDescription)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).font);
  }

  /**
      Set `font` field.
      Params:
        propval = #PangoFontDescription for text.
  */
  @property void font(pango.font_description.FontDescription propval)
  {
    cValueFree!(pango.font_description.FontDescription)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).font);
    dToC(propval, cast(void*)&(cast(GtkTextAttributes*)this._cPtr).font);
  }

  /**
      Get `fontScale` field.
      Returns: Font scale factor.
  */
  @property double fontScale()
  {
    return (cast(GtkTextAttributes*)this._cPtr).fontScale;
  }

  /**
      Set `fontScale` field.
      Params:
        propval = Font scale factor.
  */
  @property void fontScale(double propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).fontScale = propval;
  }

  /**
      Get `leftMargin` field.
      Returns: Width of the left margin in pixels.
  */
  @property int leftMargin()
  {
    return (cast(GtkTextAttributes*)this._cPtr).leftMargin;
  }

  /**
      Set `leftMargin` field.
      Params:
        propval = Width of the left margin in pixels.
  */
  @property void leftMargin(int propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).leftMargin = propval;
  }

  /**
      Get `rightMargin` field.
      Returns: Width of the right margin in pixels.
  */
  @property int rightMargin()
  {
    return (cast(GtkTextAttributes*)this._cPtr).rightMargin;
  }

  /**
      Set `rightMargin` field.
      Params:
        propval = Width of the right margin in pixels.
  */
  @property void rightMargin(int propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).rightMargin = propval;
  }

  /**
      Get `indent` field.
      Returns: Amount to indent the paragraph, in pixels.
  */
  @property int indent()
  {
    return (cast(GtkTextAttributes*)this._cPtr).indent;
  }

  /**
      Set `indent` field.
      Params:
        propval = Amount to indent the paragraph, in pixels.
  */
  @property void indent(int propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).indent = propval;
  }

  /**
      Get `pixelsAboveLines` field.
      Returns: Pixels of blank space above paragraphs.
  */
  @property int pixelsAboveLines()
  {
    return (cast(GtkTextAttributes*)this._cPtr).pixelsAboveLines;
  }

  /**
      Set `pixelsAboveLines` field.
      Params:
        propval = Pixels of blank space above paragraphs.
  */
  @property void pixelsAboveLines(int propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).pixelsAboveLines = propval;
  }

  /**
      Get `pixelsBelowLines` field.
      Returns: Pixels of blank space below paragraphs.
  */
  @property int pixelsBelowLines()
  {
    return (cast(GtkTextAttributes*)this._cPtr).pixelsBelowLines;
  }

  /**
      Set `pixelsBelowLines` field.
      Params:
        propval = Pixels of blank space below paragraphs.
  */
  @property void pixelsBelowLines(int propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).pixelsBelowLines = propval;
  }

  /**
      Get `pixelsInsideWrap` field.
      Returns: Pixels of blank space between wrapped lines in
          a paragraph.
  */
  @property int pixelsInsideWrap()
  {
    return (cast(GtkTextAttributes*)this._cPtr).pixelsInsideWrap;
  }

  /**
      Set `pixelsInsideWrap` field.
      Params:
        propval = Pixels of blank space between wrapped lines in
            a paragraph.
  */
  @property void pixelsInsideWrap(int propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).pixelsInsideWrap = propval;
  }

  /**
      Get `tabs` field.
      Returns: Custom #PangoTabArray for this text.
  */
  @property pango.tab_array.TabArray tabs()
  {
    return cToD!(pango.tab_array.TabArray)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).tabs);
  }

  /**
      Set `tabs` field.
      Params:
        propval = Custom #PangoTabArray for this text.
  */
  @property void tabs(pango.tab_array.TabArray propval)
  {
    cValueFree!(pango.tab_array.TabArray)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).tabs);
    dToC(propval, cast(void*)&(cast(GtkTextAttributes*)this._cPtr).tabs);
  }

  /**
      Get `wrapMode` field.
      Returns: #GtkWrapMode for text.
  */
  @property gtk.types.WrapMode wrapMode()
  {
    return cast(gtk.types.WrapMode)(cast(GtkTextAttributes*)this._cPtr).wrapMode;
  }

  /**
      Set `wrapMode` field.
      Params:
        propval = #GtkWrapMode for text.
  */
  @property void wrapMode(gtk.types.WrapMode propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).wrapMode = cast(GtkWrapMode)propval;
  }

  /**
      Get `language` field.
      Returns: #PangoLanguage for text.
  */
  @property pango.language.Language language()
  {
    return cToD!(pango.language.Language)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).language);
  }

  /**
      Set `language` field.
      Params:
        propval = #PangoLanguage for text.
  */
  @property void language(pango.language.Language propval)
  {
    cValueFree!(pango.language.Language)(cast(void*)(cast(GtkTextAttributes*)this._cPtr).language);
    dToC(propval, cast(void*)&(cast(GtkTextAttributes*)this._cPtr).language);
  }

  /**
      Get `invisible` field.
      Returns: Hide the text.
  */
  @property uint invisible()
  {
    return (cast(GtkTextAttributes*)this._cPtr).invisible;
  }

  /**
      Set `invisible` field.
      Params:
        propval = Hide the text.
  */
  @property void invisible(uint propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).invisible = propval;
  }

  /**
      Get `bgFullHeight` field.
      Returns: Background is fit to full line height rather than
           baseline +/- ascent/descent (font height).
  */
  @property uint bgFullHeight()
  {
    return (cast(GtkTextAttributes*)this._cPtr).bgFullHeight;
  }

  /**
      Set `bgFullHeight` field.
      Params:
        propval = Background is fit to full line height rather than
             baseline +/- ascent/descent (font height).
  */
  @property void bgFullHeight(uint propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).bgFullHeight = propval;
  }

  /**
      Get `editable` field.
      Returns: Can edit this text.
  */
  @property uint editable()
  {
    return (cast(GtkTextAttributes*)this._cPtr).editable;
  }

  /**
      Set `editable` field.
      Params:
        propval = Can edit this text.
  */
  @property void editable(uint propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).editable = propval;
  }

  /**
      Get `noFallback` field.
      Returns: Whether to disable font fallback.
  */
  @property uint noFallback()
  {
    return (cast(GtkTextAttributes*)this._cPtr).noFallback;
  }

  /**
      Set `noFallback` field.
      Params:
        propval = Whether to disable font fallback.
  */
  @property void noFallback(uint propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).noFallback = propval;
  }

  /**
      Get `letterSpacing` field.
      Returns: Extra space to insert between graphemes, in Pango units
  */
  @property int letterSpacing()
  {
    return (cast(GtkTextAttributes*)this._cPtr).letterSpacing;
  }

  /**
      Set `letterSpacing` field.
      Params:
        propval = Extra space to insert between graphemes, in Pango units
  */
  @property void letterSpacing(int propval)
  {
    (cast(GtkTextAttributes*)this._cPtr).letterSpacing = propval;
  }

  /**
      Creates a #GtkTextAttributes, which describes
      a set of properties on some text.
      Returns: a new #GtkTextAttributes,
            free with [gtk.text_attributes.TextAttributes.unref].
  */
  this()
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_attributes_new();
    this(_cretval, Yes.Take);
  }

  /**
      Copies src and returns a new #GtkTextAttributes.
      Returns: a copy of src,
            free with [gtk.text_attributes.TextAttributes.unref]
  */
  gtk.text_attributes.TextAttributes copy()
  {
    GtkTextAttributes* _cretval;
    _cretval = gtk_text_attributes_copy(cast(GtkTextAttributes*)this._cPtr);
    auto _retval = _cretval ? new gtk.text_attributes.TextAttributes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Copies the values from src to dest so that dest has
      the same values as src. Frees existing values in dest.
  
      Params:
        dest = another #GtkTextAttributes
  */
  void copyValues(gtk.text_attributes.TextAttributes dest)
  {
    gtk_text_attributes_copy_values(cast(GtkTextAttributes*)this._cPtr, dest ? cast(GtkTextAttributes*)dest._cPtr(No.Dup) : null);
  }
}
